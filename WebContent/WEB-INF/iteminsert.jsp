<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<style>
textarea {
	width: 300px;
	height: 100px;
}

</style>
</head>
<body>
<form action="<c:url value="/item/insert" />" method="post">
<input type="text" name="title"><br>
<textarea name="body"></textarea><br>
<input type="submit" value="등록">

</form>


</body>
</html>






