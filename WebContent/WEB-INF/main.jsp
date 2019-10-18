<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/mystyle.css' />">
<title>Insert title here</title>
<style>
table, th, td {
	border: 1px solid black;
}

table {
	width: 100%;
	border-collapse: collapse;
}
</style>
</head>
<body>

	<my:navbar></my:navbar>

	<c:forEach items="${items }" var="i">
		<my:itemrow item="${i }" />
	</c:forEach>

	<a href="<c:url value="/" />">처음</a>
	<c:forEach begin="${minPage }" end="${maxPage}" var="p">
		<c:url value="/" var="pageUrl">
			<c:param name="page" value="${p }" />
		</c:url>
		<a href="${pageUrl }">${p }</a>
	</c:forEach>

	<br>


</body>
</html>


