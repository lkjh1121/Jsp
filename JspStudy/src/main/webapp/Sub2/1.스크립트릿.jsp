<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1.스크립트릿.jsp</title>
		<!-- 
			날짜 : 2022/02/07
			이름 : 김재현
			내용 : JSP 스크립트릿(Scriptlet) 실습하기 교재 p106
			
			스크립트릿(Scriptlet)
			 - 정적문서(HTML)에 프로그래밍 코드를 삽입하기 위한 영역 문법
			 - 페이지를 요청하면 WAS에서 해당 스크립트릿 코드영역을 실행 
			 - 스크립트릿 종류에는 스크립트릿, 선언문, 표현식이 있다.
		-->
	</head>
	<body>
		<h3>1.Scriptlet 기본</h3>
		<%
			// 스크립트릿 영역(프로그래밍 코드 영역)
			int     var1 = 1;
			boolean var2 = true;
			double  var3 = 3.14;
			String  var4 = "Hello";
			
			out.println("<h4>var1 : "+var1+"</h4>");
			out.println("<h4>var2 : "+var2+"</h4>");
			%>
		
		<!-- 표현식(Expression) 출력 -->
		<h4>var3 : <%= var3 %></h4>
		<h4>var4 : <%= var4 %></h4>
	
	</body>
</html>