<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="<c:url value='/mystyle.css' />">
<title>회원 가입</title>

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
	<my:navbar />
	<div class="form-container">

		<h1>회원 가입</h1>
		<form action="<c:url value="/signup" />" method="post">
			<div class="form-row">
			<label for="id">아이디</label> <input type="text" name="id"
				value="${user.id }"> 
			</div>
			<div class="form-row">
			<label for="pw">패스워드</label> <input
				id="pw" type="password" name="password" value="${user.password }">
			</div>
			<div class="form-row">
			<label
				for="pw-confirm">패스워드확인</label><input id="pw-confirm"
				type="password" value="${user.password}">
			</div>
			<span id="message"></span>
			<div class="form-row">
			<label for="nick-name">별명</label><input type="text" name="nick-name" value="${user.nickName }"><br>
			</div>
			<div class="form-row">
			<label for="email">이메일</label><input type="email" name="email" value="${user.email }"><br>
			</div>
			<div class="form-row">
			<input type="submit" value="가입">
			</div>
		</form>
	</div>
	${error }

</body>
</html>








