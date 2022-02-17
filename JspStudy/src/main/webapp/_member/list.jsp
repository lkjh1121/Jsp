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
				
				// 직원 목록 불러오기 버튼클릭
				$('button').click(function(){
					
					$.get('./proc/getList.jsp', function(data){
						
						for(let member of data){
							$('table').append('<tr/>');
							$('table tr:last-child').append('<td>'+member.uid+'</td>');
							$('table tr:last-child').append('<td>'+member.name+'</td>');
							$('table tr:last-child').append('<td>'+member.hp+'</td>');
							$('table tr:last-child').append('<td>'+member.pos+'</td>');
							$('table tr:last-child').append('<td>'+member.dep+'</td>');							
							$('table tr:last-child').append('<td>'+member.rdate.substring(2, 10)+'</td>');							
							$('table tr:last-child').append("<td><a href='"+member.uid+"'>삭제</a></td>");							
						}
					});
				});
				
				// 각 직원 삭제링크 클릭(동적 이벤트 생성)
				$(document).on('click', 'table a', function(e){
					e.preventDefault();
					
					let tag = $(this);
					let uid = tag.attr('href');
					let url = './proc/delete.jsp?uid='+uid;
					
					$.get(url, function(data){
						
						if(data.result == 1){
							alert('선택한 직원을 삭제했습니다.');
							
							// 해당 직원 페이지에서 동적삭제
							tag.parent().parent().remove();
						
						}else{
							alert('선택한 직원을 삭제 할 수 없습니다.');
						}
					});
				});
			});
		</script>
		
	</head>
	<body>
		<h3>직원목록</h3>
		<button>목록 불러오기</button>
		<a href="./register.jsp">직원등록</a>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>직급</th>
				<th>부서</th>
				<th>입사일</th>
				<th>삭제</th>
			</tr>
		</table>		
	</body>
</html>