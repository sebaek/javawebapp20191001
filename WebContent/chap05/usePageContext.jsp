<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%!
public void method1(PageContext pageContext) throws Exception {
	JspWriter out = pageContext.getOut();
	out.print("다른 메소드에서 실행됨");
}
%>
<%
	
	Object httpRequest = pageContext.getRequest();
	out.print(request == httpRequest);
	
	method1(pageContext);
%>

</body>
</html>


