<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%= request.getParameter("name") %>
<% 
Enumeration<String> names = request.getParameterNames();
while (names.hasMoreElements()) {
	String name = names.nextElement();
	out.print(name + "=");
	out.print(request.getParameter(name) + "<br>");
}

String[] pets = request.getParameterValues("pet");
for (String pet : pets) {
	out.print(pet + "<br>");
}
out.print("<hr>");

Map<String, String[]> maps = request.getParameterMap();
for (Map.Entry<String, String[]> entry : maps.entrySet()) {
	out.print(entry.getKey() + "=");
	String[] values = entry.getValue();
	for (String value : values) {
		out.print(value + ",");
	}
	out.print("<br>");
}




%>
</body>
</html>







