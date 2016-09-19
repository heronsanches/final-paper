package tcc.heronsanches.ufba.resource.component;

import tcc.heronsanches.ufba.interfaces.IObserverSensor;


public class SensorMass extends Sensor{
    
    /**maximum mass capacity*/
    private final double maximumMass;
    
    private double actualMass;
    
    
    /**@param o: observer
     @param maximumMass maximum mass capacity*/
    public SensorMass(IObserverSensor o, double maximumMass){
        
        super(o);
        this.maximumMass = maximumMass;
        
    }
    
    
    //TODO handle detection on sensor
    public void onMassChanged(){
        notifyObservers(this, actualMass);
    }
    
    
    public double getActualMass() {
        return actualMass;
    }

    public void setActualMass(double actualMass) {
        this.actualMass = actualMass;
    }

    public double getMaximumMass() {
        return maximumMass;
    }
     
    
}