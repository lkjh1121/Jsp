<%@page import="java.util.ArrayList"%>
<%@page import="bean.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>list</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script>
			$(function(){
				
				// 학생 목록 불러오기 버튼클릭
				$('button').click(function(){
					
					$.get('./proc/getList.jsp', function(data){
						
						console.log(data);
						
						
						for(let students of data){
							$('table').append('<tr/>');
							$('table tr:last-child').append('<td>'+students.sid+'</td>');
							$('table tr:last-child').append('<td>'+students.name+'</td>');
							$('table tr:last-child').append('<td>'+students.gender+'</td>');
							$('table tr:last-child').append('<td>'+students.hp+'</td>');
							$('table tr:last-child').append('<td>'+students.grade+'</td>');
							$('table tr:last-child').append('<td>'+students.regdate+'</td>');							
						}
						
					});
				});
			});
		</script>
		
	</head>
	<body>
		<h3>학생목록</h3>
		<button>학생 목록 불러오기</button>
		<a href="./register.jsp">학생등록</a>
		<table border="1">
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>성별</th>
				<th>휴대폰</th>
				<th>학년</th>
				<th>등록일</th>
			</tr>
		</table>		
	</body>
</html>