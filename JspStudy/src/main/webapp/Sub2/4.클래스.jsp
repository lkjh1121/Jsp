<%@page import="test.Account"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>4.클래스</title>
		<%--
			날짜 : 2022/02/07
			이름 : 김재현
			내용 : JSP 클래스 실습하기 교재 p124
		--%>
	</head>
	<body>
		<h3>4.클래스</h3>
		<%
			Account kb = new Account("국민은행", "101-10-1111", "김유신", 30000);
			kb.deposit(50000);
			kb.withdraw(30000);
			kb.show(out);
			
			Account wr = new Account("우리은행", "101-10-2222", "김춘추", 10000);
			wr.deposit(30000);
			wr.withdraw(40000);
			wr.show(out);
		%>
		
	</body>
</html>