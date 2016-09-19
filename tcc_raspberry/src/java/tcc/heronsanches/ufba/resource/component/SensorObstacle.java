package tcc.heronsanches.ufba.resource.component;

import com.pi4j.io.gpio.GpioPinDigitalInput;
import com.pi4j.io.gpio.PinState;
import com.pi4j.io.gpio.RaspiPin;
import com.pi4j.io.gpio.event.GpioPinDigitalStateChangeEvent;
import com.pi4j.io.gpio.event.GpioPinListenerDigital;
import java.util.logging.Level;
import java.util.logging.Logger;
import tcc.heronsanches.ufba.utils.GpioUtils;
import tcc.heronsanches.ufba.interfaces.IObserverSensor;

public class SensorObstacle extends Sensor implements GpioPinListenerDigital{
    
    /**indicates the maximum detection obstacle range at m*/
    private final double maximumObstacleRange;
    
    /**indicates the minimum detection obstacle range at m*/
    private final double minimumObstacleRange;
    
    /**indicates the actual detection obstacle range at m*/
    private final double actualObstacleRange;
    
    /**indicates the angle detection obstacle range at degree*/
    private final double angleObstacleRange;
    
    /**informs if has some thing in the range*/
    private static boolean presence;
    
    private GpioPinDigitalInput gpioInput;
    
    public final static GpioPinDigitalInput GPIO_I_ELEVATOR_BOTTOM_DOOR = GpioUtils.GPIO.provisionDigitalInputPin(RaspiPin.GPIO_05, "SENSOR_OBSTACLE_ELEVATOR_BOTTOM_DOOR");
    public final static GpioPinDigitalInput GPIO_I_CLAW = GpioUtils.GPIO.provisionDigitalInputPin(RaspiPin.GPIO_06, "SENSOR_OBSTACLE_CLAW");
    
    
    /**@param o observer
     @param minimumObstacleRange {@linkplain SensorObstacle#minimumObstacleRange}
     @param maximumObstacleRange {@linkplain SensorObstacle#maximumObstacleRange}
     @param actualObstacleRange {@linkplain SensorObstacle#actualObstacleRange}
     @param angleObstacleRange {@linkplain SensorObstacle#angleObstacleRange}*/
    public SensorObstacle(IObserverSensor o, double minimumObstacleRange, double maximumObstacleRange, double actualObstacleRange,
        double angleObstacleRange, String sensorName){
        
        super(o);
        this.minimumObstacleRange = minimumObstacleRange;
        this.maximumObstacleRange = maximumObstacleRange;
        this.actualObstacleRange = actualObstacleRange;
        this.angleObstacleRange = angleObstacleRange;
        Logger.getLogger(SensorObstacle.class.getName()).log(Level.INFO, "constructor");
        if(sensorName.contentEquals(GPIO_I_ELEVATOR_BOTTOM_DOOR.getName())){
             Logger.getLogger(SensorObstacle.class.getName()).log(Level.INFO, "GPIO_I_ELEVATOR_BOTTOM_DOOR");
            this.gpioInput = GPIO_I_ELEVATOR_BOTTOM_DOOR;
            GPIO_I_ELEVATOR_BOTTOM_DOOR.addListener(this);
            
        }else if(sensorName.contentEquals(GPIO_I_CLAW.getName())){
            Logger.getLogger(SensorObstacle.class.getName()).log(Level.INFO, "GPIO_I_CLAW");
            this.gpioInput = GPIO_I_CLAW;
            GPIO_I_CLAW.addListener(this);
            
        }
        
    }
    
    
    @Override
    public void handleGpioPinDigitalStateChangeEvent(GpioPinDigitalStateChangeEvent gpdsce) { //each sensor will react with only your respect pin

        if(gpdsce.getPin().getPin() == gpioInput.getPin()){ 

            if(gpdsce.getState() == PinState.LOW){
                Logger.getLogger(SensorObstacle.class.getName()).log(Level.INFO, "low");
                SensorObstacle.presence = true;
                notifyObservers(this, PinState.LOW);

            }else{
                Logger.getLogger(SensorObstacle.class.getName()).log(Level.INFO, "high");
                SensorObstacle.presence = false;
                notifyObservers(this, PinState.HIGH);

            }

        }

    }
    
        
    public double getMaximumObstacleRange() {
        return maximumObstacleRange;
    }

    public double getMinimumObstacleRange() {
        return minimumObstacleRange;
    }

    public double getActualObstacleRange() {
        return actualObstacleRange;
    }

    public double getAngleObstacleRange() {
        return angleObstacleRange;
    }

    public boolean isPresence() {
        return presence;
    }
     
    
}