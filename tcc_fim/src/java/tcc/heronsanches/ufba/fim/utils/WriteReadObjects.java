package tcc.heronsanches.ufba.fim.utils;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.logging.Level;
import java.util.logging.Logger;
import tcc.heronsanches.ufba.fim.resource.RequestAnswer;


public class WriteReadObjects {
    
    private static final String PATH = "/home/heron/NetBeansProjects/tcc_fim/log/REQUEST_ANSWER.LOG";
    private static ObjectOutputStream output; // outputs data to file

    
    
    private WriteReadObjects(){}

    
    public static void openFileToOutput(){
        
        try {
            
            if(Files.exists(Paths.get(PATH))){
                output = new AppendingObjectOutputStream(Files.newOutputStream(Paths.get(PATH), StandardOpenOption.APPEND));
            }else
                output = new ObjectOutputStream(Files.newOutputStream(Paths.get(PATH), StandardOpenOption.CREATE));
            
        } catch (IOException ex) {
            Logger.getLogger(WriteReadObjects.class.getName()).log(Level.SEVERE, null, ex);
        }catch(NullPointerException ex){
            Logger.getLogger(WriteReadObjects.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    
    public static ObjectInputStream openFileToInput(){
        
        try {
            return new ObjectInputStream(Files.newInputStream(Paths.get(PATH), StandardOpenOption.READ));
        } catch (IOException ex) {
            Logger.getLogger(WriteReadObjects.class.getName()).log(Level.SEVERE, null, ex);
        }catch(NullPointerException ex){
            Logger.getLogger(WriteReadObjects.class.getName()).log(Level.SEVERE, null, ex);
        }
            
        return null;
        
    }
    
    
    public static void addRecord(RequestAnswer ra){
        
        try {Logger.getLogger(WriteReadObjects.class.getName()).log(Level.SEVERE, "addRecord");
            output.writeObject(ra);
        } catch (IOException ex) {
            Logger.getLogger(WriteReadObjects.class.getName()).log(Level.SEVERE, null, ex);
        }catch(NullPointerException ex){
            Logger.getLogger(WriteReadObjects.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
  
    
    public static void closeFileOutput(){
        
        try {
            output.close();
        } catch (IOException ex) {
            Logger.getLogger(WriteReadObjects.class.getName()).log(Level.SEVERE, null, ex);
        }catch(NullPointerException ex){
            Logger.getLogger(WriteReadObjects.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
      
    
}