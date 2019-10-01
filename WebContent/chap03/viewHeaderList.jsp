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
		Enumeration<String> headerEnum = request.getHeaderNames();
		while (headerEnum.hasMoreElements()) {
			String headerName = headerEnum.nextElement();
			String headerValue = request.getHeader(headerName);

			out.print(headerName);
			out.print("=");
			out.print(headerValue + "<br>");

		}
	%>

</body>
</html>