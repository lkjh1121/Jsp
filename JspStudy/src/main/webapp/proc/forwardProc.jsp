<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>forwardProc</title>
	</head>
	<body>
		<h3>포워드 페이지</h3>
		<%
			 pageContext.forward("../Sub1/Hello.jsp");
			
			// 내부 서버 페이지간의 요청이기 때문에 외부서버 요청을 할 수 없다.
			// pageContext.forward("https://naver.com"); 외부서버X 안댐
		%>
	</body>
</html>