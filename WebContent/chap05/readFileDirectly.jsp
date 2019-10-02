<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
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
String filePath = "C:/Users/user/eclipse-workspace/mywebapp/WebContent/WEB-INF/web.xml";
try (FileReader fr = new FileReader(filePath)) {
	while ((len = fr.read(buff)) != -1) {
		out.print(new String(buff, 0, len));
	}
	
} catch (Exception e) {
	e.printStackTrace();
}


%>


</body>
</html>









