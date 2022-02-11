<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String name    = request.getParameter("name");
	String address = request.getParameter("address");
	String phone   = request.getParameter("phone");
	
	// 데이터베이스 작업(PrepareStatement 사용)
	String host = "jdbc:mysql://chhak.or.kr:3306/alskejdtod";
	String user = "alskejdtod";
	String pass = "1234";
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		String sql = "INSERT INTO `Customer` (`name`, `address`, `phone`) VALUES (?,?,?);";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setString(2, address);
		psmt.setString(3, phone);
		psmt.executeUpdate();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 직원목록 이동
	response.sendRedirect("../list.jsp");
%>