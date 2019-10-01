<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar, java.util.Map" %>
<%@ page import="java.util.Date" %>
<%@ page trimDirectiveWhitespaces="true" %>    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Calendar cal = Calendar.getInstance();
%>

오늘은
<%= cal.get(Calendar.YEAR) %> 년
<%= cal.get(Calendar.MONTH) + 1 %> 월
<%= cal.get(Calendar.DATE) %> 일
<br>
<%= new Date() %>
<%
	java.util.List list = new java.util.ArrayList<String>();
%>

</body>
</html>















