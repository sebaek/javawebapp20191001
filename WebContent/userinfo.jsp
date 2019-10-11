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
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js" ></script>
<script>
$(document).ready(function() {
	$("#pw-confirm").keyup(function() {
		var origin = $("#pw").val();
		var confirm = $(this).val();
		if (origin == confirm) {
			var message = "일치합니다.";
		} else {
			var message = "패스워드가 일치하지 않습니다.";
		}
		$("#message").text(message);
	});
});

</script>


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
	
	<form action="<c:url value="/update" />" method="post">
	password : <input id="pw" type="password" name="password"><br>
	pw-confim : <input id="pw-confirm" type="password" >
	            <span id="message"></span><br>
	nick name : <input type="text" name="nick-name"><br>
	<input type="submit" value="정보 수정" >
	</form>
	${error }

</body>
</html>



