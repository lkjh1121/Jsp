package kr.co.farmstory1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.farmstory1.bean.File1Bean;
import kr.co.farmstory1.bean.ArticleBean;
import kr.co.farmstory1.bean.File1Bean;
import kr.co.farmstory1.db.DBConfig;
import kr.co.farmstory1.db.Sql;

public class ArticleDao {
	// ΩÃ±€≈Ê
	private static ArticleDao instance = new ArticleDao();
	
	public static ArticleDao getInstance() {
		return instance;
	}
	
	private ArticleDao() {}
	
	// ±‚∫ª CRUD
	public void insertArticle(ArticleBean ab) {
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
			psmt.setString(1, ab.getType());
			psmt.setString(2, ab.getTitle());
			psmt.setString(3, ab.getContent());
			psmt.setInt(4, ab.getFile());
			psmt.setString(5, ab.getUid());
			psmt.setString(6, ab.getRegip());
			psmt.executeUpdate();
			
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertComment(ArticleBean article) {
		
		try{
			Connection conn = DBConfig.getInstance().getConnection();
			
			// INSERT ºˆ«‡
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
	public int selectCountTotal(String type) {
		
		int total = 0;
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_NO);
			psmt.setString(1, type);
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}		
		return total;		
	}
	public File1Bean selectFile(String fno) {
		
		File1Bean fb = null;
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_FILE);
			psmt.setString(1, fno);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				fb = new File1Bean();
				fb.setFno(rs.getInt(1));
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
	public ArticleBean selectArticle(String no) {
		
		ArticleBean article = null;
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLE);
			psmt.setString(1, no);

			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				article = new ArticleBean();
				article.setNo(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setComment(rs.getInt(3));
				article.setType(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setContent(rs.getString(6));
				article.setFile(rs.getInt(7));
				article.setHit(rs.getInt(8));
				article.setUid(rs.getString(9));
				article.setRegip(rs.getString(10));
				article.setRdate(rs.getString(11));
				
				// ∆ƒ¿œ¡§∫∏
				File1Bean fb = new File1Bean();
				fb.setFno(rs.getInt(12));
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
	
	public List<ArticleBean> selectArticles(String type, int start) {
		
		List<ArticleBean> articles = new ArrayList<>();
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLES);
			psmt.setString(1, type);
			psmt.setInt(2, start);
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				ArticleBean article = new ArticleBean();
				article.setNo(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setComment(rs.getInt(3));
				article.setType(rs.getString(4));
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
		}catch (Exception e) {
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
				
				comment.setNo(rs.getInt(1));
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
	
	public List<ArticleBean> selectLatests(){
		
		List<ArticleBean> latests = new ArrayList<>();
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(Sql.SELECT_LATESTS);
			while(rs.next()) {
				ArticleBean article = new ArticleBean();						
				article.setNo(rs.getInt(1));
				article.setType(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setRdate(rs.getString(11).substring(2, 10));
				latests.add(article);
			}
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return latests;
	}
	
	public void updateArticle() {}
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
	
	public void updateArticleHit(int no) {
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_HIT);
			psmt.setInt(1, no);
			
			psmt.executeUpdate();
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public void updateArticleComment(String no, boolean isPlus) {
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			
			PreparedStatement psmt = null;
			
			if(isPlus) {
				psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_COMMENT_PLUS);
			}else {
				psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_COMMENT_MINUS);
			}
			
			psmt.setString(1, no);
			
			psmt.executeUpdate();
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public void updateArticle(String title, String content, String no) {
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setString(3, no);
			psmt.executeUpdate();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int updateComment(String content, String no) {
		
		int result = 0;
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_COMMENT);
			psmt.setString(1, content);
			psmt.setString(2, no);
			result = psmt.executeUpdate();
			
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public void deleteArticle() {}	
	
	public void deleteComment(String no) {
		// ¥Ò±€ ªË¡¶
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.DELETE_COMMENT);
			psmt.setString(1, no);
			psmt.executeUpdate();
			
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}


