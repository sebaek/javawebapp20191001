<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/mystyle.css' />" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function() {
	var update = function() {
		var commentContainer = $(this).closest('.comment-container');
		var commentContent = commentContainer.html();
		
		var form = $('<form />').attr({
			'action' : $(this).attr('update-url'),
			'method' : 'post'
		});
		
		var textArea = $('<textArea />').attr({
			'name' : 'comment'
		}).text(commentContainer.find('.comment-body').text());
		
		var submit = $('<input />').attr({
			'type' : 'submit',
			'value' : '수정'
		});
		
		var cancelBtn = $('<button />').text('취소').click(function() {
			commentContainer.html(commentContent);
			commentContainer.find('.update-btn').click(update);
		});
		
		form.append(textArea).append(submit);
		
		commentContainer.empty();
		commentContainer.append(form).append(cancelBtn);
		
	};
	$('.update-btn').click(update);
});




</script>


<title>Insert title here</title>
<style>
img {
	width: 200px;
	height: 150px;
}
</style>
</head>
<body>
<my:navbar />
<c:if test="${not empty item.file }">
<img src="<c:url value="/image/${item.id }/${item.file }" />" ><br>
</c:if>
${item.title }<br>
<pre>${item.body }</pre><br>
${item.userId }<br>
${item.timeAgo }<br>

<c:if test="${item.userId eq user.id }" >
	<c:url value="/item/update" var="updateUrl" >
	</c:url>
	 
	<a href="${updateUrl }">수정</a> 
	<a href="<c:url value="/item/delete" />">삭제</a>
</c:if>

<c:if test="${not empty user }" >
<form action="<c:url value="/comment/insert" />" method="post">
	<textarea name="comment">${comment.comment }</textarea>
	<input type="submit" value="댓글">
</form>
</c:if>

<c:forEach items="${comments }" var="comment">
<div class="comment-container">
	<pre class="comment-body">${comment.comment }</pre>
	<span>${comment.userId }</span><br>
	<span>${comment.timeAgo }</span>
	<c:if test="${comment.userId eq user.id }" >
		<c:url value="/comment/delete" var="commentDeleteUrl">
			<c:param name="id" value="${comment.id }"  />
		</c:url>
		<c:url value="/comment/update" var="commentUpdateUrl">
			<c:param name="id" value="${comment.id }" />
		</c:url>
		<button class="update-btn" update-url="${commentUpdateUrl }">수정</button>
		<a href="${commentDeleteUrl }" >삭제</a>
	</c:if>
</div>
</c:forEach>





</body>
</html>





