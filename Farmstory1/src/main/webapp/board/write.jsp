<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String cate = request.getParameter("cate");
	String type = request.getParameter("type");
	
	if(sessUser == null){
		// 로그인을 안한 경우
		response.sendRedirect("/Farmstory1/user/login.jsp?success=103&cate="+cate+"&type="+type);
		return;
	}
	
	pageContext.include("./inc/_"+cate+".jsp");
%>
<section id="board" class="write">
    <h3>글쓰기</h3>
    <article>
        <form action="/Farmstory1/board/proc/write.jsp" method="post">
        	<input type="hidden" name="cate" value="<%= cate %>" />
        	<input type="hidden" name="type" value="<%= type %>" />
        	<input type="hidden" name="uid"  value="<%= sessUser.getUid() %>" />
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content"></textarea>                                
                    </td>
                </tr>
                <tr>
                    <td>첨부</td>
                    <td><input type="file" name="fname"/></td>
                </tr>
            </table>
            <div>
                <a href="/Farmstory1/board/list.jsp?cate=<%= cate %>&type=<%= type %>" class="btnCancel">취소</a>
                <input type="submit"  class="btnWrite" value="작성완료">
            </div>
        </form>
    </article>
</section>


<!-- 내용 끝 -->
</article>
</section>
</div>

<%@ include file="../_footer.jsp" %>