<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/login" var="loginUrl" />
<div class="navbar">
<div class="nav-left">
<a href="<c:url value="/" />" >중앙프로젝트</a>
<a href="<c:url value="/" />" >목록</a>
</div>
<div class="nav-right">
	<c:choose>
		<c:when test="${empty sessionScope.user }">
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