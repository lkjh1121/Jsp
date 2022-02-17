package kr.co.board1.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.board1.bean.ArticleBean;

public class ArticleDao {
	
	// 싱글톤 객체
	private static ArticleDao instance = new ArticleDao();
	
	public static ArticleDao getInstance() {
		return instance;
	}	
	private ArticleDao() {}
	
	// CRUD 메서드 정의
	public void insertFile(int id, String fname, String newName) {
		try{
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_FILE);
			psmt.setInt(1, id);
			psmt.setString(2, fname);
			psmt.setString(3, newName);
			psmt.executeUpdate();
			
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public int insertArticle(ArticleBean article) {
		
		try{
			Connection conn = DBConfig.getInstance().getConnection();
			
			// INSERT 수행
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
			psmt.setString(1, article.getTitle());
			psmt.setString(2, article.getContent());
			psmt.setInt(3, article.getFname() == null ? 0 : 1);
			psmt.setString(4, article.getUid());
			psmt.setString(5, article.getRegip());
			psmt.executeUpdate();
			
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		// 방금 INSERT한 글 번호 조회
		return selectMaxId();
	}
	
	public int selectMaxId() {
		
		int id = 0;
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(Sql.SELECT_MAX_ID);
			
			if(rs.next()){
				id = rs.getInt(1);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return id;
	}
	
	public int selectCountId() {
		
		int total = 0;
		
		try{
			Connection conn = DBConfig.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(Sql.SELECT_COUNT_ID);
			
			if(rs.next()){
				total = rs.getInt(1);
			}
			
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return total;
	}
	
	public void selectArticle() {}
	
	public List<ArticleBean> selectArticles(int start) {
		
		List<ArticleBean> articles = new ArrayList<>();
		
		try{
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLES);
			psmt.setInt(1, start);
			
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()){
				ArticleBean article = new ArticleBean();
				article.setId(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setComment(rs.getInt(3));
				article.setCate(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setContent(rs.getString(6));
				article.setFile(rs.getInt(7));
				article.setHit(rs.getInt(8));
				article.setUid(rs.getString(9));
				article.setRegip(rs.getString(10));
				article.setRdate(rs.getString(11));
				article.setNick(rs.getString(12));
					
				articles.add(article);
			}
			
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return articles;
	}
	
	public void updateArticle() {}
	public void deleteArticle() {}
		
	
}