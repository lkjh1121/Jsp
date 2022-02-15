<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 데이터 수신
	request.setCharacterEncoding("utf-8");
	String custid  = request.getParameter("custid");
	String name    = request.getParameter("name");
	String address = request.getParameter("address");
	String phone   = request.getParameter("phone");
		
	// 데이터베이스 작업(PrepareStatement)
	try{
		String host = "jdbc:mysql://3.35.52.87:3306/alskejdtod";
		String user = "test";
		String pass = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		
		String sql  = "UPDATE `Customer` SET ";
		       sql += "`name`='"+name+"',";
		       sql += "`address`='"+address+"',";
		       sql += "`phone`='"+phone+"' ";
		       sql += "WHERE `custid`='"+custid+"'";
		       
		stmt.executeUpdate(sql);		       	
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 목록이동
	response.sendRedirect("../list.jsp");
	
%>