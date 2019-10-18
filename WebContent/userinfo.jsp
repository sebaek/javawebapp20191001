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
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
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

	<div class="form-container">
		<h1>${user.id }님의 회원 정보</h1>
		<form action="<c:url value="/update" />" method="post">
			<div class="form-row">
				<label for="pw">패스워드</label><input value="${user.password }" id="pw" type="password" name="password">
			</div>
			<div class="form-row">
				<label for="pw-confirm">패스워드 확인</label><input id="pw-confirm" type="password">
				<span id="message" class="message"></span>
			</div>
			<div class="form-row">
				<label for="nick-name">별명</label><input id="nick-name" value="${user.nickName }" type="text" name="nick-name">
			</div>
			<div class="form-row">
				<label for="email">이메일</label><input id="email" value="${user.email }" type="email" name="email"><br>
			</div>
			<div class="form-row">
				<input type="submit" value="정보 수정">
			</div>
		</form>
		<a href="<c:url value="/delete" />">회원 탈퇴</a>	
		<span class="message"> ${error }</span>
				
	</div>
</body>
</html>



