<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>5.Cookie</title>
		<!-- 
	 		날짜 : 2022/02/09
			이름 : 김재현
			내용 : JSP 내장객체 실습하기
		 
		 	Cookie
		 	 - 클라이언트와 서버간의 식벽을 위한 사용되는 조각파일
		 	 - 쿠키는 서버에서 생성하고 클라이언트로 전송
		 	 - 클라이언트는 전송된 쿠키를 보관하고 해당 서버로 다시 전송
		 -->
	</head>
	<body>
		<h3>5.Cookie</h3>
		<form action="../proc/cookieProc.jsp" method="post">
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