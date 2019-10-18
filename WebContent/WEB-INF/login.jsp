<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
    
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/mystyle.css' />" >
<title>로그인</title>
</head>
<body>
<my:navbar></my:navbar>


<form action="<%= contextPath %>/login" method="post">
id: <input type="text" name="id"><br>
pw: <input type="password" name="password"><br>
<input type="submit" value="로그인">
</form>

${loginFailed }
<%--

<% 
String error = (String) request.getAttribute("loginFailed");
if (error != null) {
	out.print(error);
}

%>
 --%>

</body>
</html>




