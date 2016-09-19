package tcc.heronsanches.ufba.arduino.resource.component;

import tcc.heronsanches.ufba.arduino.interfaces.IObserverSensor;
import tcc.heronsanches.ufba.arduino.interfaces.IObserverSerial;
import tcc.heronsanches.ufba.arduino.utils.ConnectArduino;


public class SensorDistance extends Sensor implements IObserverSerial{
    
    /**at degree*/
    private final double angleDetectionRange;
    
    /**at m */
    private final double maximumDistanceDetection;
    
    /**at m */
    private final double minimumDistanceDetection;
    
    /**at m */
    private double actualDistanceDetection;
    
    
    /**@param o observer
     @param minimumDistanceDetection at m
     @param maximumDistanceDetection at m
     @param angleDetectionRange at gradus*/
    public SensorDistance(IObserverSensor o, double minimumDistanceDetection, double maximumDistanceDetection, double angleDetectionRange) {
        
        super(o);
        ConnectArduino.addObserver(this);
        this.minimumDistanceDetection = minimumDistanceDetection;
        this.maximumDistanceDetection = maximumDistanceDetection;
        this.angleDetectionRange = angleDetectionRange;
        
    }
    
    
    @Override
    public void alertSensor(String value) {
        
        actualDistanceDetection = Double.valueOf(value);
        notifyObservers(this, actualDistanceDetection);
        
    }
   
    
    public double getAngleDetectionRange() {
        return angleDetectionRange;
    }

    public double getMaximumDistanceDetection() {
        return maximumDistanceDetection;
    }

    public double getMinimumDistanceDetection() {
        return minimumDistanceDetection;
    } 

    public double getActualDistanceDetection() {
        return actualDistanceDetection;
    }
    
    
}