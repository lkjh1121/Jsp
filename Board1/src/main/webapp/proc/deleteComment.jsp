<%@page import="kr.co.board1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 삭제 댓글 번호 수신
	request.setCharacterEncoding("utf-8");
	String id     = request.getParameter("id");
	String parent = request.getParameter("parent");
	
	ArticleDao dao = ArticleDao.getInstance();
	
	// 댓글 삭제 
	dao.deleteComment(id);
	
	// 원글 comment 카운트 -1
	dao.updateArticleComment(parent, false);
	
	// 리다이렉트
	response.sendRedirect("/Board1/view.jsp?id="+parent);
%>