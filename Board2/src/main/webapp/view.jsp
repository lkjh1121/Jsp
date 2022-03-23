<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글보기</title>
    <link rel="stylesheet" href="/Board2/css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="/Board2/js/commentRegister.js"></script>
    <script src="/Board2/js/commentModify.js"></script>
    <script src="/Board2/js/commentDelete.js"></script>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="view">
            <h3>글보기</h3>
            <table>
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title" value="${article.title}" readonly/></td>
                </tr>
                <c:if test="${article.file > 0}">
	                <tr>
	                    <td>첨부파일</td>
	                    <td>
	                        <a href="/Board2/fileDownload.do?fno=${article.fv.fno}">${article.fv.oName}</a>
	                        <span>${article.fv.download}회 다운로드</span>
	                    </td>
	                </tr>
                </c:if>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea name="content" readonly>${article.content}</textarea>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/Board2/delete.do" class="btnDelete">삭제</a>
                <a href="/Board2/modify.do?no=${article.no }" class="btnModify">수정</a>
                <a href="/Board2/list.do" class="btnList">목록</a>
            </div>  
            
            <!-- 댓글리스트 -->
            <section class="commentList">
                <h3>댓글목록</h3>
                
                <c:forEach var="comment" items="${comments}">
	                <article class="comment">
	                    <span>
	                        <span>${comment.nick}</span>
	                        <span>${comment.rdate}</span>
	                    </span>
	                    <textarea name="content" readonly>${comment.content}</textarea>
	                    <div>
	                        <a href="#" class="del" data-no="${comment.no}">삭제</a>
	                        <a href="#" class="modify" data-no="${comment.no}" data-mode="r">수정</a>	                        
	                    </div>
	                </article>
                </c:forEach>
                
                <c:if test="${comments.size() == 0}">
                	<p class="empty">등록된 댓글이 없습니다.</p>
                </c:if>
            </section>

            <!-- 댓글입력폼 -->
            <section class="commentForm">
                <h3>댓글쓰기</h3>
                <form action="#" method="post">
                	<input type="hidden" name="parent" value="${article.no}"/>
                	<input type="hidden" name="uid" value="${sessUser.uid}"/>
                    <textarea name="content"></textarea>
                    <div>
                        <a href="#" class="btnCancel">취소</a>
                        <input type="submit" class="btnWrite" value="작성완료"/>
                    </div>
                </form>
            </section>

        </section>
    </div>    
</body>
</html>