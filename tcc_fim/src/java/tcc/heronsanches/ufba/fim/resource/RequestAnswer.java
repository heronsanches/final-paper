package tcc.heronsanches.ufba.fim.resource;

import java.io.Serializable;
import java.sql.Timestamp;

public class RequestAnswer implements Serializable{
    
    public static final String PATH_RESOURCE_FIM = "http://localhost:8080/has/fim/pc/"; 
    public static final String PATH_RESOURCE_ARDUINO = "http://localhost:8080/has/arduino/arduino/";
    public static final String PATH_RESOURCE_RASPBERRY = "http://192.168.1.199/has/raspberry/"; 
    
    private String requestPath;
    private String parameter;
    private String type;
    private String answer;
    private boolean siddeEffect;
    
    /**it represents the timestamp that the request was recept or made*/
    private String timestamp; 
    
    
    public RequestAnswer(String requestPath, String type, String parameter){
        
        this.requestPath = requestPath;
        this.type = type;
        this.parameter = parameter;
        this.timestamp = new Timestamp(System.currentTimeMillis()).toString();
        
    }
    
    
    public RequestAnswer(String requestPath, String type){
        
        this.requestPath = requestPath;
        this.type = type;
        this.parameter = "";
        this.timestamp = new Timestamp(System.currentTimeMillis()).toString();
        
    }

    
    public boolean isSiddeEffect() {
        return siddeEffect;
    }

    public void setSiddeEffect(boolean siddeEffect) {
        this.siddeEffect = siddeEffect;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getRequestPath() {
        return requestPath;
    }

    public String getParameter() {
        return parameter;
    }

    public String getAnswer() {
        return answer;
    }

    public String getTimestamp() {
        return timestamp;
    }

            
}