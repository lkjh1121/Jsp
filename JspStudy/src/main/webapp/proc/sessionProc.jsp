<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>sessionProc</title>
	</head>
	<body>
		<h3>세션처리 페이지</h3>
		<%
		
		// 전송 데이터 수신
		request.setCharacterEncoding("utf-8");
		String uid = request.getParameter("uid");		
		String pass = request.getParameter("pass");		
		
		// 사용자 정보 세션테이블 저장
		session.setAttribute("uid", uid);
		session.setAttribute("pass", pass);
		%>
		
		<h4>세션 저장완료!</h4>
		<a href="./sessionConfirm.jsp">세션확인</a>	
		
		
		
		
	</body>
</html>