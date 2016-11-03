package tcc.heronsanches.ufba.fim.db;
import java.sql.Connection;
import java.sql.DriverManager;


/**This class has the Database's configuration and provides the connection to them.*/
public class DB {

	// configuration of the database driver
	private final static String user = "tcc";
	private final static String password = "pf220161";
	private final static String JDBC_DRIVER = "org.postgresql.Driver";
	private final static String DB_NAME = "tcc";
	private final static String url = "jdbc:postgresql://tcc.cq6cvriygdef.us-east-1.rds.amazonaws.com:5432/"+DB_NAME;
	
	public static final String SCHEMA_MASTER = "master.";
	
	
	private DB(){ }

	
	public static Connection getConnectionDB() {
		
		try {
			
			// This will load the driver
			Class.forName(JDBC_DRIVER);
			return DriverManager.getConnection(url, user, password);

		} catch (Exception e) {
			return null;
		}

	}
	

}
