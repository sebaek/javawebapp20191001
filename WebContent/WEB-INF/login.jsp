<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>

<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/mystyle.css' />">
<title>로그인</title>
</head>
<body>
	<my:navbar></my:navbar>



	<div class="form-container">
<h1>로그인</h1>
		<form action="<%=contextPath%>/login" method="post">
			<div class="form-row">
				<label for="id">아이디</label> <input type="text" name="id">
			</div>
			<div class="form-row">
				<label for="password">패스워드</label> <input type="password"
					name="password">
			</div>
			<div class="form-row">
				<input type="submit" value="로그인">
			</div>
		</form>
	</div>

	${loginFailed }
	<%--

<% 
String error = (String) request.getAttribute("loginFailed");
if (error != null) {
	out.print(error);
}

%>
 --%>

</body>
</html>




