<%@page import="bean.User1Bean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	//데이터베이스 정보
	String host = "jdbc:mysql://3.35.52.87:3306/alskejdtod";
	String user = "test";
	String pass = "1234";
	
	User1Bean ub = null; // 선언
	
	try{
		// 1단계
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		// 3단계
		Statement stmt = conn.createStatement();
		
		// 4단계
		String sql = "SELECT * FROM `User1` WHERE `uid`='"+uid+"';";
		ResultSet rs = stmt.executeQuery(sql);
		
		// 5단계
		if(rs.next()){
			// 생성
			ub = new User1Bean();
			ub.setUid(rs.getString("uid"));
			ub.setName(rs.getString("name"));
			ub.setHp(rs.getString("hp"));
			ub.setAge(rs.getInt("age"));
		}
		
		// 6단계
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>3.Update</title>
	</head>
	<body>
		<h3>3.Update 실습</h3>
		
		<h4>User1 수정</h4>
		<a href="./2.Select.jsp">User1 목록보기</a>
		
		<form action="../proc/userUpdateProc.jsp">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid" readonly value="<%= ub.getUid() %>"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%= ub.getName() %>"/></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" value="<%= ub.getHp() %>"/></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="age" value="<%= ub.getAge() %>"/></td>
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