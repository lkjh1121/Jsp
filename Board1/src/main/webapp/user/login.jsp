<%@page import="kr.co.board1.log.MyLog"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String success = request.getParameter("success");
	
	MyLog.getInstance().info("login success : "+success);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="/Board1/css/style.css"/>
    <script>
    	let success = "<%= success %>";
    	
    	if(success == '100'){
    		alert("아이디, 비밀번호를 다시 확인하십시요.");    		
    	}else if(success == '101'){
    		alert("정상적으로 로그아웃을 했습니다.");
    	}else if(success == '102'){
    		alert("로그인을 먼저 하셔야 합니다.");
    	}
    </script>
</head>
<body>
    <div id="wrapper">
        <section id="user" class="login">
            <form action="/Board1/user/proc/login.jsp" method="post">
                <table border="0">
                    <tr>
                        <td><img src="/Board1/img/login_ico_id.png" alt="아이디"/></td>
                        <td><input type="text" name="uid" placeholder="아이디를 입력" /></td>
                    </tr>
                    <tr>
                        <td><img src="/Board1/img/login_ico_pw.png" alt="비밀번호"/></td>
                        <td><input type="password" name="pass" placeholder="비밀번호 입력" /></td>
                    </tr>
                </table>
                <input type="submit" class="btnLogin" value="로그인"/>
            </form>

            <div class="info">
                <h3>회원로그인 안내</h3>
                <p>
                    아직 회원이 아니시면 회원으로 가입하세요.
                </p>
                <a href="/Board1/user/terms.jsp">회원가입</a>
            </div>

        </section>
    </div>    
</body>
</html>