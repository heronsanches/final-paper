package tcc.heronsanches.ufba.utils;

import java.io.Serializable;
import java.sql.Timestamp;

public class RequestObserver implements Serializable{
    
    private String requestPath;
    private String parameter;
    private String type;
    //private String answer;
    
    /**it represents the timestamp that the function was actioned (GET or PUT or ...)*/
    private String timestampRequest; 
    
    public RequestObserver(String requestPath, String type, String parameter){
        
        this.requestPath = requestPath;
        this.type = type;
        this.parameter = parameter;
        this.timestampRequest = new Timestamp(System.currentTimeMillis()).toString();
        
    }
    
    
    public RequestObserver(String requestPath, String type){
        
        this.requestPath = requestPath;
        this.type = type;
        this.parameter = "";
        this.timestampRequest = new Timestamp(System.currentTimeMillis()).toString();
        
    }

    
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    /*public void setAnswer(String answer) {
        this.answer = answer;
    }*/

    public String getRequestPath() {
        return requestPath;
    }

    public String getParameter() {
        return parameter;
    }

    /*public String getAnswer() {
        return answer;
    }*/

    public String getTimestampRequest() {
        return timestampRequest;
    }

            
}