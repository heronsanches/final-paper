package ufba.heronsanches.tcc;

public class SharedPreferencesConstants {
		
	/********This object shared preference represents information about GCM services********/
	public static final String GCM_SHARED_PREFERENCES = "GCM_SHARED_PREFERENCES";
	
	/**It shows if has registered token on GCM, it is represented by a boolean*/
	public static final String GCM_TOKEN_REGISTERED= "GCM_TOKEN_REGISTERED";
	
	/**It informs the number of notifications not read, represented by a int*/
	public static final String GCM_NUMBER_NOTIFICATIONS_NOT_READ= "GCM_NUMBER_NOTIFICATIONS_NOT_READ";


	private SharedPreferencesConstants(){}
	

}