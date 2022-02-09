<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8"); 
	String success = request.getParameter("success");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login</title>
		<script>
			let success = "<%= success %>";	
		
			if(success == "100"){
				alert('로그인에 실패 했습니다. 다시 하번 확인 바랍니다')
			}else if(success == "101"){
				alert('정상적으로 로그아웃했습니다. 다음에 다시 뵙겠습니다')
			}else if(success == "102"){
				alert('로그인을 먼저 하셔야합니다.')
			}
		</script>
		
		
		
		
		
	</head>
	<body>
		<h4>로그인</h4>
		<form action="./loginProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid"/></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pass"/></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="로그인"/>
					</td>
				</tr>
			</table>			
		</form>
			
	</body>
</html>