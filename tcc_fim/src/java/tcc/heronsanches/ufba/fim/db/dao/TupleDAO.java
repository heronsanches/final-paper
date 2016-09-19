package tcc.heronsanches.ufba.fim.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import tcc.heronsanches.ufba.fim.db.DB;
import tcc.heronsanches.ufba.fim.db.pojo.Tuple;


public class TupleDAO {
        

   /**@return 0:error, otherwise will return the id of "tuple" table */
   public long insert() {
	
		Connection con = DB.getConnectionDB();
        long idTuple = 0;
		
		if(con != null){
         
			try {
                
				PreparedStatement ps = con.prepareStatement("insert into "+DB.SCHEMA_MASTER+Tuple.TABLE_NAME+" values(default, default)", Statement.RETURN_GENERATED_KEYS);
                
				if(ps.executeUpdate() == 1) {	
               
                    ResultSet rs = ps.getGeneratedKeys();
                    rs.next();
                    idTuple = rs.getLong(Tuple.ID_TUPLE);
               
				}
		
				ps.close();
			
			} catch (SQLException ex) {
                Logger.getLogger(TupleDAO.class.getName()).log(Level.SEVERE, null, ex);
            }finally{
				try{
					con.close();
				}catch ( Exception exception ){ }
			}
		}
		
		return idTuple;
        
	}
   
   
   /**@return 0 if not updated, 1 if was updated*/
   public int update(boolean isSideEffect, long idTuple) {
	
		Connection con = DB.getConnectionDB();
        int result = 0;
		
		if(con != null){
         
			try {
                
				PreparedStatement ps = con.prepareStatement("update "+DB.SCHEMA_MASTER+Tuple.TABLE_NAME+" set "+Tuple.BOOL_SIDE_EFFECT+"=? where"
                        +" "+Tuple.ID_TUPLE+"=?");
                
                ps.setBoolean(1, true);
                ps.setLong(2, idTuple);
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
   
    
}