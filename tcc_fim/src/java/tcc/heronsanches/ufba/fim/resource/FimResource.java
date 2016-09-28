package tcc.heronsanches.ufba.fim.resource;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.concurrent.ExecutorService;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.container.AsyncResponse;
import javax.ws.rs.container.Suspended;
import javax.ws.rs.core.MediaType;
import tcc.heronsanches.ufba.fim.db.DBFacade;
import tcc.heronsanches.ufba.fim.db.pojo.Item;
import tcc.heronsanches.ufba.fim.utils.Constants;
import tcc.heronsanches.ufba.fim.utils.HttpConnection;
import tcc.heronsanches.ufba.fim.utils.JSONUtils;
import tcc.heronsanches.ufba.fim.utils.MultilayerPerceptronWeka;
import tcc.heronsanches.ufba.fim.utils.WriteReadObjects;


@Path("system")
public class FimResource { 
    
    private static long idTuple;
    
    
    private Runnable runElevatorFreight  = new Runnable(){
        
        @Override
        public void run() {
            Logger.getLogger(FimResource.class.getName()).log(Level.INFO, "runElevatorFreight");
            //elevator will verifying if exists the freight on perimeter of claw
            RequestAnswer raElevator = new RequestAnswer(RequestAnswer.PATH_RESOURCE_RASPBERRY+"elevator/take-freight", HttpConnection.METHOD_PUT);
            String result = HttpConnection.makePutRequest(raElevator.getRequestPath());
            raElevator.setAnswer(result);
            WriteReadObjects.addRecord(raElevator);

            if(result != null){

                JsonObject jo = JSONUtils.convertStringtoJSON(result);

                if(jo.getInt(Constants.STATUS) != Constants.OK){
                    //TODO some problem
                }else if(jo.getInt(Constants.STATUS) == Constants.OK){
                    //claw was fired
                }

            }else
                 ;//TODO some problem
           
        }
        
    };
        
    
    @GET
    @Path("dataset-weka")
    @Produces(MediaType.TEXT_PLAIN)
    public String datasetWeka(){
        return DBFacade.generatesDatasetWeka();
    }
    
    
    /**@return json object {"basket":[array of {@linkplain Item}]}  */
    @GET
    @Path("basket")
    @Produces(MediaType.TEXT_PLAIN)
    public String getBasket(@QueryParam("id_basket") String idBasket){  //used to simulate the data passed from car to FIM
        
        PrintWriter writer = null;
        
        try {

            writer = new PrintWriter("instanceToAnalysing.arff", "UTF-8");
            writer.print(DBFacade.getBasket(Long.valueOf(idBasket)));
            writer.close();
            return "instanceToAnalysing.arff";
            
        } catch (FileNotFoundException ex) {
            Logger.getLogger(FimResource.class.getName()).log(Level.SEVERE, null, ex);
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(FimResource.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            writer.close();
        }
        
        return "";
        
    }
    
    
    /**train network and saves the classifier*/
    @PUT
    @Path("training-network")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.TEXT_PLAIN)
    public String trainingNetwork(String json){   

        JsonObject jo = JSONUtils.convertStringtoJSON(json);
        return MultilayerPerceptronWeka.trainingNetwork(jo.getString("pathToArrf"));
        
    }
    
    
    private final ExecutorService executorService = java.util.concurrent.Executors.newCachedThreadPool();

    /**returns info about testing*/
    @PUT
    @Path(value = "testing-network")
    @Consumes(value = MediaType.APPLICATION_JSON)
    @Produces(value = MediaType.TEXT_PLAIN)
    public void testingNetwork(@Suspended final AsyncResponse asyncResponse, final String json) {
        
        executorService.submit(new Runnable() {
            
            @Override
            public void run() {
                asyncResponse.resume(doTestingNetwork(json));
            }
            
        });
        
    }

    private String doTestingNetwork(String json) {
        
        try {
            
            JsonObject jo = JSONUtils.convertStringtoJSON(json);
            return MultilayerPerceptronWeka.testingNetwork(jo.getString("pathToArrf"));
            
        } catch (Exception ex) {
            Logger.getLogger(FimResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return "error!";
        
    }
    
 
    /**@param param: {"id_basket":long}. It is used to simulate the things on car, the car take this parameter and 
     * get from database the things info that is on them and return it to FIM.*/
    @PUT
    @Path("take-freight")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String takeFreight(String param){
        
        JsonObjectBuilder job = Json.createObjectBuilder();
        
        if(FimResource.idTuple != 0){ //service already at executing
            
            //send a notification to the mobile app client
            JsonObjectBuilder pushNotification = Json.createObjectBuilder();
            pushNotification.add("to", DBFacade.getToken(1));
            //Logger.getLogger(FimResource.class.getName()).log(Level.INFO, "token::::"+DBFacade.getToken(1));
            JsonObjectBuilder data = Json.createObjectBuilder();
            data.add("message", "Service already at executing.");
            data.add("service", "Freight Home Service");

            pushNotification.add("data", data.build());	
            String parameter = pushNotification.build().toString();
            String resultGcm = HttpConnection.makePostRequestGcm(parameter);

            if(JSONUtils.convertStringtoJSON(resultGcm).getInt("success") == 1) //one message was processed correctly on GCM							
                ;//Logger.getLogger(FimResource.class.getName()).log(Level.INFO, "gcm sent");
            
            return JSONUtils.getJsonString(job.add(Constants.STATUS, Constants.ERROR)
                .add(Constants.MESSAGE, "Service already at executing.").build());
                        
        }
        
        JsonObject jop = JSONUtils.convertStringtoJSON(param);
        Long idBasket = jop.getJsonNumber("id_basket").longValue();
        RequestAnswer ra1 = new RequestAnswer(RequestAnswer.PATH_RESOURCE_FIM+"system/take-freight", HttpConnection.METHOD_PUT);
        RequestAnswer ra2 = new RequestAnswer(RequestAnswer.PATH_RESOURCE_RASPBERRY+"elevator/actual-info", HttpConnection.METHOD_GET);
        RequestAnswer ra3;
        RequestAnswer ra4;
        FimResource.idTuple = DBFacade.insertTuple();
        
        String result = HttpConnection.makeGetRequest(ra2.getRequestPath());
        ra2.setAnswer(result);
        WriteReadObjects.addRecord(ra2);
        DBFacade.insertRequestAnswer(ra2, FimResource.idTuple);
        
        if(result != null){
            
            JsonObject joEl = JSONUtils.convertStringtoJSON(result);
            
            if(joEl != null){
                
                if(joEl.getInt(Constants.STATUS) == Constants.OK){

                    joEl = joEl.getJsonObject(Constants.MESSAGE); //info elevator
                    ra3 = new RequestAnswer(RequestAnswer.PATH_RESOURCE_ARDUINO+"car/actual-info", HttpConnection.METHOD_GET, String.valueOf(idBasket));
                    result = HttpConnection.makeGetRequest(ra3.getRequestPath()+"?id_basket="+idBasket);
                    ra3.setAnswer(result);
                    WriteReadObjects.addRecord(ra3);
                    DBFacade.insertRequestAnswer(ra3, FimResource.idTuple);
                    
                    if(result != null){
                        
                        JsonObject joCar = JSONUtils.convertStringtoJSON(result);
                        
                        if(joCar != null){
                            
                            if(joCar.getInt(Constants.STATUS) == Constants.OK){
                                
                                String basketFileName = joCar.getString("basket");
                                joCar = joCar.getJsonObject("car"); //info car

                                //compare the info of the elevator and car for verifying if it is acceptable to allow this service
                                /*if(joEl.getJsonNumber("maxMass").doubleValue() >= joCar.getJsonNumber("maxMass").doubleValue()
                                    && !joCar.getBoolean("moving") && !joCar.getBoolean("obstacleSensor")){*/
                                    
                                    //verifying if is sidde effect! TODO uncomment it when put in production!
                                    /*if(MultilayerPerceptronWeka.isSideEffect(basketFileName)){
                                        
                                        FimResource.idTuple = 0;
                                        
                                        //send a notification to the mobile app client
                                        JsonObjectBuilder pushNotification = Json.createObjectBuilder();
                                        pushNotification.add("to", DBFacade.getToken(1));
                                        //Logger.getLogger(FimResource.class.getName()).log(Level.INFO, "token::::"+DBFacade.getToken(1));
                                        JsonObjectBuilder data = Json.createObjectBuilder();
                                        data.add("message", "Sidde effect detected! Please veryfies the itens on car, maybe there are a lot of them.");
                                        data.add("service", "Freight Home Service");

                                        pushNotification.add("data", data.build());	
                                        String parameter = pushNotification.build().toString();
                                        String resultGcm = HttpConnection.makePostRequestGcm(parameter);

                                        if(JSONUtils.convertStringtoJSON(resultGcm).getInt("success") == 1) //one message was processed correctly on GCM							
                                            ;//Logger.getLogger(FimResource.class.getName()).log(Level.INFO, "gcm sent");
                                        
                                        return JSONUtils.getJsonString(job.add(Constants.STATUS, Constants.ERROR)
                                            .add(Constants.MESSAGE, "Sidde effect detected! Please veryfies the itens on car, maybe there are a lot of them.").build());
                                        
                                    }*/
                                    
                                    ra4 = new RequestAnswer(RequestAnswer.PATH_RESOURCE_ARDUINO+"car/go-to-elevator", HttpConnection.METHOD_PUT);
                                    result = HttpConnection.makePutRequest(ra4.getRequestPath());
                                    ra4.setAnswer(result);
                                    WriteReadObjects.addRecord(ra4);
                                    DBFacade.insertRequestAnswer(ra4, FimResource.idTuple);

                                    if(result != null){

                                        joCar = JSONUtils.convertStringtoJSON(result);

                                        if(joCar != null && joCar.getInt(Constants.STATUS) == Constants.OK){

                                            String answer = JSONUtils.getJsonString(job.add(Constants.STATUS, Constants.OK)
                                                    .add(Constants.MESSAGE, Json.createObjectBuilder().add("message", Constants.SERVICE_ACTIVATED)).build());
                                            ra1.setAnswer(answer);
                                            WriteReadObjects.addRecord(ra1);
                                            DBFacade.insertRequestAnswer(ra1, FimResource.idTuple);
                                            return answer; 

                                        }
                                        
                                        String answer = JSONUtils.getJsonString(job.add(Constants.STATUS, Constants.ERROR)
                                                .add(Constants.MESSAGE, Json.createObjectBuilder()
                                                        .add("message", "the car service can not be fired")
                                                        .add("reason", "")).build());
                                        
                                        ra1.setAnswer(answer);
                                        WriteReadObjects.addRecord(ra1);
                                        DBFacade.insertRequestAnswer(ra1, FimResource.idTuple);
                                        return answer; 
                                        
                                    }
                                    
                                //}
                                
                                /*String answer = JSONUtils.getJsonString(job.add(Constants.STATUS, Constants.ERROR)
                                        .add(Constants.MESSAGE, Json.createObjectBuilder()
                                                .add("message", "operation not allowed")
                                                .add("reason", "constraints between elevator and car")).build());*/
                                
                                String answer = JSONUtils.getJsonString(job.add(Constants.STATUS, Constants.ERROR)
                                        .add(Constants.MESSAGE, Json.createObjectBuilder()
                                                .add("message", "unknown")
                                                .add("reason", "unknown")).build());
                                
                                ra1.setAnswer(answer);
                                WriteReadObjects.addRecord(ra1);
                                DBFacade.insertRequestAnswer(ra1, FimResource.idTuple);
                                FimResource.idTuple = 0;
                                return answer;
                                
                            }      
                            
                        }
                        
                    }

                }
                
            }
            
        }
        
        String answer = JSONUtils.getJsonString(job.add(Constants.STATUS, Constants.ERROR)
                .add(Constants.MESSAGE, Json.createObjectBuilder()
                        .add("message", "unknown")
                        .add("reason", "unknown")).build());
                                
        ra1.setAnswer(answer);
        WriteReadObjects.addRecord(ra1);
        DBFacade.insertRequestAnswer(ra1, FimResource.idTuple);
        return answer;

        /* -when car coming in elevator, car warns to fim
          -fim fires elevator
          -elevator fires claw*/
        
    }
    
    
    @Path("observer-car-hit-destination")
    @PUT
    @Produces(MediaType.APPLICATION_JSON)
    public String carHitDestination(){ //it method is fired when car hit your destination
        
        JsonObjectBuilder job = Json.createObjectBuilder();
        RequestAnswer ra1 = new RequestAnswer(RequestAnswer.PATH_RESOURCE_FIM+"system/client-fcm-update-token", HttpConnection.METHOD_PUT);        
        String answer = JSONUtils.getJsonString(job.add(Constants.STATUS, Constants.OK).build());                               
        ra1.setAnswer(answer);
        WriteReadObjects.addRecord(ra1);
        DBFacade.insertRequestAnswer(ra1, FimResource.idTuple);
        new Thread(runElevatorFreight).run();
        return answer;
        
    }
    
    
    @Path("client-fcm-update-token")
    @PUT
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public String updateTokenFcmClient(String client){
        
        JsonObjectBuilder job = Json.createObjectBuilder();
        RequestAnswer ra1 = new RequestAnswer(RequestAnswer.PATH_RESOURCE_FIM+"system/client-fcm-update-token", HttpConnection.METHOD_PUT); 
        JsonObject jo = JSONUtils.convertStringtoJSON(client);
        String answer;
        
        if(DBFacade.updateToken(jo) == 1)
            answer = JSONUtils.getJsonString(job.add(Constants.STATUS, Constants.OK).build());                               
        else
            answer = JSONUtils.getJsonString(job.add(Constants.STATUS, Constants.ERROR).build());
        
        ra1.setAnswer(answer);
        WriteReadObjects.addRecord(ra1);
        DBFacade.insertRequestAnswer(ra1, FimResource.idTuple);
        return answer;
        
    }
    
    
    @Path("observer-execution-freight")
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String finalExecutionFreight(String subjectAnswer){ //it method is fired when take freight execution is finished

        //TODO ReceivedRequestAnswer
        JsonObjectBuilder job = Json.createObjectBuilder();
        JsonObject jo = JSONUtils.convertStringtoJSON(subjectAnswer);
        RequestAnswer ra1 = new RequestAnswer(RequestAnswer.PATH_RESOURCE_FIM+"system/observer-execution-freight", HttpConnection.METHOD_PUT, subjectAnswer);

        try {
            
            if(jo.getInt(Constants.STATUS) == Constants.OK){
            
                if(jo.getJsonObject(Constants.MESSAGE).getString(Constants.MESSAGE).equals("elevator is taking the object")){
                    
                    //send a notification to the mobile app client
                    JsonObjectBuilder pushNotification = Json.createObjectBuilder();
                    pushNotification.add("to", DBFacade.getToken(1));
                    //Logger.getLogger(FimResource.class.getName()).log(Level.INFO, "token::::"+DBFacade.getToken(1));
                    JsonObjectBuilder data = Json.createObjectBuilder();
                    data.add("message", "elevator is taking the object");
                    data.add("service", "Freight Home Service");

                    pushNotification.add("data", data.build());	
                    String parameter = pushNotification.build().toString();
                    String resultGcm = HttpConnection.makePostRequestGcm(parameter);
                    RequestAnswer ra2 = new RequestAnswer(HttpConnection.WEBSERVER_GCM, HttpConnection.METHOD_POST, parameter);
                    ra2.setAnswer(resultGcm);
                    ra2.setSiddeEffect(false);
                    WriteReadObjects.addRecord(ra2);
                    DBFacade.insertRequestAnswer(ra2, FimResource.idTuple);
                    
                    if(JSONUtils.convertStringtoJSON(resultGcm).getInt("success") == 1) //one message was processed correctly on GCM							
                        ;//Logger.getLogger(FimResource.class.getName()).log(Level.INFO, "gcm sent");
                    
                }
            
            }else if(jo.getInt(Constants.STATUS) == Constants.ERROR){

                //TODO something not expected occured
                if(jo.getJsonObject(Constants.MESSAGE).getString(Constants.MESSAGE).equals("elevator door obstructed")){
                   
                    //send a notification to the mobile app client
                    JsonObjectBuilder pushNotification = Json.createObjectBuilder();
                    pushNotification.add("to", DBFacade.getToken(1));
                    //Logger.getLogger(FimResource.class.getName()).log(Level.INFO, "token::::"+DBFacade.getToken(1));
                    JsonObjectBuilder data = Json.createObjectBuilder();
                    data.add("message", "elevator door obstructed");
                    data.add("service", "Freight Home Service");

                    pushNotification.add("data", data.build());						
                    String resultGcm = HttpConnection.makePostRequestGcm(pushNotification.build().toString());
                    RequestAnswer ra2 = new RequestAnswer(HttpConnection.WEBSERVER_GCM, HttpConnection.METHOD_POST, pushNotification.build().toString());
                    ra2.setAnswer(resultGcm);
                    ra2.setSiddeEffect(true);
                    WriteReadObjects.addRecord(ra2);
                    DBFacade.insertRequestAnswer(ra2, idTuple);
                    DBFacade.updateTuple(true, FimResource.idTuple);

                    if(JSONUtils.convertStringtoJSON(resultGcm).getInt("success") == 1) //one message was processed correctly on GCM							
                        ;//Logger.getLogger(FimResource.class.getName()).log(Level.INFO, "gcm sent");
                    
                }else
                    ;//TODO "nothing into the elevator"
                    //write request/answer and informs to the smartphone caller
            }
            
        } catch (Exception e) {
            Logger.getLogger(FimResource.class.getName()).log(Level.SEVERE, null, e);
        }
        
        String answerToSubject = JSONUtils.getJsonString(job.add(Constants.STATUS, Constants.OK).build());
        ra1.setAnswer(subjectAnswer);
        WriteReadObjects.addRecord(ra1);
        DBFacade.insertRequestAnswer(ra1, FimResource.idTuple);
        FimResource.idTuple = 0; //TODO it could assigning it value only when elevator hit to your destination
        return answerToSubject;
        
    }
    
    
}