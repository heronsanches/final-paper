package tcc.heronsanches.ufba.fim.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import tcc.heronsanches.ufba.fim.db.DB;
import tcc.heronsanches.ufba.fim.db.pojo.RequestAnswer;

public class RequestAnswerDAO {
    
    
    /**@return 1: if the row was inserted successfully, 0: not inserted.*/
    public int insert(tcc.heronsanches.ufba.fim.resource.RequestAnswer ra, long idTuple) {
	
		Connection con = DB.getConnectionDB();
        int result = 0;
		
		if(con != null){
                     
			try {
                
                con.setAutoCommit(false);
				PreparedStatement ps = con.prepareStatement("insert into "+DB.SCHEMA_MASTER+RequestAnswer.TABLE_NAME+" values(default, ?, ?, ?, ?, ?, ?)");
                ps.setString(1, ra.getRequestPath());
                ps.setString(2, ra.getParameter());
                ps.setTimestamp(3, Timestamp.valueOf(ra.getTimestamp()));
                ps.setString(4, ra.getType());
                ps.setString(5, ra.getAnswer());
                ps.setLong(6, idTuple);
                
                if(ps.executeUpdate() == 1){
                    
                    con.commit();
                    result = 1;
                    
                }else
                    con.rollback();
		
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