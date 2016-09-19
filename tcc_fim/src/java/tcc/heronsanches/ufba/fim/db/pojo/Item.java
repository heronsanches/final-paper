package tcc.heronsanches.ufba.fim.db.pojo;

public class Item {
    
    public static final String TABLE_NAME = "item";
    public static final String ID_ITEM = "id_item";
    public static final String NUM_WIDTH = "num_width";
    public static final String NUM_LENGTH = "num_length";
    public static final String NUM_HEIGHT = "num_height";
    public static final String NUM_MASS = "num_mass";
    public static final String TXT_NAME = "txt_name";
    public static final String TXT_DESCRIPTION = "txt_description";
    public static final String TXT_ALTERNATIVE_ID = "txt_alternative_id";
    
    private String id_item;
    private String num_width;
    private String num_length;
    private String num_height;
    private String num_mass;
    private String txt_name;
    private String txt_description;
    private String num_alternative_id;

    
    public String getId_item() {
        return id_item;
    }

    public void setId_item(String id_item) {
        this.id_item = id_item;
    }

    public String getNum_width() {
        return num_width;
    }

    public void setNum_width(String num_width) {
        this.num_width = num_width;
    }

    public String getNum_length() {
        return num_length;
    }

    public void setNum_length(String num_length) {
        this.num_length = num_length;
    }

    public String getNum_height() {
        return num_height;
    }

    public void setNum_height(String num_height) {
        this.num_height = num_height;
    }

    public String getNum_mass() {
        return num_mass;
    }

    public void setNum_mass(String num_mass) {
        this.num_mass = num_mass;
    }

    public String getTxt_name() {
        return txt_name;
    }

    public void setTxt_name(String txt_name) {
        this.txt_name = txt_name;
    }

    public String getTxt_description() {
        return txt_description;
    }

    public void setTxt_description(String txt_description) {
        this.txt_description = txt_description;
    }

    public String getNum_alternative_id() {
        return num_alternative_id;
    }

    public void setNum_alternative_id(String num_alternative_id) {
        this.num_alternative_id = num_alternative_id;
    }

    
}