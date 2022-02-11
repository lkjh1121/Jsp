<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	// 데이터 수신
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");

	// 데이터베이스 정보
	String host = "jdbc:mysql://chhak.or.kr:3306/alskejdtod";	
	String user = "alskejdtod";	
	String pass = "1234";	
		
	
	try{

		// 1단계- JDBC 드라이버 로드
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2단계 - 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		// 3단계 - SQL 실행객체 생성
		Statement stmt = conn.createStatement();
		
		// 4단계 - SQL 실행
		String sql = "INSERT INTO `User1` VALUES ('"+uid+"', '"+name+"', '"+hp+"', "+age+");";
		stmt.executeUpdate(sql);
		
		// 5단계 - 결과처리 (SELECT일 경우)
		
		// 6단계 - 데이터베이스 종료
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 리다이렉트
	response.sendRedirect("../Sub5/1.Insert.jsp");
	
	
%>