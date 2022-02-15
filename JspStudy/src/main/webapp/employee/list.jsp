<%@page import="bean.EmployeeBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 데이터베이스 작업(Statement 사용)
	String host = "jdbc:mysql://3.35.52.87:3306/alskejdtod";
	String user = "test";
	String pass = "1234";
	
	List<EmployeeBean> employees = new ArrayList<>();
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT * FROM `Employee`";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			
			EmployeeBean eb = new EmployeeBean();
			eb.setUid(rs.getString(1));
			eb.setName(rs.getString(2));
			eb.setGender(rs.getInt(3));
			eb.setHp(rs.getString(4));
			eb.setEmail(rs.getString(5));
			eb.setPos(rs.getString(6));
			eb.setDep(rs.getInt(7));
			eb.setRdate(rs.getString(8));
			
			employees.add(eb);
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
		<h3>Employee목록</h3>
		<a href="./register.jsp">직원등록</a>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>휴대폰</th>
				<th>이메일</th>
				<th>직급</th>
				<th>부서</th>
				<th>입사일</th>
				<th>관리</th>
			</tr>
			<% for(EmployeeBean eb : employees){ %>
				<tr>
					<td><%= eb.getUid() %></td>
					<td><%= eb.getName() %></td>
					<td>
					<%
						if(eb.getGender() == 1){
							out.println("남");
						}else{
							out.println("여");
						}
					%>
					</td>
					<td><%= eb.getHp() %></td>
					<td><%= eb.getEmail() %></td>
					<td><%= eb.getPos() %></td>
					<td>
						<% 
							switch(eb.getDep()){
							case 101:
								out.println("영업1부");
								break;
							case 102:
								out.println("영업2부");
								break;
							case 103:
								out.println("영업3부");
								break;
							case 104:
								out.println("영업4부");
								break;
							case 105:
								out.println("인사부");
								break;
							}
						%>
					</td>
					<td><%= eb.getRdate().substring(0, 10) %></td>
					<td>
						<a href="./modify.jsp?uid=<%= eb.getUid() %>">수정</a>
						<a href="./delete.jsp?uid=<%= eb.getUid() %>">삭제</a>
					</td>			
				</tr>
			<% } %>
		</table>		
	</body>
</html>