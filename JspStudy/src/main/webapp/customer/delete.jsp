<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String custid = request.getParameter("custid");
	
	// 데이터베이스 작업(Statement)
	try{
		String host = "jdbc:mysql://3.35.52.87:3306/alskejdtod";
		String user = "test";
		String pass = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		stmt.executeUpdate("DELETE FROM `Customer` WHERE `custid`='"+custid+"'");
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 리스트 이동
	response.sendRedirect("./list.jsp");
%>