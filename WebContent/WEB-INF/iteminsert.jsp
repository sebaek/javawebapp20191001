<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/mystyle.css' />">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$("#item-insert-submit").click(function() {
		var title = $("#item-insert-title-input").val();
		var body = $("#item-insert-body-input").val();
		
		if (title.includes("<") || title.includes(">") 
				|| body.includes(">") || body.includes("<")) {
			alert("제목과 내용에 '<' 또는 '>'를 입력할 수 없습니다.");
			return false;
		}
		
	});
});

</script>

<title>게시물 작성</title>

</head>
<body>
	<my:navbar />

	<div class="form-container">
		<h1>게시물 등록</h1>

		<form action="<c:url value="/item/insert" />" method="post"
			enctype="multipart/form-data">
			<div class="form-row">
				<label for="title">제목</label>
				<input id="item-insert-title-input" type="text" name="title">
			</div>
			<div class="form-textarea">
				<textarea id='item-insert-body-input' name="body"></textarea>
			</div>
			<div class="form-row">
				<input type="file" accept="image/*" name="file">
			</div>
			<div class="form-row">
				<input id="item-insert-submit" type="submit" value="등록">
			</div>

		</form>
	</div>


</body>
</html>






