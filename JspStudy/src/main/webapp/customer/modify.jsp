<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.CustomerBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String custid = request.getParameter("custid");
	
	// 데이터베이스 작업(Statement)
	CustomerBean cb = null;
	
	try{
		String host = "jdbc:mysql://chhak.or.kr:3306/alskejdtod";
		String user = "alskejdtod";
		String pass = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `Customer` WHERE `custid`='"+custid+"'");
		
		if(rs.next()){
			cb = new CustomerBean();
			cb.setCustid(rs.getInt(1));
			cb.setName(rs.getString(2));
			cb.setAddress(rs.getString(3));
			cb.setPhone(rs.getString(4));
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
		<title>modify</title>
	</head>
	<body>
		<h3>고객수정</h3>
		<a href="./list.jsp">고객목록</a>
		<form action="./proc/modifyProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="custid" readonly value="<%= cb.getCustid() %>"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%= cb.getName() %>"/></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" value="<%= cb.getAddress() %>"/></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="phone" value="<%= cb.getPhone() %>"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정"/>
					</td>
				</tr>			
			</table>		
		</form>
	</body>
</html>