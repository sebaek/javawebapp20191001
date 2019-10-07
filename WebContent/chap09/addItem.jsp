<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=contextPath %>/add" method="post">
<input type="text" value="사탕" name="item">
<input type="submit" value="추가">
</form>
</body>
</html>