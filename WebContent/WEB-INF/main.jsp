<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/mystyle.css' />">
<title>중앙프로젝트</title>

</head>
<body>

	<my:navbar></my:navbar>

	<c:forEach items="${items }" var="i">
		<my:itemrow item="${i }" />
	</c:forEach>


	<div class="page-container">
		<a href="<c:url value="/" />">처음</a>
		<c:forEach begin="${minPage }" end="${maxPage}" var="p">
			<c:url value="/" var="pageUrl">
				<c:param name="page" value="${p }" />
			</c:url>
			<a href="${pageUrl }">${p }</a>
		</c:forEach>
	</div>


</body>
</html>


