<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>3.usebeanTag</title>
		<!-- 
	 		날짜 : 2022/02/10
			이름 : 김재현
			내용 : JSP 액션객체 실습하기
			
			자바빈(JavaBean)
			 - JSP에서 사용하는 컴포넌트 객체를 부르는 일반적인 용어
			 - form의 입력필드를 멤버로 갖는 클래스 
			 - table의 컬럼을 멤버로 갖는 클래스
			 - JSP MVC(Model2)에서 자바빈을 VO(Value Object)객체로 부름
			
			useBean 태그
			 - 자바빈을 활용햇허 전송 데이터를 수신하고 객체로 생성하는 태그		
			 - 활용도가 거의 없음
		-->
	</head>
	<body>
		<h3>3.usebeanTag</h3>

		<form action="../proc/useBeanProc.jsp" method="post">
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
					<td>이름</td>
					<td><input type="text" name="name"/></td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<select name="addr">
							<option>서울</option>
							<option>대전</option>
							<option>대구</option>
							<option>부산</option>
							<option>광주</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<label><input type="radio" name="gender" value="1"/>남</label>
						<label><input type="radio" name="gender" value="2"/>여</label>
					</td>
				</tr>
				<tr>
					<td>취미</td>
					<td>
						<label><input type="checkbox" name="hobby" value="등산"/>등산하기</label>
						<label><input type="checkbox" name="hobby" value="여행하기"/>여행하기</label>
						<label><input type="checkbox" name="hobby" value="여행하기"/>여행하기</label>
						<label><input type="checkbox" name="hobby" value="운동하기"/>운동하기</label>
						<label><input type="checkbox" name="hobby" value="영화보기"/>영화보기</label>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="회원가입"/>
					</td>
				</tr>			
			</table>
		</form>	









	</body>
</html>