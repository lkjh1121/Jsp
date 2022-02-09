<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>cookieProc</title>
	</head>
	<body>
	<h3>쿠키 생성해서 전송하기</h3>
		<%
			request.setCharacterEncoding("utf-8");
			String uid  = request.getParameter("uid");
			String pass = request.getParameter("pass");
		
			// 쿠키 생성
			Cookie ck1 = new Cookie("uid", uid);		
			Cookie ck2 = new Cookie("pass", pass);		
		
			// 쿠키전송
			response.addCookie(ck1);
			response.addCookie(ck2);
			
		%>
		
		<h4>쿠키전송 완료</h4>
		
		<a href="./cookieConfirm.jsp">서버로 쿠키 전송하기</a>
		
	</body>
</html>