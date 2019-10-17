<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
img {
	width: 200px;
	height: 150px;
}
</style>
</head>
<body>
<c:if test="${not empty item.file }">
<img src="<c:url value="/image/${item.id }/${item.file }" />" ><br>
</c:if>
${item.title }<br>
<pre>${item.body }</pre><br>
${item.userId }<br>
${item.timeAgo }<br>

<c:if test="${item.userId eq user.id }" >
	<c:url value="/item/update" var="updateUrl" >
	</c:url>
	 
	<a href="${updateUrl }">수정</a> 
	<a href="<c:url value="/item/delete" />">삭제</a>
</c:if>

<c:if test="${not empty user }" >
<form action="<c:url value="/comment/insert" />" method="post">
	<textarea name="comment"></textarea>
	<input type="submit" value="댓글">
</form>
</c:if>



</body>
</html>





