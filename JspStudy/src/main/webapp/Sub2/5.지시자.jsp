<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page info="developed by chhak" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>5.지시자</title>
		<!-- 
			날짜 : 2022/02/07
			이름 : 김재현
			내용 : JSP 지시자(Directive) 실습하기 교재 p82
			
			지시자(Directive)
			 - 클라이언트가 요청한 JSP페이지가 실행될 때 필요한 정보를 지정하는 역할
			 - 스크립트릿과 함께 JSP페이지를 구성하는 구성요소
			 - 대표적으로 page, include 지시자가 있다.
			 
			include 지시자
			 - 일반적으로 UI 모듈, 공통 전역 파일을 삽입할 때 사용하는 지시자
			 - 정적타임에 삽입, 참고) include 태그는 동적타임에 삽입			 
		-->
		<style>
			header {background: orange;}
			footer {background: green;}
		</style>
	</head>
	<body>
		<h3>5.지시자</h3>
		
		<h4>page 지시자</h4>
		info : <%= getServletInfo() %>
		
		<h4>include 지시자</h4>
		<%@ include file="../inc/_Header.jsp" %>
		<%@ include file="../inc/_Footer.jsp" %>
	</body>
</html>