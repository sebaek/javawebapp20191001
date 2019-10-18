<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/mystyle.css' />">
<title>게시물 작성</title>

</head>
<body>
	<my:navbar />

	<div class="form-container">
		<h1>게시물 등록</h1>

<style>
.form-textarea textarea {
	width: 100%;
	height: 100px;
}
</style>
		<form action="<c:url value="/item/insert" />" method="post"
			enctype="multipart/form-data">
			<div class="form-row">
				<label for="title">제목</label><input type="text" name="title">
			</div>
			<div class="form-textarea">
				<textarea name="body"></textarea>
			</div>
			<div class="form-row">
				<input type="file" accept="image/*" name="file">
			</div>
			<div class="form-row">
				<input type="submit" value="등록">
			</div>

		</form>
	</div>


</body>
</html>






