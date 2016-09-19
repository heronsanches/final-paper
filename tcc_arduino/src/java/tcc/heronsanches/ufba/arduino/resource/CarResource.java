package tcc.heronsanches.ufba.arduino.resource;

import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.Json;
import javax.json.JsonObjectBuilder;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import tcc.heronsanches.ufba.arduino.resource.component.SensorDistance;
import tcc.heronsanches.ufba.arduino.resource.component.SensorMass;
import tcc.heronsanches.ufba.arduino.resource.component.SensorObstacle;
import tcc.heronsanches.ufba.arduino.utils.ConnectArduino;
import tcc.heronsanches.ufba.arduino.utils.Constants;
import tcc.heronsanches.ufba.arduino.utils.JSONUtils;
import tcc.heronsanches.ufba.arduino.interfaces.SensorObserver;
import tcc.heronsanches.ufba.arduino.utils.HttpConnection;
import tcc.heronsanches.ufba.arduino.utils.SerialMessageToArduino;


@Path("car")
public class CarResource{
    
    //private static boolean on = true;
    private static final String TYPE = "freight home intelligent car";
    
    /**the maximum mass capacity at Kg*/
    private static final double MAX_MASS = 0.9;
    
    /**width, length and height at m */
    private static final double WIDTH = 0.147;
    private static final double LENGTH = 0.105;
    private static final double HEIGHT = 0.097;
    
    /**indicates if the car is moving*/
    private static boolean moving;
    private static String responseArduino;
    private static boolean initialized;
    
    private static final SensorObserver SENSOR_OBSERVER  = new SensorObserver() {
        
        
        @Override
        public void alertSensor(Object type, Object info) {
            
            if(type instanceof SensorDistance){

                if(CarResource.csd.getActualDistanceDetection() < 0.07){
                    //TODO stop the car
                    HttpConnection.makePutRequest(HttpConnection.PATH_RESOURCE_FIM+"system/observer-car-hit-destination");
                }
                
            }else if(type instanceof SensorMass){
                //TODO
            }else if(type instanceof SensorObstacle){
                //TODO
            }     
            
        }

        
        @Override
        public void responseArduino(String responseArduino) {
            CarResource.responseArduino = responseArduino; 
        }

        
    };
    
    private static final SensorDistance csd = new SensorDistance(CarResource.SENSOR_OBSERVER, 0.02, 4.50, 15.0);
    private static final SensorMass csm = new SensorMass(CarResource.SENSOR_OBSERVER, 50.0);
    private static final SensorObstacle cso = new SensorObstacle(CarResource.SENSOR_OBSERVER, 0.02, 0.30, 0.02, 35.0);
    
    
    public CarResource(){
        
        if(!initialized){
            
            CarResource.initialized = true;
            ConnectArduino.addObserver(CarResource.SENSOR_OBSERVER);
            
        }

    }
        
    
    @GET
    @Path("actual-info")
    @Produces(MediaType.APPLICATION_JSON)
    public String getActualInfo(@QueryParam ("id_basket") String id_basket){
        
        JsonObjectBuilder job = Json.createObjectBuilder();
        JsonObjectBuilder job2 = Json.createObjectBuilder();
        //job.add("on", CarResource.on);
        job.add("moving", CarResource.moving);
        job.add("maxMass", CarResource.MAX_MASS);
        //job.add("mass", CarResource.csm.getActualMass());
        job.add("width", CarResource.WIDTH);
        job.add("length", CarResource.LENGTH);
        job.add("height", CarResource.HEIGHT);
        job.add("obstacleSensor", CarResource.cso.isPresence());
        job.add("distanceSensor", CarResource.csd.getActualDistanceDetection());
        job.add("timestamp", new Timestamp(System.currentTimeMillis()).toString());
        job.add("description", CarResource.TYPE);

        return JSONUtils.getJsonString(job2.add("car", job.build())
                .add("basket", HttpConnection.makeGetRequest(HttpConnection.PATH_RESOURCE_FIM+"system/basket?id_basket="+id_basket)) //it is used to simulates the itens on car that has to be passed to FIM
                .add(Constants.STATUS, Constants.OK).build());
        
    }    
    
    
    @PUT
    @Path("go-to-elevator")
    @Produces(MediaType.APPLICATION_JSON)
    public String goToElevator(){
        
        JsonObjectBuilder job = Json.createObjectBuilder();

        try {
            
            CarResource.responseArduino = "";
            //TODO analyze the objects before go to elevator
            ConnectArduino.getSerialConnection().writeSerial(SerialMessageToArduino.R_CAR_GO_TO_ELEVATOR);
            Thread.sleep(300); //TODO it could be in a better way!
            
            if(!CarResource.responseArduino.isEmpty())
                return JSONUtils.getJsonString(job.add(Constants.STATUS, Constants.OK)
                        .add(Constants.MESSAGE, CarResource.responseArduino).build());
            else
                return JSONUtils.getJsonString(job.add(Constants.STATUS, Constants.ERROR)
                        .add(Constants.MESSAGE, CarResource.responseArduino).build());
            
        } catch (InterruptedException ex) {
            Logger.getLogger(CarResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return JSONUtils.getJsonString(job.add(Constants.STATUS, Constants.ERROR).build());
        
    }
       
        
}