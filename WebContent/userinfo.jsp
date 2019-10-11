<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
table, tr, th, td {
	border: 1px solid black;
}

table {
	border-collapse: collapse;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>아이디</th>
			<th>닉네임</th>
			<th>패스워드</th>
		</tr>

		<c:forEach items="${users }" var="user">
			<tr>
				<td>${user.id }</td>
				<td><c:out value="${user.nickName }" /></td>
				<td><c:out value="${user.password }" /></td>
			</tr>
		</c:forEach>

	</table>


	<p>id : ${user.id }</p>
	<p>nick name : ${user.nickName }</p>
	<p>password : ${user.password }</p>
	<br>	
	<a href="<c:url value="/delete" />">회원 탈퇴</a>

</body>
</html>



