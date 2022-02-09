<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>session</title>
	</head>
	<body>
	<h3>현재 클라이언트 세션확인</h3>
	<%
		String sid = session.getId();
		String uid = (String) session.getAttribute("uid");
		String pass = (String) session.getAttribute("pass");
	
	%>>
	<p>
		현재 클라이언트 세션 아이디 : <%= sid %><br/>
		현재 클라이언트 입력 아이디 : <%= uid %><br/>
		현재 클라이언트 입력 비밀번호 : <%= pass %><br/>
	</p>                                                                                                                                     
	
	<a href="../Sub3/4.Session.jsp">처음으로</a>
	
	</body>
</html>