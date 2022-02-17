<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"/>
		<title>register</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script>
		
			$(function(){
				
				$('input[type=submit]').click(function(){
					
					// 데이터 취합
					let uid  = $('input[name=uid]').val();
					let name = $('input[name=name]').val();
					let hp   = $('input[name=hp]').val();
					let pos  = $('select[name=pos]').val();
					let dep  = $('select[name=dep]').val();
					
					// Json 데이터 생성
					let jsonData = {
							"uid":uid,
							"name":name,
							"hp":hp,
							"pos":pos,
							"dep":dep							
					};
					
					console.log(jsonData);
					
					// Ajax 데이터 전송
					$.ajax({
						url: './proc/registerProc.jsp',
						type: 'post',
						data: jsonData,
						dataType: 'json',
						success: function(data){
							
							if(data.result == 1){
								alert("정상적으로 등록되었습니다.");
							}else{
								alert("등록에 실패 했습니다. 아이디, 휴대폰이 중복된거 같습니다.");
							}
						}
					});
				});
			});
		
		</script>
		
		
	</head>
	<body>
		<h3>직원등록</h3>
		<a href="./list.jsp">직원목록</a>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid"/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp"/></td>
			</tr>
			<tr>
				<td>직급</td>
				<td>
					<select name="pos">
						<option>사원</option>
						<option>대리</option>
						<option>과장</option>
						<option>차장</option>
						<option>부장</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>부서</td>
				<td>
					<select name="dep">
						<option value="101">영업1부</option>
						<option value="102">영업2부</option>
						<option value="103">영업3부</option>
						<option value="104">영업4부</option>
						<option value="105">인사부</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="등록"/>
				</td>
			</tr>			
		</table>		
		
	</body>
</html>