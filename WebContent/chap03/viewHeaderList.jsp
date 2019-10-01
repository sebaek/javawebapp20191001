<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Enumeration headerEnum = request.getHeaderNames();
		while (headerEnum.hasMoreElements()) {
			String headerName = (String) headerEnum.nextElement();
			String headerValue = request.getHeader(headerName);
	%>
	<%=headerName%>
	=
	<%=headerValue%><br>
	<%
		}
	%>

</body>
</html>