<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@page import="kr.co.farmstory1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String cate    = request.getParameter("cate");
	String type    = request.getParameter("type");
	String uid     = request.getParameter("uid");
	String title   = request.getParameter("title");
	String content = request.getParameter("content");
	String fname   = request.getParameter("fname");
	String regip   = request.getRemoteAddr();
	ArticleBean ab = new ArticleBean();
	ab.setType(type);
	ab.setTitle(title);
	ab.setContent(content);
	ab.setFile(0);
	ab.setUid(uid);
	ab.setRegip(regip);
		
	ArticleDao.getInstance().insertArticle(ab);
	
	response.sendRedirect("/Farmstory1/board/list.jsp?cate="+cate+"&type="+type);
%>