package tcc.heronsanches.ufba.arduino.resource.component;

import java.util.HashSet;
import java.util.Set;
import tcc.heronsanches.ufba.arduino.interfaces.IObserverSensor;

public class Sensor {
    
    private boolean on = true;
    private final Set<IObserverSensor> OBSERVERS = new HashSet<IObserverSensor>();
    
    
    protected Sensor(IObserverSensor o){
        OBSERVERS.add(o);
    }
    
    
    protected void notifyObservers(Object type, Object info){
        
        for(IObserverSensor o: OBSERVERS)
            o.alertSensor(type, info); 
        
    }

    
    protected  boolean isOn() {
        return on;
    }

    protected  void setOn(boolean on) {
        this.on = on;
    }
    
   
}