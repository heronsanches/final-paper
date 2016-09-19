package tcc.heronsanches.ufba.fim.db.pojo;

public class Tuple {
    
    public static final String TABLE_NAME = "tuple";
    public static final String ID_TUPLE = "id_tuple";
    public static final String BOOL_SIDE_EFFECT = "bool_side_effect";
    
    private boolean bool_side_effect;
    private long id_tuple;
    

    public boolean isBool_side_effect() {
        return bool_side_effect;
    }

    public void setBool_side_effect(boolean bool_side_effect) {
        this.bool_side_effect = bool_side_effect;
    }

    public long getId_tuple() {
        return id_tuple;
    }

    public void setId_tuple(long id_tuple) {
        this.id_tuple = id_tuple;
    }
    
    
}