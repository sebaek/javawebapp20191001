<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
쿠키 목록 <br>
<%
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (Cookie c : cookies) {
		out.print(c.getName() + " = " + c.getValue());
	}
} else {
	out.print("쿠키가 존재하지 않습니다.");
}


%>

</body>
</html>