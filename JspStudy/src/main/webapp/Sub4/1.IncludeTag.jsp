<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>1.IncludeTag</title>
		<!-- 
			날짜 : 2022/02/10
			이름 : 김재현
			내용 : JSP 액션태그 실습하기		
			
			include 태그
			 - 일반적으로 UI 모듈, 공통 전역 파일을 삽입할 때 사용하는 태그
			 - JSP 페이지가 실행될때 삽입됨(동적타임)
			
			include 지시자
			 - 일반적으로 UI 모듈, 공통 전역 파일을 삽입할 때 사용하는 지시자
			 - 정적타임에 삽입, 참고) include 태그는 동적타임에 삽입
		-->
	</head>
	<body>
		<h3>1.Include 액션태그</h3>
		
		<!-- include 태그 -->
		<jsp:include page="../inc/_Header.jsp"></jsp:include>
		<jsp:include page="../inc/_Footer.jsp"></jsp:include>
		
		<!-- include 지시자 -->
		<%@ include file="../inc/_Header.jsp" %>
		<%@ include file="../inc/_Footer.jsp" %>
		
		<!-- include 함수 -->
		<%
			pageContext.include("../inc/_Header.jsp");
			pageContext.include("../inc/_Footer.jsp");		
		%>	
		
	</body>
</html>
