<%@page import="kr.co.board1.bean.UserBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	UserBean sessUser = (UserBean)session.getAttribute("sessUser");
	
if(sessUser == null){
		response.sendRedirect("/Board1/user/login.jsp?success=102");
		return;
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
    <link rel="stylesheet" href="./css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="write">
            <h3>글쓰기</h3>
            <article>
                <form action="/Board1/proc/write.jsp" method="post" enctype="multipart/form-data">
                	<input type="hidden" name="uid" value="<%= sessUser.getUid() %>" />
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
                        <a href="/Board1/list.jsp" class="btnCancel">취소</a>
                        <input type="submit"  class="btnWrite" value="작성완료"/>
                    </div>
                </form>
            </article>
        </section>
    </div>
</body>
</html>