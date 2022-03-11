package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import controller.DBConfig;
import vo.MemberVo;

public class MemberDao {

	// 싱글톤 객체
	private static MemberDao instance = new MemberDao();
	
	public static MemberDao getInstance() {
		return instance;
	}
	
	private MemberDao() {}
	
	// 기본메서드
	public void insertMember(MemberVo vo) {
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement("INSERT INTO `Member` VALUES (?,?,?,?,?,NOW())");
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getName());
			psmt.setString(3, vo.getHp());
			psmt.setString(4, vo.getPos());
			psmt.setString(5, vo.getDep());
			
			psmt.executeUpdate();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public MemberVo selectMember(String uid) {
		
		MemberVo member = new MemberVo();
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `Member` WHERE `uid`=?");
			psmt.setString(1, uid);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				member.setUid(rs.getString(1));
				member.setName(rs.getString(2));
				member.setHp(rs.getString(3));
				member.setPos(rs.getString(4));
				member.setDep(rs.getString(5));
				member.setRdate(rs.getString(6));
			}
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return member;
	}
	
	public List<MemberVo> selectMembers() {
		List<MemberVo> members = new ArrayList<>();
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM `Member`");
			
			while(rs.next()) {
				MemberVo vo = new MemberVo();
				vo.setUid(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setHp(rs.getString(3));
				vo.setPos(rs.getString(4));
				vo.setDep(rs.getString(5));
				vo.setRdate(rs.getString(6));
				members.add(vo);
			}
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return members;
	}
	
	
	public void updateMember(MemberVo vo) {
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement("UPDATE `Member` SET `name`=?, `hp`=?, `pos`=?, `dep`=? `rdate`=? WHERE `uid`=?");
			psmt.setString(1, vo.getName());
			psmt.setString(2, vo.getHp());
			psmt.setString(3, vo.getPos());
			psmt.setString(4, vo.getDep());
			psmt.setString(5, vo.getUid());
			psmt.setString(6, vo.getRdate());
			psmt.executeUpdate();
			
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void deleteMember(String uid) {
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement("DELETE FROM `Member` WHERE `uid`=?");
			psmt.setString(1, uid);
			psmt.executeUpdate();
			
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}