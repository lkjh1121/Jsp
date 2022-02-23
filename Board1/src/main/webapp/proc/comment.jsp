<%@page import="kr.co.board1.bean.ArticleBean"%>
<%@page import="kr.co.board1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id      = request.getParameter("id");
	String uid     = request.getParameter("uid");
	String comment = request.getParameter("comment");
	String regip   = request.getRemoteAddr();
	
	ArticleBean article = new ArticleBean();
	article.setParent(id);
	article.setContent(comment);
	article.setUid(uid);
	article.setRegip(regip);
	
	// 댓글 Insert
	ArticleDao dao = ArticleDao.getInstance();
	dao.insertComment(article);
	
	// 원글 comment +1
	dao.updateArticleComment(id, true);
	
	// 리다이렉트
	response.sendRedirect("/Board1/view.jsp?id="+id);
%>