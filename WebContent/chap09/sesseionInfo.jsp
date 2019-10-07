<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>

<%
Date time = new Date();
SimpleDateFormat formatter = 
new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
session.setMaxInactiveInterval(60*60);

Cookie c = new Cookie("JSESSIONID", session.getId());
c.setMaxAge(60*60);
response.addCookie(c);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션정보</title>
</head>
<body>
id: <%= session.getId() %><br>
<% time.setTime(session.getCreationTime()); %>
생성: <%= formatter.format(time) %><br>
<% time.setTime(session.getLastAccessedTime()); %>
최근: <%= formatter.format(time) %><br>

</body>
</html>