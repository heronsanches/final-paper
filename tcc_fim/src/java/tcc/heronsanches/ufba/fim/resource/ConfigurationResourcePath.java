package tcc.heronsanches.ufba.fim.resource;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;
import tcc.heronsanches.ufba.fim.utils.WriteReadObjects;

@ApplicationPath("pc")
public class ConfigurationResourcePath extends Application{

    
    public ConfigurationResourcePath(){
        WriteReadObjects.openFileToOutput();
    }
    

    @Override
    protected void finalize() throws Throwable {
        
        WriteReadObjects.closeFileOutput();
        super.finalize(); //To change body of generated methods, choose Tools | Templates.
        
    }
    
    
}