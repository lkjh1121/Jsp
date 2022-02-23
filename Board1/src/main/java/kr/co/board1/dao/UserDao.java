package kr.co.board1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.co.board1.db.DBConfig;
import kr.co.board1.db.Sql;

public class UserDao {

	private static UserDao instance = new UserDao();
	
	public static UserDao getInstance() {
		return instance;
	}
	
	private UserDao() {}
	
	// ±âº» CRUD ¸Þ¼­µå
	public void insertUser() {}
	
	public int selectUserCount(String info, int what) {
		
		int count = 0;
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = null; 
			if(what == 1) {
				psmt = conn.prepareStatement(Sql.SELECT_COUNT_UID);
			}else if(what == 2) {
				psmt = conn.prepareStatement(Sql.SELECT_COUNT_NICK);
			}else if(what == 3) {
				psmt = conn.prepareStatement(Sql.SELECT_COUNT_EMAIL);
			}else if(what == 4) {
				psmt = conn.prepareStatement(Sql.SELECT_COUNT_HP);
			}
			psmt.setString(1, info);
			
			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}			
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	public void selectUser() {}
	public void selectUsers() {}
	public void updateUser() {}
	public void deleteUser() {}
	
	
	
}