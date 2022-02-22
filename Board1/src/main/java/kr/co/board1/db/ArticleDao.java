package kr.co.board1.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.board1.bean.ArticleBean;
import kr.co.board1.bean.FileBean;

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
	
	public void insertComment(ArticleBean article) {
		
		try{
			Connection conn = DBConfig.getInstance().getConnection();
			
			// INSERT 수행
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_COMMENT);
			psmt.setInt(1, article.getParent());
			psmt.setString(2, article.getContent());
			psmt.setString(3, article.getUid());
			psmt.setString(4, article.getRegip());
			psmt.executeUpdate();
			
			conn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
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
	
	public FileBean selectFile(String fid) {
		
		FileBean fb = null;
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_FILE);
			psmt.setString(1, fid);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				fb = new FileBean();
				fb.setFid(rs.getInt(1));
				fb.setParent(rs.getInt(2));
				fb.setoName(rs.getString(3));
				fb.setnName(rs.getString(4));
				fb.setDownload(rs.getInt(5));
				fb.setRdate(rs.getString(6));
			}
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return fb;
	}
	
	public ArticleBean selectArticle(String id) {
		
		ArticleBean article = null;
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLE);
			psmt.setString(1, id);

			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				article = new ArticleBean();
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
				
				// 파일정보
				FileBean fb = new FileBean();
				fb.setFid(rs.getInt(12));
				fb.setParent(rs.getInt(13));
				fb.setoName(rs.getString(14));
				fb.setnName(rs.getString(15));
				fb.setDownload(rs.getInt(16));
				fb.setRdate(rs.getString(17));
									
				article.setFb(fb);
			}
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return article;
	}
	
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
	
	public List<ArticleBean> selectComments(String parent) {
		
		List<ArticleBean> comments = new ArrayList<>();
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COMMENTS);
			psmt.setString(1, parent);
			
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				ArticleBean comment = new ArticleBean();
				
				comment.setId(rs.getInt(1));
				comment.setParent(rs.getInt(2));
				comment.setContent(rs.getString(6));
				comment.setUid(rs.getString(9));
				comment.setRegip(rs.getString(10));
				comment.setRdate(rs.getString(11));
				comment.setNick(rs.getString(12));
				
				comments.add(comment);
			}
			
			rs.close();
			psmt.close();
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return comments;
	}
	
	public void updateFileCount(int fid) {
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_FILE_COUNT);
			psmt.setInt(1, fid);
			
			psmt.executeUpdate();
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public void updateArticleHit(int id) {
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_HIT);
			psmt.setInt(1, id);
			
			psmt.executeUpdate();
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public void updateArticleComment(String id, boolean isPlus) {
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			
			PreparedStatement psmt = null;
			
			if(isPlus) {
				psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_COMMENT_PLUS);
			}else {
				psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_COMMENT_MINUS);
			}
			
			psmt.setString(1, id);
			
			psmt.executeUpdate();
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public void updateArticle() {}
	
	public int updateComment(String content, String id) {
		
		int result = 0;
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_COMMENT);
			psmt.setString(1, content);
			psmt.setString(2, id);
			result = psmt.executeUpdate();
			
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public void deleteArticle() {}	
	public void deleteComment(String id) {
		// 댓글 삭제
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.DELETE_COMMENT);
			psmt.setString(1, id);
			psmt.executeUpdate();
			
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
		
	
}