<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${item.title }<br>
${item.body }<br>
${item.userId }<br>
${item.created }<br>

<c:if test="${item.userId eq user.id }" >
<c:url value="/item/update" var="updateUrl" >
	<c:param name="id" value="${item.id }" />
</c:url>

<a href="${updateUrl }">수정</a>
</c:if>




</body>
</html>