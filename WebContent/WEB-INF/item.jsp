<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/mystyle.css' />">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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

<style>
.item-container {
	width: 90%;
	margin: auto;
}
.item-top {
	display: flex;
	justify-content: center;
	/* padding-left : 10px;
	padding-right: 10px; */
	margin-bottom: 20px;
}
.item-title {
	flex-basis: 50%;
}
.item-userId {
	flex-basis: 20%;
	font-size: 14px;
}
.item-timeAgo {
	flex-basis: 20%;
	font-size: 14px;
}
.item-image {
	text-align: center;
}
.item-image img {
	display: inline-block;
	max-width: 50%;
	height: auto;
}
.item-body {
	padding-left: 30px;
	padding-right: 30px;
}

</style>
	<div class="item-container">
		<div class="item-top">
			<div class="item-title">제목 : ${item.title }</div>
			<div class="item-userId">id : ${item.userId }</div>
			<div class="item-timeAgo">작성 : ${item.timeAgo }</div>
		</div>
		<c:if test="${not empty item.file }">
		<div class="item-image">
			<img src="<c:url value="/image/${item.id }/${item.file }" />">
		</div>
		</c:if>
		<div class="item-body">
			<pre>${item.body }</pre>
		</div>


		<c:if test="${item.userId eq user.id }">
			<c:url value="/item/update" var="updateUrl">
			</c:url>

			<a href="${updateUrl }">수정</a>
			<a href="<c:url value="/item/delete" />">삭제</a>
		</c:if>

	</div>


	<c:if test="${not empty user }">
		<form action="<c:url value="/comment/insert" />" method="post">
			<textarea name="comment">${comment.comment }</textarea>
			<input type="submit" value="댓글">
		</form>
	</c:if>

	<c:forEach items="${comments }" var="comment">
		<div class="comment-container">
			<pre class="comment-body">${comment.comment }</pre>
			<span>${comment.userId }</span><br> <span>${comment.timeAgo }</span>
			<c:if test="${comment.userId eq user.id }">
				<c:url value="/comment/delete" var="commentDeleteUrl">
					<c:param name="id" value="${comment.id }" />
				</c:url>
				<c:url value="/comment/update" var="commentUpdateUrl">
					<c:param name="id" value="${comment.id }" />
				</c:url>
				<button class="update-btn" update-url="${commentUpdateUrl }">수정</button>
				<a href="${commentDeleteUrl }">삭제</a>
			</c:if>
		</div>
	</c:forEach>





</body>
</html>





