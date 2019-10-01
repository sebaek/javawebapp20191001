<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
private int k = 314;

%>
<%!

public int multiply(int a, int b, int c) {
	int d = a*b;
	return d;
}


public int multiply(int a, int b) {
	int c = a*b;
	return c;
}

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// 스크립트릿

out.println(new java.util.Date());
out.println(request.getMethod());

//스크립트릿


%>


10 * 25 = <%= multiply(10, 25) %>
<br>
k 는 <%= this.k %>
</body>
</html>







