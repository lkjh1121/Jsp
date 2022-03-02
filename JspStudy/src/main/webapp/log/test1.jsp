<%@page import="java.util.logging.LogManager"%>
<%@page import="java.util.logging.Logger"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그 실습</title>
</head>
<body>
	<h3>로그 실습하기</h3>
	<%
		// Java 기본 로거	
		Logger _logger = Logger.getGlobal();
			
		_logger.info("info log!");
		_logger.warning("warning log!");
		_logger.severe("severe log!");
		
	%>

</body>
</html>