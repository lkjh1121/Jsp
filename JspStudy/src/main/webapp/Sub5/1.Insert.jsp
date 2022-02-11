<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>1.Insert</title>
		<%--
			날짜 : 2022/02/10
			이름 : 김재현
			내용 : JDBC 프로그래밍 실습하기
		--%>
	</head>
	<body>
		<h3>1.Insert 실습</h3>
		
		<h4>User1 등록</h4>
		<a href="./2.Select.jsp">User1 목록보기</a>
		<form action="../proc/userInsertProc.jsp">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"/></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp"/></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="text" name="age"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="등록"/>
					</td>
				</tr>			
			</table>		
		</form>
	</body>
</html>