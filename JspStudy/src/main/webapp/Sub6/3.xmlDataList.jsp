<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/xml;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String host = "jdbc:mysql://3.35.52.87:3306/alskejdtod";
	String user = "test";
	String pass = "1234";
	
	String xml = "<members>";
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT * FROM `Member`";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){	
			xml += "<member>";
			xml += "<uid>"+rs.getString(1)+"</uid>";
			xml += "<name>"+rs.getString(2)+"</name>";
			xml += "<hp>"+rs.getString(3)+"</hp>";
			xml += "<pos>"+rs.getString(4)+"</pos>";
			xml += "<dep>"+rs.getInt(5)+"</dep>";
			xml += "<rdate>"+rs.getString(6)+"</rdate>";
			xml += "</member>";
		}
		
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	xml += "</members>";
	
	// xml 데이터 출력
	out.print(xml);
%>