package tcc.heronsanches.ufba.utils;

import java.io.StringReader;
import java.io.StringWriter;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.JsonWriter;

public class JSONUtils {

	
    /**@return the {@linkplain JsonObject} representation, otherwise will return null.*/
	public static JsonObject convertStringtoJSON(String str){
		
        JsonObject object = null;

        try (JsonReader jsonReader = Json.createReader(new StringReader(str))) {
           object = jsonReader.readObject();
        }catch(Exception e){
           Logger.getLogger(JSONUtils.class.getName()).log(Level.SEVERE, null, e);
        }
      
        return object;
		
	}
    
    
    /** @return String representation of the {@literal JsonObject} jo.*/
	public static String getJsonString(JsonObject jo){
		
		StringWriter sw = new StringWriter();
		
        try(JsonWriter jsonWriter = Json.createWriter(sw)){ //TODO verify this try treatment 
        	
        	jsonWriter.writeObject(jo);
            return sw.toString();
			
		}
		
	}


}