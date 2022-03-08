<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>1.EL</title>
	</head>
	<body>
		<h3>1.표현식언어(Expression Language)</h3>
		<%
			String name = "홍길동";
			int    num1 = 1;
			double num2 = 2.13;
		
			// 표현언어로 출력을 위한 내장객체로 저장
			pageContext.setAttribute("name", name);
			request.setAttribute("num1", num1);
			session.setAttribute("num2", num2);
		
		%>
		
		
		
		<h4>표현식</h4>
		<p>
		
			name : <%= name %><br/>
			num1 : <%= num1 %><br/>
			num2 : <%= num2 %><br/>
			num1 + num2 : <%= num1 + num2 %><br/>
		</p>

		<h4>표현식 언어</h4>
		<p>
		
			name : ${name}<br/> 
			num1 : ${num1}<br/> 
			num2 : ${num2}<br/> 
			num1+num2 : ${num1+num2}<br/> 
		
		</p>
	</body>
</html>