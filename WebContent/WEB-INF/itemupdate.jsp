<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<script>
$(document).ready(function() {
	$("#update-radio").click(function() {
		$("#file-input").show();
	});
		
	$("#remove-radio").click(function() {
		$("#file-input").hide();
	});
	
});

</script>
</head>
<body>
<c:url value="/item/update" var="updateUrl" >
</c:url>
<c:if test="${not empty item.file }">
<img src="<c:url value="/image/${item.id }/${item.file }" />" ><br>
</c:if>
<form action="${updateUrl }" method="post" enctype="multipart/form-data">
<input type="text" name="title" value="${item.title }"><br>
<textarea name="body">${item.body }</textarea><br>
<label>
파일 삭제
<input id="remove-radio" type="radio" name="file-update" value="remove">
</label>

<label>
파일 변경
<input id="update-radio" type="radio" name="file-update" value="update" checked>
</label> 
<br>
<input id="file-input" accept="image/*" type="file" name="file" ><br>
<input type="submit" value="수정">

</form>

</body>
</html>








