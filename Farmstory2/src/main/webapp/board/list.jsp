<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../_header.jsp" %>
<jsp:include page="./inc/_${cate}.jsp"/>
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
            <c:forEach var="article" items="${articles}">
				<tr>
					<td>${pageStartNum = pageStartNum - 1}</td>
                  	<td><a href="/Farmstory2/board/view.do?cate=${cate}&type=${type}&no=${article.no}">${article.title}</a>&nbsp;[${article.comment}]</td>
                  	<td>${article.nick}</td>
                  	<td>${article.rdate}</td>
                  	<td>${article.hit}</td>
				</tr>
			</c:forEach>
        </table>
    </article>

    <!-- 페이지 네비게이션 -->
	<div class="paging">
		<c:if test="${groups[0] > 1}">
			<a href="/Farmstory2/board/list.do?cate=${cate}&type=${type}&pg=${groups[0] - 1}" class="prev">이전</a>
		</c:if>
		<c:forEach var="i" begin="${groups[0]}" end="${groups[1]}">
			<a href="/Farmstory2/board/list.do?cate=${cate}&type=${type}&pg=${i}" class="num ${currentPage == i ? 'current':'off'}">${i}</a>                
		</c:forEach>
		<c:if test="${groups[1] < lastPageNum}">                            
			<a href="/Farmstory2/board/list.do?cate=${cate}&type=${type}&pg=${groups[1] + 1}" class="next">다음</a>
		</c:if>
	</div>

    <!-- 글쓰기 버튼 -->
    <a href="/Farmstory2/board/write.do?cate=${cate}&type=${type}" class="btnWrite">글쓰기</a>
</section>

<!-- 내용 끝 -->
</article>
</section>
</div>

<%@ include file="../_footer.jsp" %>
