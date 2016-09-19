
package tcc.heronsanches.ufba.arduino.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.zu.ardulink.Link;
import org.zu.ardulink.RawDataListener;
import tcc.heronsanches.ufba.arduino.interfaces.IObserverResource;
import tcc.heronsanches.ufba.arduino.resource.component.Sensor;
import tcc.heronsanches.ufba.arduino.resource.component.SensorDistance;
import tcc.heronsanches.ufba.arduino.resource.component.SensorMass;
import tcc.heronsanches.ufba.arduino.resource.component.SensorObstacle;


public class ConnectArduino {
    
    private static boolean connected;
    private static Link link;
    
    /**answer of the arduino captured by serial port*/
    private String ardAnswer[];
    
    private static final List<SensorDistance> LOSD = new ArrayList<>();
    private static final List<SensorMass> LOSM = new ArrayList<>();
    private static final List<SensorObstacle> LOSO = new ArrayList<>();
    private static final List<IObserverResource> LOR = new ArrayList<>(); //resources
    
    private RawDataListener rdl = new RawDataListener() {

        @Override
        public void parseInput(String string, int numBytes, int[] message) {

            StringBuilder sb = new StringBuilder(numBytes + 1);

            for (int a = 0; a < numBytes; a++)
                sb.append((char)message[a]);

            ardAnswer = sb.toString().split(";"); //answer model: "sad;distance em cm" -- "sao;ok" -- "sam;mass at kg" -- "car;moving" ...
            
            if(ardAnswer[0].startsWith("sa")){
                
                switch(ardAnswer[0]){

                    case "sao":
                        for(SensorObstacle s: LOSO)
                            s.alertSensor(ardAnswer[1]);
                    break;

                    case "sad":
                        for(SensorDistance s: LOSD)
                            s.alertSensor(ardAnswer[1]);
                    break;

                    case "sam":
                        for(SensorMass s: LOSM)
                            s.alertSensor(ardAnswer[1]);
                    break;

                };
                
            }else{
                
                for(IObserverResource o: LOR)
                    o.responseArduino(ardAnswer[1]);
                
            }
            
        }

    };
    
    
    private ConnectArduino(){
        
        link = Link.getDefaultInstance();
        connected = link.connect("/dev/ttyUSB0", 9600); //on fedora24 gnu-linux
        
        try {
            
            Thread.sleep(2000);
            link.addRawDataListener(rdl);
            
        } catch (InterruptedException ex) {
            Logger.getLogger(ConnectArduino.class.getName()).log(Level.SEVERE, null, ex);
        }     
        
    }
    
    
    public static Link getSerialConnection(){
        
        if(connected)
            return link;
        else{
            
            new ConnectArduino();
            return link;
            
        }
        
    }
    
    
    public static void addObserver(Sensor type){
        
        if(type instanceof SensorDistance)
            LOSD.add((SensorDistance)type);
        else if(type instanceof SensorMass)
            LOSM.add((SensorMass)type);
        else if(type instanceof SensorObstacle)
            LOSO.add((SensorObstacle)type);
            
    }
    
    
    public static void addObserver(IObserverResource resource){
        LOR.add(resource);
    }
    
    
    public static void removeObserver(IObserverResource resource){
        LOR.remove(resource);
    }
    
    
}