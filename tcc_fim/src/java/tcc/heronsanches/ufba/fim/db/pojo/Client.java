package tcc.heronsanches.ufba.fim.db.pojo;

public class Client {
    
    public static final String TABLE_NAME = "client";
    public static final String ID_CLIENT = "id_client";
    public static final String TXT_FCM_TOKEN = "txt_fcm_token";
    
    private int id_client;
    private String txt_fcm_token;
    

    public int getId_client() {
        return id_client;
    }

    public void setId_client(int id_client) {
        this.id_client = id_client;
    }

    public String getTxt_fcm_token() {
        return txt_fcm_token;
    }

    public void setTxt_fcm_token(String txt_fcm_token) {
        this.txt_fcm_token = txt_fcm_token;
    }
    
    
}