<%@page import="java.util.logging.LogManager"%>
<%@page import="java.util.logging.Logger"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α� �ǽ�</title>
</head>
<body>
	<h3>�α� �ǽ��ϱ�</h3>
	<%
		// Java �⺻ �ΰ�	
		Logger _logger = Logger.getGlobal();
			
		_logger.info("info log!");
		_logger.warning("warning log!");
		_logger.severe("severe log!");
		
	%>

</body>
</html>