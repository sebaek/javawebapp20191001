<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/login" var="loginUrl" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>네이버</h1>

<c:if test="${empty user }" >
<a href="${loginUrl }">로그인</a>
</c:if>

<c:if test="${not empty user }" >
<p>반갑습니다. ${user.nickName } 님 </p>
<a href="<c:url value="/userinfo.jsp" />">사용자</a>
<br>
<a href="<c:url value="/logout" />">로그아웃</a>
</c:if>

</body>
</html>


