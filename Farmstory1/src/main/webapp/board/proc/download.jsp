<%@page import="kr.co.farmstory1.bean.File1Bean"%>
<%@page import="kr.co.farmstory1.dao.ArticleDao"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
	String fno = request.getParameter("fno");
	
	// 파일정보 가져오기
	ArticleDao dao = ArticleDao.getInstance();
	File1Bean fb = dao.selectFile(fno);
	
	// 파일 다운로드 카운트 +1
	dao.updateFileCount(fb.getFno());
	
	// 파일 다운로드 response 헤더수정	
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(fb.getoName(), "utf-8"));
	response.setHeader("Content-Transfer-Encoding", "binary");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "private");
	
	// response 객체 스트림 작업
	String path = request.getServletContext().getRealPath("/file");
	
	File file = new File(path+"/"+fb.getnName());
	
	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	
	while(true){
		int data = bis.read();
		
		if(data == -1){
	break;			
		}
		
		bos.write(data);
	}
	
	bos.close();
	bis.close();
%>