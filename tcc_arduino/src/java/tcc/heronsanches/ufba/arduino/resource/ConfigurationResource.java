package tcc.heronsanches.ufba.arduino.resource;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import tcc.heronsanches.ufba.arduino.utils.ConnectArduino;

@ApplicationPath("arduino")
public class ConfigurationResource extends Application{

    
    public ConfigurationResource(){
        ConnectArduino.getSerialConnection();
    }
    
    
    @Override
    protected void finalize(){
        
        try {
            
            ConnectArduino.getSerialConnection().disconnect();
            super.finalize();
            
        } catch (Throwable ex) {
            Logger.getLogger(ConfigurationResource.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    

}