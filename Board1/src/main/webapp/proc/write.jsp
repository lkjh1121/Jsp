<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.board1.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="kr.co.board1.db.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신 
	request.setCharacterEncoding("utf-8");
	// Multipart 전송 데이터 수신 // ↓ 파일경로
	String path = request.getServletContext().getRealPath("/file"); // 업로드 파일이 저장될 시스템 경로
	int maxsize = 1024 * 1024 * 10; // 최대 파일 허용량 10MB
	
	MultipartRequest mr = new MultipartRequest(request, path, maxsize, "UTF-8", new DefaultFileRenamePolicy());
	String title   = mr.getParameter("title");	
	String content = mr.getParameter("content");	
	String fname   = mr.getFilesystemName("fname");	
	String uid     = mr.getParameter("uid");	
	String regip   = request.getRemoteAddr();
	
	// 데이터베이스 처리
	int id = 0;
	
	try{
		Connection conn = DBConfig.getInstance().getConnection();
		
		// INSERT 수행
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
		psmt.setString(1, title);
		psmt.setString(2, content);
		psmt.setInt(3, fname == null ? 0 : 1);
		psmt.setString(4, uid);
		psmt.setString(5, regip);
		psmt.executeUpdate();
		
		// 방금 INSERT한 글 번호 조회
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(Sql.SELECT_MAX_ID);
		
		if(rs.next()){
			id = rs.getInt(1);
		}
		
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 파일첨부 했으면 파일처리 작업
	if(fname != null){
		// 파일명 수정
		int i = fname.lastIndexOf(".");
		String ext = fname.substring(i);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");
		String now = sdf.format(new Date());
		String newName = now+uid+ext;
		
		File oriFile = new File(path+"/"+fname);
		File newFile = new File(path+"/"+newName);
		
		oriFile.renameTo(newFile);
		
		
		// 파일테이블 Insert
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
		
	} // 파일처리 작업 끝
	
	
	// 리다이렉트
	response.sendRedirect("/Board1/list.jsp");
%>