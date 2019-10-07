<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>


<form action="<%= contextPath %>/login" method="post">
id: <input type="text" name="id"><br>
pw: <input type="password" name="password"><br>
<input type="submit" value="로그인">
</form>

<% 
String error = (String) request.getAttribute("loginFailed");
if (error != null) {
	out.print(error);
}

%>

</body>
</html>




