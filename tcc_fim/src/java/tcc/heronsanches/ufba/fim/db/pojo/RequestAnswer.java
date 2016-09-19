package tcc.heronsanches.ufba.fim.db.pojo;

public class RequestAnswer {
    
    public static final String TABLE_NAME = "request_answer";
    public static final String ID_REQUEST_ANSWER = "id_request_answer";
    public static final String TXT_REQUEST_PATH = "txt_request_path";
    public static final String TXT_PARAMETER = "txt_parameter";
    public static final String DATE_TIMESTAMP = "date_timestamp";
    public static final String TXT_TYPE = "txt_type";
    public static final String TXT_ANSWER = "txt_answer";
    
    private String id_request_answer;
    private String txt_request_path;
    private String txt_parameter;
    private String date_timestamp;
    private String txt_type;
    private String txt_answer;

    
    public String getId_request_answer() {
        return id_request_answer;
    }

    public void setId_request_answer(String id_request_answer) {
        this.id_request_answer = id_request_answer;
    }

    public String getTxt_request_path() {
        return txt_request_path;
    }

    public void setTxt_request_path(String txt_request_path) {
        this.txt_request_path = txt_request_path;
    }

    public String getTxt_parameter() {
        return txt_parameter;
    }

    public void setTxt_parameter(String txt_parameter) {
        this.txt_parameter = txt_parameter;
    }

    public String getDate_timestamp() {
        return date_timestamp;
    }

    public void setDate_timestamp(String date_timestamp) {
        this.date_timestamp = date_timestamp;
    }

    public String getTxt_type() {
        return txt_type;
    }

    public void setTxt_type(String txt_type) {
        this.txt_type = txt_type;
    }

    public String getTxt_answer() {
        return txt_answer;
    }

    public void setTxt_answer(String txt_answer) {
        this.txt_answer = txt_answer;
    }

    
}