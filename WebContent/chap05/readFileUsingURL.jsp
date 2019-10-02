<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.net.URL" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
char[] buff = new char[128];
int len = -1;
URL url = application.getResource("/WEB-INF/web.xml");

try (InputStreamReader fr = new InputStreamReader(url.openStream(), "UTF-8")) {
	while ((len = fr.read(buff)) != -1) {
		out.print(new String(buff, 0, len));
	}
	
} catch (Exception e) {
	e.printStackTrace();
}



%>

</body>
</html>