<%@page import="kr.co.farmstory1.bean.UserBean"%>
<%@page import="kr.co.farmstory1.dao.UserDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String cate  = request.getParameter("cate");
	String type  = request.getParameter("type");
	String uid  = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	UserBean ub = UserDao.getInstance().selectUser(uid, pass);
	if(ub != null){
		// 회원이 맞을 경우
		session.setAttribute("sessUser", ub);
		
		if(cate == null && type ==null){
			response.sendRedirect("/Farmstory1");
		}else{
			response.sendRedirect("/Farmstory1/board/list.jsp?cate="+cate+"&type="+type);
		}
	}else{
		// 회원이 아닐 경우
		response.sendRedirect("/Farmstory1/user/login.jsp?success=100");
	}
%>