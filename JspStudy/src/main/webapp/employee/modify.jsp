<%@page import="bean.EmployeeBean"%>
<%@page import="bean.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	
	// 데이터베이스 작업(Statement)
	EmployeeBean eb = null;
	
	try{
		String host = "jdbc:mysql://chhak.or.kr:3306/alskejdtod";
		String user = "alskejdtod";
		String pass = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `Employee` WHERE `uid`='"+uid+"'");
		
		if(rs.next()){
			eb = new EmployeeBean();
			eb.setUid(rs.getString(1));
			eb.setName(rs.getString(2));
			eb.setGender(rs.getInt(3));
			eb.setHp(rs.getString(4));
			eb.setEmail(rs.getString(5));
			eb.setPos(rs.getString(6));
			eb.setDep(rs.getInt(7));
			eb.setRdate(rs.getString(8));
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
		<h3>직원수정</h3>
		<a href="./list.jsp">직원목록</a>
		<form action="./proc/modifyProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid" readonly value="<%= eb.getUid() %>"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%= eb.getName() %>"/></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<label><input type="radio" name="gender" value="1"/>남</label>
						<label><input type="radio" name="gender" value="2"/>여</label>
					</td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" value="<%= eb.getHp() %>"/></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
					<input type="text" name="email" value="<%= eb.getEmail() %>"/></td>
				</tr>
				<tr>
					<td>직급</td>
					<td>
						<select name="pos">
							<option>사원</option>
							<option>대리</option>
							<option>과장</option>
							<option>차장</option>
							<option>부장</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>부서</td>
					<td>
						<select name="dep">
							<option value="101">영업1부</option>
							<option value="102">영업2부</option>
							<option value="103">영업3부</option>
							<option value="104">영업4부</option>
							<option value="105">인사부</option>
						</select>
					</td>
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