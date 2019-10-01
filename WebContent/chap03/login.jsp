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
String id = request.getParameter("memberid");
if (id != null && id.equals("madvirus")) {
	response.sendRedirect("loginTrue.jsp");
} else {
	
}
%>
로그인 실패
</body>
</html>




