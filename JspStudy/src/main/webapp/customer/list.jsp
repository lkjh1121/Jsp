<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.CustomerBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 데이터베이스 작업(Statement 사용)
	String host = "jdbc:mysql://3.35.52.87:3306/alskejdtod";
	String user = "test";
	String pass = "1234";
	
	List<CustomerBean> customers = new ArrayList<>();
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT * FROM `Customer`";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			CustomerBean cb = new CustomerBean();
			cb.setCustid(rs.getInt(1));
			cb.setName(rs.getString(2));
			cb.setAddress(rs.getString(3));
			cb.setPhone(rs.getString(4));			
			customers.add(cb);
		}
		
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
		
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>list</title>
	</head>
	<body>
		<h3>고객목록</h3>
		<a href="./register.jsp">고객 등록하기</a>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>주소</th>
				<th>휴대폰</th>
				<th>관리</th>
			</tr>
			<% for(CustomerBean cb : customers){ %>
				<tr>
					<td><%= cb.getCustid() %></td>
					<td><%= cb.getName() %></td>
					<td><%= cb.getAddress() %></td>
					<td><%= cb.getPhone() %></td>
					<td>
						<a href="./modify.jsp?custid=<%= cb.getCustid() %>">수정</a>
						<a href="./delete.jsp?custid=<%= cb.getCustid() %>">삭제</a>
					</td>			
				</tr>
			<% } %>
		</table>		
	</body>
</html>