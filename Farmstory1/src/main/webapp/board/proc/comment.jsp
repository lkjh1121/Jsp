<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@page import="kr.co.farmstory1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String no      = request.getParameter("no");
	String uid     = request.getParameter("uid");
	String comment = request.getParameter("comment");
	String regip   = request.getRemoteAddr();
	
	ArticleBean article = new ArticleBean();
	article.setParent(no);
	article.setContent(comment);
	article.setUid(uid);
	article.setRegip(regip);
	
	// 댓글 Insert
	ArticleDao dao = ArticleDao.getInstance();
	dao.insertComment(article);
	
	// 원글 comment +1
	dao.updateArticleComment(no, true);
	
	// 리다이렉트
	response.sendRedirect("/farmstory1/view.jsp?id="+no);
%>