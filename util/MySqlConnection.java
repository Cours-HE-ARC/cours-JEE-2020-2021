package ch.jee.gc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Classe fournissant une instance de connection mysql
 *
 */
public class MySqlConnection {

	private final static String URL = "jdbc:mysql://localhost:3306/beershop";
	private final static String USER = "root";
	private final static String PASS = "toor";
	private static Connection connection = null;
	
	public static Connection getConnection () {
		
		if(connection == null) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
				connection = DriverManager.getConnection(URL,USER,PASS);
			} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException e) {
				throw new RuntimeException(e);
			}
		}
			
		return connection;
		
	}
	
}
