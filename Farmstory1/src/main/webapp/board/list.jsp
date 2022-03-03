<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.farmstory1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String cate = request.getParameter("cate");
	String type = request.getParameter("type");
	
	pageContext.include("./inc/_"+cate+".jsp");
	
	
	// 전체 게시판 글 갯수 구해서 각 페이지 시작번호 구하기
	ArticleDao dao = ArticleDao.getInstance();
	
	int total = dao.selectCountTotal(type);
	int start = 0;
	
	int pageStartNum = total - start;
	
	// 글 가져오기
	List<ArticleBean> articles = dao.selectArticles(type, start);
	
%>
<section id="board" class="list">
    <h3>글목록</h3>
    <article>
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
                <td><a href="/Farmstory1/board/view.jsp?cate=<%= cate %>&type=<%= type %>&no=<%= article.getNo() %>"><%= article.getTitle() %></a>&nbsp;[<%= article.getComment() %>]</td>
                <td><%= article.getNick() %></td>
                <td><%= article.getRdate().substring(2, 10) %></td>
                <td><%= article.getHit() %></td>
            </tr>
            <% } %>
        </table>
    </article>

    <!-- 페이지 네비게이션 -->
    <div class="paging">
        <a href="#" class="prev">이전</a>
        <a href="#" class="num current">1</a>                
        <a href="#" class="num">2</a>                
        <a href="#" class="num">3</a>                
        <a href="#" class="next">다음</a>
    </div>

    <!-- 글쓰기 버튼 -->
    <a href="/Farmstory1/board/write.jsp?cate=<%= cate %>&type=<%= type %>" class="btnWrite">글쓰기</a>

</section>

<!-- 내용 끝 -->
</article>
</section>
</div>

<%@ include file="../_footer.jsp" %>