<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
out.print(request.getAttribute("count"));
out.print("<br>");
out.print(session.getAttribute("count"));
out.print("<br>");
out.print(application.getAttribute("count"));
out.print("<br>");

%>



</body>
</html>