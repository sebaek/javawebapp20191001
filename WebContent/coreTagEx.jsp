<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>core if</h1>
<c:if test="${ 2 > 3 }">
<p> 2는 3보다 크다.</p>
</c:if>

<c:if test="${ 2 lt 3 }">
<p> 2는 3보다 작다.</p>
</c:if>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>







