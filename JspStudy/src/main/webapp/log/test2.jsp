<%@page import="org.apache.log4j.LogManager"%>
<%@page import="org.apache.log4j.Logger"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그 실습</title>
</head>
<body>
	<h3>log4j 실습하기</h3>
	<%
		/*
			날짜 : 2022/02/25
			이름 : 김재현
			내용 : log4j 실습하기
			
			<log4j 설정>
			 1) 라이브러리 다운로드
               - log4j 홈페이지 - 최신 라이브러리 다운로드
               - log4j-1.2-api-2.17.1.jar 추가
               - log4j-api-2.17.1.jar 추가 
               - log4j-core-2.17.1.jar 추가
               - log4j-web-2.17.1.jar 추가
               - 나머지는 필요없음
               
             2) web.xml 설정
               - /WEB-INFO/web.xml 수정
			   - <context-param> 태그선언 내용입력 -> 내용은 인터넷 참고
			   - <listener> 태그선언 내용입력 -> 내용은 인터넷 참고
			   
			 3) log4j.xml 설정
	           - /WEB-INFO/log4j.xml 생성
	           - log4j 관련 태그선언 및 내용입력 -> 내용은 인터넷 참고
 
             4) 코드에서 log4j loglogger 생성 후 로그 출력확인
			   - 콘솔 출력확인
			   - 파일 출력확인
			   - C:/log/ 폴더에 생성된 로그 파일을 notepad++에서 눈알모양 아이콘 클릭해서 모니터링 
		*/
	
		// log4j 로거
		Logger _logger = LogManager.getLogger(this.getClass());
		
		_logger.debug("debug log!!!");
		_logger.info("info log!!!");
		_logger.warn("warn log!!!");
		_logger.error("error log!!!");
		_logger.fatal("fatal log!!!");
	
	%>
	
</body>
</html>