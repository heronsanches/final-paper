package tcc.heronsanches.ufba.fim.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.json.JsonObject;
import tcc.heronsanches.ufba.fim.db.DB;
import tcc.heronsanches.ufba.fim.db.pojo.Client;

public class ClientDAO {
    
    /**@return 0:error, otherwise will return the id of "tuple" table */
   public int update(JsonObject client) {
	
		Connection con = DB.getConnectionDB();
        int result = 0;
		
		if(con != null){
         
			try {
                
				PreparedStatement ps = con.prepareStatement("update "+DB.SCHEMA_MASTER+Client.TABLE_NAME+" set "+Client.TXT_FCM_TOKEN+"=?"
                    +" where "+Client.ID_CLIENT+"=?");
                
                ps.setString(1, client.getString("txt_fcm_token"));
                ps.setInt(2, client.getInt("id_client"));
                result = ps.executeUpdate();		
				ps.close();
			
			} catch (SQLException ex) {
                Logger.getLogger(TupleDAO.class.getName()).log(Level.SEVERE, null, ex);
            }finally{
				try{
					con.close();
				}catch ( Exception exception ){ }
			}
		}
		
		return result;
        
	}
   
   
   public String getTokenFcmClient(int idCLient) {
	
		Connection con = DB.getConnectionDB();
        String result = "";
		
		if(con != null){
         
			try {
                
				PreparedStatement ps = con.prepareStatement("select "+Client.TXT_FCM_TOKEN+" from "+DB.SCHEMA_MASTER+Client.TABLE_NAME+" where "+Client.ID_CLIENT+"=?");
                ps.setInt(1, idCLient);
                ResultSet rs = ps.executeQuery();	
                rs.next();
                result = rs.getString(Client.TXT_FCM_TOKEN);
				ps.close();
			
			} catch (SQLException ex) {
                Logger.getLogger(TupleDAO.class.getName()).log(Level.SEVERE, null, ex);
            }finally{
				try{
					con.close();
				}catch ( Exception exception ){ }
			}
		}
		
		return result;
        
	}
   
    
}