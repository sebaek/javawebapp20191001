<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js" ></script>
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
<h1>회원 가입</h1>
<form action="<c:url value="/signup" />" method="post">
id : <input type="text" name="id" value="${user.id }"><br>
pw : <input id="pw" type="password" name="password" value="${user.password }"><br>
pw confirm : <input id="pw-confirm" type="password" value="${user.password}"><span id="message"></span><br>
nick : <input type="text" name="nick-name" value="${user.nickName }"><br>
email : <input type="email" name="email" value="${user.email }"><br>
<input type="submit" value="가입">
</form>
${error }

</body>
</html>








