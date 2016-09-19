package tcc.heronsanches.ufba.arduino.resource.component;


import tcc.heronsanches.ufba.arduino.interfaces.IObserverSensor;
import tcc.heronsanches.ufba.arduino.interfaces.IObserverSerial;

public class SensorObstacle extends Sensor implements IObserverSerial{
    
    /**indicates the maximum detection obstacle range at m*/
    private final double maximumObstacleRange;
    
    /**indicates the minimum detection obstacle range at m*/
    private final double minimumObstacleRange;
    
    /**indicates the actual detection obstacle range at m*/
    private final double actualObstacleRange;
    
    /**indicates the angle detection obstacle range at degree*/
    private final double angleObstacleRange;
    
    /**informs if has some thing in the range*/
    private boolean presence;
 
    
    /**@param o observer
     @param minimumObstacleRange {@linkplain SensorObstacle#minimumObstacleRange}
     @param maximumObstacleRange {@linkplain SensorObstacle#maximumObstacleRange}
     @param actualObstacleRange {@linkplain SensorObstacle#actualObstacleRange}
     @param angleObstacleRange {@linkplain SensorObstacle#angleObstacleRange}*/
    public SensorObstacle(IObserverSensor o, double minimumObstacleRange, double maximumObstacleRange, double actualObstacleRange, double angleObstacleRange){
        
        super(o);
        //add it how a observer of serial port input
        this.minimumObstacleRange = minimumObstacleRange;
        this.maximumObstacleRange = maximumObstacleRange;
        this.actualObstacleRange = actualObstacleRange;
        this.angleObstacleRange = angleObstacleRange;
        
    }
    

    @Override
    public void alertSensor(String value) {
        
        presence = Boolean.valueOf(value);
        notifyObservers(this, presence);
        
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