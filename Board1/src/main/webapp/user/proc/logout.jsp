<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 세션 해제
	session.invalidate();
	// 로그인 페이지 이동
	response.sendRedirect("/Board1/user/login.jsp?success=101");
%>