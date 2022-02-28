<%@page import="kr.co.board1.dao.ArticleDao"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
		
	ArticleDao.getInstance().updateArticle(title, content, id);
	
	
	
	
	// 목록이동
	response.sendRedirect("/Board1/view.jsp?id="+id);
	


%>