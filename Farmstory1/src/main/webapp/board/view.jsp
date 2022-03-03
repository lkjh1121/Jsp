<%@page import="java.util.List"%>
<%@page import="kr.co.farmstory1.dao.ArticleDao"%>
<%@page import="kr.co.farmstory1.bean.ArticleBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	// 로그인하지 않고 글목록 요청하면 로그인 페이지로 이동시킴
	if(sessUser == null){
		response.sendRedirect("/Farmstory1/user/login.jsp?success=102");
		return; // <-- 프로그램 실행 여기까지
	}
	
	request.setCharacterEncoding("utf-8");
	String cate = request.getParameter("cate");
	String type = request.getParameter("type");
	String no = request.getParameter("no");
	
	pageContext.include("./inc/_"+cate+".jsp");
	
	
	// 글 가져오기
	ArticleDao dao = ArticleDao.getInstance();
	ArticleBean article = dao.selectArticle(no);
	
	// 조회수 +1
	dao.updateArticleHit(article.getNo());
	
	// 댓글 가져오기
	List<ArticleBean> comments = dao.selectComments(no);
%>

<section id="board" class="view">
    <h3>글보기</h3>
    <table>
        <tr>
            <td>제목</td>
            <td><input type="text" name="title" value="<%= article.getTitle() %>" readonly/></td>
        </tr>
        <tr>
            <td>첨부파일</td>
            <td>
                <a href="/Farmstory1/Board/proc/download.jsp?fid=<%= article.getFb().getFno() %>"><%= article.getFb().getoName() %></a>
                <span><%= article.getFb().getDownload() %>회 다운로드</span>
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" readonly><%= article.getContent() %></textarea>
            </td>
        </tr>
    </table>
    <div>
        <a href="#" class="btnDelete">삭제</a>
        <a href="/Farmstory1/board/modify.jsp?cate=<%= cate %>&type=<%= type %>" class="btnModify">수정</a>
        <a href="/Farmstory1/board/list.jsp?cate=<%= cate %>&type=<%= type %>" class="btnList">목록</a>
    </div>  
    
    <!-- 댓글리스트 -->
    <section class="commentList">
        <h3>댓글목록</h3>
        <article class="comment">
            <span>
                <span>길동이</span>
                <span>20-05-13</span>
            </span>
            <textarea name="comment" readonly>댓글 샘플입니다.</textarea>
            <div>
                <a href="#">삭제</a>
                <a href="#">수정</a>
            </div>
        </article>
        <p class="empty">
            등록된 댓글이 없습니다.
        </p>
    </section>

    <!-- 댓글입력폼 -->
    <section class="commentForm">
        <h3>댓글쓰기</h3>
        <form action="#">
            <textarea name="comment"></textarea>
            <div>
                <a href="#" class="btnCancel">취소</a>
                <input type="submit" class="btnWrite" value="작성완료"/>
            </div>
        </form>
    </section>
</section>

<!-- 내용 끝 -->
</article>
</section>
</div>

<%@ include file="../_footer.jsp" %>