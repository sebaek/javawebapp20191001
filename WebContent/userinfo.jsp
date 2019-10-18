<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/mystyle.css' />">

<title>사용자 정보</title>
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
	<my:navbar></my:navbar>

	<p>id : ${user.id }</p>
	<p>nick name : ${user.nickName }</p>
	<p>password : ${user.password }</p>
	<p>email : ${user.email }</p>
	<br>	
	<a href="<c:url value="/delete" />">회원 탈퇴</a>
	
	<form action="<c:url value="/update" />" method="post">
	password : <input id="pw" type="password" name="password"><br>
	pw-confim : <input id="pw-confirm" type="password" >
	            <span id="message"></span><br>
	nick name : <input type="text" name="nick-name"><br>
	email : <input type="email" name="email"><br>
	<input type="submit" value="정보 수정" >
	</form>
	${error }

</body>
</html>



