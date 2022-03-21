package kr.co.farmstory2.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
	
	// 싱글톤객체
	private static DBConfig instance = new DBConfig();
	
	public static DBConfig getInstance() {
		return instance;
	}
	
	private DBConfig() {}
	
	// 개발용
	private final String HOST = "jdbc:mysql://3.35.52.87:3306/alskejdtod";
	private final String USER = "test";
	private final String PASS = "1234";
	
	// 배포용
	// private final String HOST = "jdbc:mysql://localhost:3306/alskejdtod";
	//private final String USER = "test";
	//private final String PASS = "1234";
	
	public Connection getConnection() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		return conn;
	}
}