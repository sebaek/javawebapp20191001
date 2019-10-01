<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- html주석 우리집 비밀번호 3939 -->

	<%-- jsp 주석 옆집 비밀번호 9393 --%>
	
<!-- 	주석 단축키 ctrl+shift+c -->

	<%
		int sum = 0;
	%>
	1 부터 10까지의 합은
	<%= sum %>입니다.
	<%= "날씨는 맑음" %>
	<%
		//int sum;
		/*
			여러줄 주석..
		*/
		for (int i = 1; i <= 10; i++) {
			sum = sum + i;
		}
	%>
</body>
</html>











