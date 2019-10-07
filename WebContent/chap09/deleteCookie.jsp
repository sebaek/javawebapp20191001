<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (Cookie c : cookies) {
		if (c.getName().equals("name")) {
			Cookie newCookie = new Cookie("name", "JSP프로그래밍");
			newCookie.setMaxAge(0);
			response.addCookie(newCookie);
		}
	}
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>