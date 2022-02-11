<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>useBeanProc</title>
	</head>
	<body>
		<h3>useBeanProc 액션태그 실습</h3>
		<%
			
			request.setCharacterEncoding("utf-8");
			/*
			String uid  	 = request.getParameter("uid");
			String pass 	 = request.getParameter("pass");
			String name 	 = request.getParameter("name");
			String addr      = request.getParameter("addr");
			String gender	 = request.getParameter("gender");
			String[] hobbies = request.getParameterValues("hobby");
			*/
		%>
		<jsp:useBean id="rb" class="test.RegisterBean">
			<jsp:setProperty name="rb" property="uid"/>
			<jsp:setProperty name="rb" property="pass"/>
			<jsp:setProperty name="rb" property="name"/>
			<jsp:setProperty name="rb" property="addr"/>
			<jsp:setProperty name="rb" property="gender"/>
			<jsp:setProperty name="rb" property="hobby"/>
		</jsp:useBean>
		
		<p>
			아이디 : <%= rb.getUid() %><br/>
			비밀번호 : <%= rb.getPass() %><br/>			
			이름 : <%= rb.getName() %><br/>
			주소 : <%= rb.getAddr() %><br/>		
			성별 : <%= (rb.getGender() == 1) ? "남자" : "여자" %><br/>			
			취미 : 
			<%	
				for(String hobby : rb.getHobby()){
					out.print(hobby+", ");
				}
			%>
			<br/>			
		</p>
		
		
	</body>
</html>