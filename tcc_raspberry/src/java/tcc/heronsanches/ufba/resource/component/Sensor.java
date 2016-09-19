package tcc.heronsanches.ufba.resource.component;

import java.util.ArrayList;
import java.util.List;
import tcc.heronsanches.ufba.interfaces.IObserverSensor;

public class Sensor {
    
    private boolean on;
    private final List<IObserverSensor> observers = new ArrayList<>();
    
    
    protected Sensor(IObserverSensor o){
        observers.add(o);
    }
    
    
    protected void notifyObservers(Object type, Object info){
        
        for(IObserverSensor o: observers)
            o.alertSensor(type, info);
        
    }

    
    protected  boolean isOn() {
        return on;
    }

    protected  void setOn(boolean on) {
        this.on = on;
    }
    
   
}