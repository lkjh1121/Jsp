package kr.co.board2.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
	
	// ½Ì±ÛÅæ °´Ã¼
	private static DBConfig instance = new DBConfig();
	
	public static DBConfig getInstance() {
		return instance;
	}
	
	private DBConfig() {}
	
	// °³¹ß¿ë
	private final String HOST = "jdbc:mysql://3.35.52.87:3306/alskejdtod";
	private final String USER = "test";
	private final String PASS = "1234";
	/*¹èÆ÷¿ë
	private final String HOST = "jdbc:mysql://localhost:3306/alskejdtod";
	private final String USER = "test";
	private final String PASS = "1234";
	*/
	public Connection getConnection() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		return conn;
	}
}