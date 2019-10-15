<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
<style>
textarea {
	width: 300px;
	height: 100px;
}

</style>
</head>
<body>
<c:url value="/item/update" var="updateUrl" >
	<c:param name="id" value="${item.id }" />
</c:url>

<form action="${updateUrl }" method="post">
<input type="text" name="title" value="${item.title }"><br>
<textarea name="body">${item.body }</textarea><br>
<input type="submit" value="수정">

</form>

</body>
</html>








