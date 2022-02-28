<%@page import="kr.co.board1.log.MyLog"%>
<%@page import="kr.co.board1.dao.ArticleDao"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.board1.bean.ArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.board1.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.board1.db.DBConfig"%>
<%@page import="kr.co.board1.bean.UserBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserBean sessUser = (UserBean) session.getAttribute("sessUser");
	
	// 로그인하지 않고 글목록 요청하면 로그인 페이지로 이동시킴
	if(sessUser == null){
		response.sendRedirect("/Board1/user/login.jsp?success=102");
		return; // <-- 프로그램 실행 여기까지
	}
	
	MyLog.getInstance().info("list - 1");
	
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String pg = request.getParameter("pg");
	
	MyLog.getInstance().info("list pg : "+pg);
	
	// 페이지 번호 작업
	int total = ArticleDao.getInstance().selectCountId();
	int lastPageNum = 0;
	
	if(total % 10 == 0){
		lastPageNum = total / 10;
	}else{
		lastPageNum = total / 10 + 1;
	}
	
	int currentPg = 1;
	
	if(pg != null){
		currentPg = Integer.parseInt(pg);
	}
	
	int start = (currentPg - 1) * 10;
	int pageStartNum = total - start;
	
	int groupCurrent = (int)Math.ceil(currentPg / 10.0);
	int groupStart = (groupCurrent - 1) * 10 + 1;  
	int groupEnd   = groupCurrent * 10;
	
	if(groupEnd > lastPageNum){
		groupEnd = lastPageNum;
	}
	
	MyLog.getInstance().info("list 3");
	
	// 글목록 가져오기
	List<ArticleBean> articles = ArticleDao.getInstance().selectArticles(start);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글목록</title>
    <link rel="stylesheet" href="/Board1/css/style.css">
</head>
<body>
    <div id="wrapper">
        <section id="board" class="list">
            <h3>글목록</h3>
            <article>
                <p>
                    <%= sessUser.getNick() %>님 반갑습니다.
                    <a href="/Board1/user/proc/logout.jsp" class="logout">[로그아웃]</a>
                </p>
                <table border="0">
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>날짜</th>
                        <th>조회</th>
                    </tr>
                    <% for(ArticleBean article : articles){ %>
                    <tr>
                        <td><%= pageStartNum-- %></td>
                        <td><a href="/Board1/view.jsp?id=<%= article.getId() %>"><%= article.getTitle() %></a>&nbsp;[<%= article.getComment() %>]</td>
                        <td><%= article.getNick() %></td>
                        <td><%= article.getRdate().substring(2, 10) %></td>
                        <td><%= article.getHit() %></td>
                    </tr>
                    <% } %>
                </table>
            </article>

            <!-- 페이지 네비게이션 -->
            <div class="paging">
            	
            	<% if(groupStart > 1){ %>
                	<a href="/Board1/list.jsp?pg=<%= groupStart-1 %>" class="prev">이전</a>
                <% } %>
                
                <% for(int p=groupStart ; p<=groupEnd ; p++){ %>
                	<a href="/Board1/list.jsp?pg=<%= p %>" class="num <%= (currentPg == p) ? "current":"" %>"><%= p %></a>
				<% } %>                         
                                
                <% if(groupEnd < lastPageNum){ %>                
                	<a href="/Board1/list.jsp?pg=<%= groupEnd+1 %>" class="next">다음</a>
                <% } %>
            </div>

            <!-- 글쓰기 버튼 -->
            <a href="/Board1/write.jsp" class="btnWrite">글쓰기</a>

        </section>
    </div>    
</body>
</html>