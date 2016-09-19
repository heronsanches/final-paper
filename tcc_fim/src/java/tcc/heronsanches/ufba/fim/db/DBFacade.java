package tcc.heronsanches.ufba.fim.db;

import tcc.heronsanches.ufba.fim.db.dao.TupleDAO;
import tcc.heronsanches.ufba.fim.db.dao.RequestAnswerDAO;
import javax.json.JsonObject;
import tcc.heronsanches.ufba.fim.db.dao.BasketDAO;
import tcc.heronsanches.ufba.fim.db.dao.ClientDAO;



public class DBFacade {

    private static RequestAnswerDAO requestAnswerDAO = new RequestAnswerDAO();
    private static TupleDAO tupleDAO = new TupleDAO();
    private static ClientDAO clientDAO = new ClientDAO();
    private static BasketDAO basketDAO = new BasketDAO();
   
	
	private  DBFacade(){ }
	
	
   /**********FACADE TUPLE***********/
	/**@return {@linkplain TupleDAO#insert() }*/
	public static long insertTuple() {
		return tupleDAO.insert();
	}
    
    public static int updateTuple(boolean isSideEffect, long idTuple){
        return tupleDAO.update(isSideEffect, idTuple);
    }
 
   
  /**********FACADE RequestAnswer***********/
    public static long insertRequestAnswer(tcc.heronsanches.ufba.fim.resource.RequestAnswer ra, long idTuple) {
		return requestAnswerDAO.insert(ra, idTuple);
	}
    
    
    /**********FACADE Client***********/
    public static int updateToken(JsonObject client) {
		return clientDAO.update(client);
	}
    
    public static String getToken(int idCLient) {
		return clientDAO.getTokenFcmClient(idCLient);
    }
		
    
    /**********FACADE Basket***********/
    public static String getBasket(long idBasket){
        return basketDAO.getBasketWeka(idBasket);
    }
    
    public static String generatesDatasetWeka(){
        return basketDAO.generatesDatasetWeka();
    }
    
    
}