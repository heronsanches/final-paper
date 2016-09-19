package tcc.heronsanches.ufba.resource;

import com.pi4j.io.gpio.PinState;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.Json;
import javax.json.JsonObjectBuilder;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import tcc.heronsanches.ufba.resource.component.SensorObstacle;
import tcc.heronsanches.ufba.utils.Constants;
import tcc.heronsanches.ufba.utils.JSONUtils;
import tcc.heronsanches.ufba.interfaces.IObserverSensor;
import tcc.heronsanches.ufba.resource.component.SensorMass;
import tcc.heronsanches.ufba.utils.HttpConnection;


/**It represents an Elevator Resource.*/
@Path("elevator")
public class ElevatorResource{
       
    private static final String TYPE = "freight home intelligent elevator";
    
    /**the maximum mass capacity at Kg*/
    private static final double MAX_MASS = 0.200;
    
    /**width at m */
    private static final double WIDTH = 0.07;
    
    /**length at m, 0.007m is the length of the door */
    private static final double LENGTH = 0.118;
    
    //private static final double LENGTH_DOOR = 0.007;
    
    /**height at m */
    private static final double HEIGHT = 0.097;
    
    /**indicates if the elevator is moving*/
    private static boolean moving;
    
    /**indicates the actual floor*/
    private static byte floor;
  
    private static boolean on = true;
    
    private static final IObserverSensor OBSERVER = new IObserverSensor() {
        
        @Override
        public void alertSensor(Object type, Object info) {
            if(type instanceof SensorObstacle){
                //TODO
                if(PinState.LOW == (PinState)info)
                    Logger.getLogger(ElevatorResource.class.getName()).log(Level.INFO, "obstacle sensor: obstacle detected ");
                else
                    Logger.getLogger(ElevatorResource.class.getName()).log(Level.INFO, "obstacle sensor: no obstacle detected ");
                
            }else if( type instanceof SensorMass){
                //TODO
            }
        }
        
    };
    
    private static final SensorObstacle ESO = new SensorObstacle(ElevatorResource.OBSERVER, 0.02, 0.30, 0.02, 35, SensorObstacle.GPIO_I_ELEVATOR_BOTTOM_DOOR.getName()); //TODO probably elevator must have at least 2 sensors of obstacle;
    private static final SensorMass ESM = new SensorMass(ElevatorResource.OBSERVER, 50.0);
        
    
    /**inform general an actual info about the elevator, e.g., requisites to work how maxMass... and actual states variables.*/
    @GET
    @Path("actual-info")
    @Produces(MediaType.APPLICATION_JSON)
    public String getActualInfo(){
        
        JsonObjectBuilder job = Json.createObjectBuilder();
        job.add("on", ElevatorResource.on);
        job.add("moving", ElevatorResource.moving);
        job.add("floor", ElevatorResource.floor);
        job.add("maxMass", ElevatorResource.MAX_MASS);
        job.add("mass", ElevatorResource.ESM.getActualMass());
        job.add("width", ElevatorResource.WIDTH);
        job.add("length", ElevatorResource.LENGTH);
        //job.add("length_door", ElevatorResource.LENGTH_DOOR);
        job.add("height", ElevatorResource.HEIGHT);
        job.add("obstacleSensor", ElevatorResource.ESO.isPresence());
        job.add("timestamp", new Timestamp(System.currentTimeMillis()).toString());
        job.add("description", ElevatorResource.TYPE);
        JsonObjectBuilder job2 = Json.createObjectBuilder();

        return JSONUtils.getJsonString(job2.add(Constants.STATUS, Constants.OK)
                .add(Constants.MESSAGE, job.build()).build());
        
    }
    
    
    @PUT
    @Path("take-freight")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String takeFreight(){
        Logger.getLogger(ElevatorResource.class.getName()).log(Level.INFO, "takeFreight elevator resource");
        JsonObjectBuilder job = Json.createObjectBuilder();
        
        JsonObjectBuilder observer = Json.createObjectBuilder();
        observer.add("observer", HttpConnection.PATH_RESOURCE_RASPBERRY+"elevator/observer-claw-finished");
        observer.add("parameter", "");
        observer.add("method", HttpConnection.METHOD_PUT);
        //verifying if the claw has some thing on your area to take and fire the claw!
        String result = HttpConnection.makePutRequest(HttpConnection.PATH_RESOURCE_RASPBERRY+"claw/claw-take", observer.build().toString());
        Logger.getLogger(ElevatorResource.class.getName()).log(Level.INFO, "result: "+result);

        if(result != null)
            return result;
           
        return JSONUtils.getJsonString(job.add(Constants.STATUS, Constants.ERROR).build());
        
    }
    
    
    @PUT
    @Produces(MediaType.APPLICATION_JSON)
    @Path("observer-claw-finished")
    public String clawFinished(){
    Logger.getLogger(ElevatorResource.class.getName()).log(Level.INFO, "clawFinished elevator resource");
        JsonObjectBuilder job = Json.createObjectBuilder();
				
		//TODO elevator take the freight and informs when finishes the operation
        if(!ElevatorResource.ESO.isPresence()){ //no obstacle on elevator door
            
            job.add(Constants.STATUS, Constants.OK);
            job.add(Constants.MESSAGE, Json.createObjectBuilder().add(Constants.MESSAGE, "elevator is taking the object").build());
            HttpConnection.makePutRequest(HttpConnection.PATH_RESOURCE_FIM+"system/observer-execution-freight", job.build().toString());
            
        /*}else if(ElevatorResource.ESM.getActualMass() == 0){
            
            job.add(Constants.STATUS, Constants.ERROR);
            job.add(Constants.MESSAGE, Json.createObjectBuilder().add(Constants.MESSAGE, "nothing into the elevator").build());
            HttpConnection.makePutRequest(HttpConnection.PATH_RESOURCE_FIM+"system/observer-execution-freight", job.build().toString());
          */  
        }else{

            //TODO here can happened other side effect if into the basket has something exceeding the elevator door 
            job.add(Constants.STATUS, Constants.ERROR);
            job.add(Constants.MESSAGE, Json.createObjectBuilder().add(Constants.MESSAGE, "elevator door obstructed").build());
            HttpConnection.makePutRequest(HttpConnection.PATH_RESOURCE_FIM+"system/observer-execution-freight", job.build().toString());
            
        }
            
        return JSONUtils.getJsonString(job.add(Constants.STATUS, Constants.OK).build()); //message sent to subject
        
    }

    
}