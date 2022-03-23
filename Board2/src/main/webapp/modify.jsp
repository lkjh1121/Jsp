<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글수정</title>
    <link rel="stylesheet" href="/Board2/css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="modify">
            <h3>글수정</h3>
            <article>
                <form action="/Board2/modify.do" method="post">
                    <table>
                    	<input type="hidden" name="no" value="${article.no}"/>
                        <tr>
                            <td>제목</td>
                            <td><input type="text" name="title"  value="${article.title}" readonly"/></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>
                                <textarea name="content">${article.content}</textarea>                                
                            </td>
                        </tr>
                        <c:if test="${article.file > 0}">
	                        <tr>
	                            <td>첨부파일</td>
	                            	<td><a href="/Board2/fileDownload.do?fno=${article.fv.fno}">${article.fv.oName}</a>
		                        	<span>${article.fv.download}회 다운로드</span>
		                        </td>
	                        </tr>
                        </c:if>
                    </table>
                    <div>
                        <a href="/Board2/list.do" class="btnCancel">취소</a>
                        <input type="submit"  class="btnWrite" value="수정완료">
                    </div>
                </form>
            </article>
        </section>
    </div>
</body>
</html>