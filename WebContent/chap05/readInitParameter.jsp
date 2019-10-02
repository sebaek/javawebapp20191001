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
System.out.println("여기까지 실행됨.");
String value1 = application.getInitParameter("logEnabled2");
String value2 = application.getInitParameter("debugLevel");


%>

<%= value1.getBytes() %><br>
<%= value2 %>
</body>
</html>


