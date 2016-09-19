package tcc.heronsanches.ufba.arduino.resource.component;

import tcc.heronsanches.ufba.arduino.interfaces.IObserverSensor;
import tcc.heronsanches.ufba.arduino.interfaces.IObserverSerial;


public class SensorMass extends Sensor implements IObserverSerial{
    
    /**maximum mass capacity*/
    private final double maximumMass;
    
    private double actualMass;
    
    
    /**@param o: observer
     @param maximumMass maximum mass capacity*/
    public SensorMass(IObserverSensor o, double maximumMass){
        
        super(o);
        this.maximumMass = maximumMass;
        
    }

    
    @Override
    public void alertSensor(String value) {
        
        actualMass = Double.valueOf(value);
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