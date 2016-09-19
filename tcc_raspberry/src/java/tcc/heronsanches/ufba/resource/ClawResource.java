package tcc.heronsanches.ufba.resource;

import com.pi4j.io.gpio.GpioPinPwmOutput;
import com.pi4j.io.gpio.RaspiPin;
import com.pi4j.wiringpi.Gpio;
import com.pi4j.wiringpi.SoftPwm;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.ws.rs.Consumes;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import tcc.heronsanches.ufba.interfaces.IObserverSensor;
import tcc.heronsanches.ufba.resource.component.SensorObstacle;
import tcc.heronsanches.ufba.utils.Constants;
import tcc.heronsanches.ufba.utils.GpioUtils;
import tcc.heronsanches.ufba.utils.HttpConnection;
import tcc.heronsanches.ufba.utils.JSONUtils;
import tcc.heronsanches.ufba.utils.RequestObserver;

@Path("claw")
public class ClawResource{
    
    private static boolean on = true;
    //private static boolean onOperation;
    
    //OBS.: Do not use the same PWM for differents devices that want to receive diferents pulses, for example, "raspberry pi 3" has two pins "PWM0" and two pins "PWM1".
    //If you want send differents pulses for two devices use one connected to ones of two "PWM0" and the other on one of two "PWM1".
    //If you need send more than two differents pulses to more than two devices you can do this using general GPIOs, for achieve it use SoftPwm.
    //private static final List<IObserverSensor> OBSERVER_LIST = new ArrayList<>();
    private static final GpioPinPwmOutput CS_LEFT_RIGHT = GpioUtils.GPIO.provisionPwmOutputPin(RaspiPin.GPIO_01, "CLAW_SERVO_LEFT_RIGHT");
    private static final GpioPinPwmOutput CS_OPEN_CLOSE = GpioUtils.GPIO.provisionPwmOutputPin(RaspiPin.GPIO_24, "CLAW_SERVO_OPEN_CLOSE");
    private static final int CS_FRONT_BACK = RaspiPin.GPIO_04.getAddress(); //CLAW_SERVO_FRONT_BACK
    private static final int CLAW_OPEN = 78;
    private static final int CLAW_CLOSE = 88;
    private static final int CLAW_RIGHT = 21;
    private static final int CLAW_LEFT = 115;
    private static final int CLAW_MIDDLE = 66;
    private static final int CLAW_GO_BACK = 10;
    private static final int CLAW_GO_FRONT = 14;
    
    private static final Runnable clawRunnable = new Runnable() {
        
        @Override
        public void run() {
            
            try {
                
                //pwmFrequency in Hz = 19.2e6 Hz / pwmClock / pwmRange
                //applying the formule above the result is 50Hz, for the below values 
                //ClawResource.onOperation = true;
                Gpio.pwmSetMode(Gpio.PWM_MODE_MS);
                Gpio.pwmSetRange(1000);  //duty cicle range
                Gpio.pwmSetClock(384);//frenquency divisor, together with the pwmRange
                SoftPwm.softPwmCreate(ClawResource.CS_FRONT_BACK, 0, 100);
                
                //beginning at middle
                for(int i = ClawResource.CLAW_MIDDLE; i >= ClawResource.CLAW_RIGHT; i--){ //move claw to right all
                    
                    ClawResource.CS_LEFT_RIGHT.setPwm(i);
                    Thread.sleep(20);
                    
                }
                ClawResource.CS_LEFT_RIGHT.setPwm(0);
                
                ClawResource.CS_OPEN_CLOSE.setPwm(ClawResource.CLAW_OPEN); //open claw
                Thread.sleep(800);
                ClawResource.CS_OPEN_CLOSE.setPwm(0);
                int until = ClawResource.CLAW_GO_FRONT-2;
                for(int i = ClawResource.CLAW_GO_BACK; i <= until; i++){ //move claw to go to front
                    
                    SoftPwm.softPwmWrite(ClawResource.CS_FRONT_BACK, i);
                    Thread.sleep(70);
                    
                }
                SoftPwm.softPwmWrite(ClawResource.CS_FRONT_BACK, 0);
                Thread.sleep(1000);

                ClawResource.CS_OPEN_CLOSE.setPwm(ClawResource.CLAW_CLOSE); //close claw
                Thread.sleep(800);
                ClawResource.CS_OPEN_CLOSE.setPwm(0);
                
                for(int i = ClawResource.CLAW_GO_FRONT; i >= ClawResource.CLAW_GO_BACK; i--){  //move claw to go back
                    
                    SoftPwm.softPwmWrite(ClawResource.CS_FRONT_BACK, i);
                    Thread.sleep(70);
                    
                }
                SoftPwm.softPwmWrite(ClawResource.CS_FRONT_BACK, 0);
                
                for(int i = ClawResource.CLAW_RIGHT; i <= ClawResource.CLAW_LEFT; i++){ //go to left all
                    
                    ClawResource.CS_LEFT_RIGHT.setPwm(i); 
                    Thread.sleep(20);
                    
                }
                ClawResource.CS_LEFT_RIGHT.setPwm(0);
                Thread.sleep(1000);
                
                for(int i = ClawResource.CLAW_GO_BACK; i <= ClawResource.CLAW_GO_FRONT; i++){ //move claw to go to front
                    
                    SoftPwm.softPwmWrite(ClawResource.CS_FRONT_BACK, i);
                    Thread.sleep(70);
                    
                }
                SoftPwm.softPwmWrite(ClawResource.CS_FRONT_BACK, 0);
                Thread.sleep(300);
                
                CS_OPEN_CLOSE.setPwm(ClawResource.CLAW_OPEN); //open claw
                Thread.sleep(1200);
                ClawResource.CS_OPEN_CLOSE.setPwm(0);
                Thread.sleep(600);
                
                for(int i = ClawResource.CLAW_GO_FRONT; i >= ClawResource.CLAW_GO_BACK; i--){  //move claw to go back
                    
                    SoftPwm.softPwmWrite(ClawResource.CS_FRONT_BACK, i);
                    Thread.sleep(70);
                    
                }
                SoftPwm.softPwmWrite(ClawResource.CS_FRONT_BACK, 0);            

                for(int i = ClawResource.CLAW_LEFT; i >= ClawResource.CLAW_MIDDLE; i--){
                    
                    ClawResource.CS_LEFT_RIGHT.setPwm(i); //go to middle
                    Thread.sleep(20);
                
                }
                ClawResource.CS_LEFT_RIGHT.setPwm(0);   
                
                ClawResource.CS_OPEN_CLOSE.setPwm(ClawResource.CLAW_CLOSE); //close claw
                Thread.sleep(800);
                ClawResource.CS_OPEN_CLOSE.setPwm(0); 

                SoftPwm.softPwmStop(ClawResource.CS_FRONT_BACK);
                //ClawResource.onOperation = false;
                
            } catch (InterruptedException ex) {
                Logger.getLogger(ClawResource.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            Iterator<RequestObserver> i = ClawResource.OBSERVERS.iterator();
            RequestObserver ro;
            
            try {
                
                while(i.hasNext()){
                
                    ro = (RequestObserver)i.next();

                    switch(ro.getType()){

                        case HttpConnection.METHOD_PUT:
                            HttpConnection.makePutRequest(ro.getRequestPath());

                        i.remove();

                    };
                
                }
                
            } catch (NoSuchElementException e) { 
                Logger.getLogger(ClawResource.class.getName()).log(Level.INFO, null, e);
            }
            
        }
        
    };
    
    private static final IObserverSensor OBSERVER = new IObserverSensor() {
        
        @Override
        public void alertSensor(Object type, Object info) {
            
            if(type instanceof SensorObstacle){
                //TODO
            } 
            
        }
        
    };
    
    //private static final SensorObstacle CSO = new SensorObstacle(ClawResource.OBSERVER, 0.02, 0.30, 0.02, 35, SensorObstacle.GPIO_I_CLAW.getName());
    private static final List<RequestObserver> OBSERVERS = new ArrayList<>();
    
    
    /**@param observer : {"observer":String, "parameter":String, "method":String } represents the observer on this operation.*/
    @PUT
    @Path("claw-take")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public String clawTake(String observer){
    
        JsonObjectBuilder job = Json.createObjectBuilder();
        
        if(/*ClawResource.CSO.isPresence()*/true){  //it is simulating the sensor, delete the "true" and uncomment the condition if you pretend use this sensor
            
            JsonObject jo = JSONUtils.convertStringtoJSON(observer);
            
            if(jo != null)
                ClawResource.OBSERVERS.add(new RequestObserver(jo.getString("observer"), jo.getString("method"), jo.getString("parameter")));
            
            //call a runnable to make the action and informs when concludes it
            new Thread(clawRunnable).start();
            
            return JSONUtils.getJsonString(job.add(Constants.STATUS, Constants.OK)
                        .add(Constants.MESSAGE, Json.createObjectBuilder().add(Constants.MESSAGE, Constants.SERVICE_ACTIVATED).build())
                        .build());
            
        }else{
            
            return JSONUtils.getJsonString(job.add(Constants.STATUS, Constants.ERROR)
                        .add(Constants.MESSAGE, Json.createObjectBuilder().add(Constants.MESSAGE, "no object to get").build())
                        .build());
            
        }
        
    }
    
            
}