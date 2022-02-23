<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.co.board1.dao.UserDao"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	
	// 아이디 여부확인
	int count = UserDao.getInstance().selectUserCount(uid, 1);
	
	// 결과값 리턴
	JsonObject json = new JsonObject();
	json.addProperty("result", count);
	
	out.print(json);
%>