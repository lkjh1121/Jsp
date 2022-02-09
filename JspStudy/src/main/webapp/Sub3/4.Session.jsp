<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>4.Session</title>
		<!--
			날짜 : 2022/02/09
			이름 : 김재현
			내용 : JSP 내장객체 실습하기
			
			session 내장객체
			- 최초 요청에서 마지막 요청까지의 전체 시간
			- 클라이언트가 서버로 요청할때 서버에 기록되는 클라이언트의 정보 테이블(session Table)
			- 서버는 각 클라이언트에 대한 고유번호(Session Id)를 부여 클라이언트를 식별하기위해서
		  -->
	</head>
	<body>
	<h3>4.Session 실습하기</h3>
	
	<h4>로그인</h4>
		<form action="../proc/sessionProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid"/></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pass"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="로그인"/>
					</td>
				</tr>
			</table>			
		</form>
			
	
	
	
	
	
	</body>
</html>