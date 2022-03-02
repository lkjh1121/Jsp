<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//세션해제
	session.invalidate(); 
	response.sendRedirect("/Farmstory1?success=101");
%>
<%
	//세션 해제	
	// session.invalidate();
	// 로그인 페이지 이동
	//response.sendRedirect("/Farmstory1?success=101");
%>