<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/mystyle.css' />">
<title>게시물 수정</title>
<style>
textarea {
	width: 300px;
	height: 100px;
}

img {
	width: 200px;
	height: 150px;
}
</style>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>

<script>
	$(document).ready(function() {
		$("#update-radio").click(function() {
			$("#file-input").show("fast");
		});

		$("#remove-radio").click(function() {
			$("#file-input").hide("fast");
		});

	});
</script>
</head>
<body>
	<my:navbar />

	<div class="form-container">
		<h1>게시물 수정</h1>

		<c:url value="/item/update" var="updateUrl">
		</c:url>
		<c:if test="${not empty item.file }">
			<img src="<c:url value="/image/${item.id }/${item.file }" />">
			<br>
		</c:if>
		<form action="${updateUrl }" method="post"
			enctype="multipart/form-data">
			
			<div class="form-row">
				<label for="title">제목</label><input type="text" value="${item.title }" name="title">
			</div>
			
			<div class="form-textarea">
				<textarea name="body">${item.body }</textarea>
			</div>
			
			<label> 파일 삭제 <input id="remove-radio" type="radio"
				name="file-update" value="remove">
			</label> <label> 파일 변경 <input id="update-radio" type="radio"
				name="file-update" value="update" checked>
			</label>
			
			
			<div class="form-row" id="file-input">
				<input type="file" accept="image/*" name="file">
			</div>
			<div class="form-row">
				<input type="submit" value="수정">
			</div>
		</form>

	</div>
</body>
</html>








