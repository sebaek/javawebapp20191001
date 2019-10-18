<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/login" var="loginUrl" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, th, td {
	border: 1px solid black;
}
table {
	width: 100%;
	border-collapse: collapse;
}
.navbar {
	display: flex;
	justify-content: space-between;
	height: 60px;
	margin-bottom: 20px;
	background-color: #222;
	color: white;
}
.nav-left, .nav-right {
	display: flex;
}



.navbar a {
	display: flex;
	align-content: center;
	color: white;
	text-decoration: none;
	padding: 15px;
}

.navbar a:hover {
	background-color: #777;
	
}

</style>
</head>
<body>
<div class="navbar">
<div class="nav-left">
<a href="<c:url value="/" />" >중앙프로젝트</a>
<a href="<c:url value="/" />" >목록</a>
</div>
<div class="nav-right">
	<c:choose>
		<c:when test="${empty user }">
			<a href="${loginUrl }">로그인</a>
			<a href="<c:url value="/signup" />">회원가입</a>
		</c:when>
		<c:otherwise>
			<p>반갑습니다. ${user.nickName } 님</p>
			<a href="<c:url value="/userinfo.jsp" />">사용자</a>
			<br>
			<a href="<c:url value="/item/insert" />">글 작성</a>
			<a href="<c:url value="/logout" />">로그아웃</a>
		</c:otherwise>
	</c:choose>
</div>
</div>




	<table>
	<tr><th>id</th><th>title</th><th>user</th><th>ago</th></tr>
	<c:forEach items="${items }" var="i">
	
	<c:url value="/item" var="itemUrl">
		<%-- /mywebapp/item?id=234 --%>
		<c:param name="id" value="${i.id }" />
	</c:url>
	
	<tr>
	<td>${i.id }</td>
	<td><a href="${itemUrl }">${i.title }</a></td>
	<td>${i.userId }</td>
	<td>${i.timeAgo }</td>
	</tr>
	</c:forEach>
	</table>
	<a href="<c:url value="/" />">처음</a>
	<c:forEach begin="${minPage }" end="${maxPage}" var="p">
		<c:url value="/" var="pageUrl">
			<c:param name="page" value="${p }" />
		</c:url>
		<a href="${pageUrl }">${p }</a>
	</c:forEach>
		
	<br>
	<c:choose>
		<c:when test="${empty user }">
			<a href="${loginUrl }">로그인</a>
			<a href="<c:url value="/signup" />">회원가입</a>
		</c:when>
		<c:otherwise>
			<p>반갑습니다. ${user.nickName } 님</p>
			<a href="<c:url value="/userinfo.jsp" />">사용자</a>
			<br>
			<a href="<c:url value="/item/insert" />">글 작성</a>
			<a href="<c:url value="/logout" />">로그아웃</a>
		</c:otherwise>
	</c:choose>

</body>
</html>


