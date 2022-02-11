<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 데이터 수신
	request.setCharacterEncoding("utf-8");
	String uid 	  = request.getParameter("uid");
	String name	  = request.getParameter("name");
	String gender = request.getParameter("gender");
	String hp  	  = request.getParameter("hp");
	String email  = request.getParameter("email");
	String pos 	  = request.getParameter("pos");
	String dep 	  = request.getParameter("dep");

	// 데이터베이스 작업(PreparStatement)
	
	String host = "jdbc:mysql://chhak.or.kr:3306/alskejdtod";
	String user = "alskejdtod";
	String pass = "1234";
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		
		String sql  = "UPDATE `Employee` SET ";
			   sql += "`name`='"+name+"',";
			   sql += "`gender`='"+gender+"',";
			   sql += "`hp`='"+hp+"',";
			   sql += "`email`='"+email+"',";
			   sql += "`pos`='"+pos+"',";
			   sql += "`dep`='"+dep+"' ";
			   sql += "WHERE `uid`='"+uid+"'";

			   stmt.executeUpdate(sql);
		
			   
		stmt.executeLargeUpdate(sql);
 		conn.close();
	
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 목록이동
	response.sendRedirect("../list.jsp");
%>