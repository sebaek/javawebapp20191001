<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
List<String> items = (List<String>) session.getAttribute("items");
%>

<h1>장바구니</h1>
<%
for (String item : items) {
	out.print(item + "<br>");
}
%>

</body>
</html>









