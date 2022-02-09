<%@page import="test.Member"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	Member member = new Member();
	member.setUid(uid);
	member.setPass(pass);
	
	
	

	if(uid.equals("abcd") && pass.equals("1234")){
		// 회원 맞음 -> 로그인 성공
		session.setAttribute("sessMember", member);
		
		response.sendRedirect("./loginSuccess.jsp");
	}else{
		// 회원 아님 - > 로그인 실패
		response.sendRedirect("./login.jsp?success=100");
		
		
		
		
		
	}





%>