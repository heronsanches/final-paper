package tcc.heronsanches.ufba.resource.component;

import tcc.heronsanches.ufba.interfaces.IObserverSensor;


public class SensorDistance extends Sensor{
    
    /**at degree*/
    private final double angleDetectionRange;
    
    /**at cm */
    private final double maximumDistanceDetection;
    
    /**at cm */
    private final double minimumDistanceDetection;
    
    /**at cm */
    private double actualDistanceDetection;
    
    
    /**@param o observer
     @param minimumDistanceDetection at cm
     @param maximumDistanceDetection at cm
     @param angleDetectionRange at cm*/
    public SensorDistance(IObserverSensor o, double minimumDistanceDetection, double maximumDistanceDetection, double angleDetectionRange) {
        
        super(o);
        this.minimumDistanceDetection = minimumDistanceDetection;
        this.maximumDistanceDetection = maximumDistanceDetection;
        this.angleDetectionRange = angleDetectionRange;
        
    }
    
    
    //TODO handle detection
    public void onDetection(){
        
        //TODO actualDistanceDetection = x;
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
    
    
}