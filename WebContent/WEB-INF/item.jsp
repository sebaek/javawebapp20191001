<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/mystyle.css' />">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						var update = function() {
							var commentContainer = $(this).closest(
									'.comment-container');
							var commentContent = commentContainer.html();

							var form = $('<form />').attr({
								'action' : $(this).attr('update-url'),
								'method' : 'post'
							}).css({
								'display' : 'flex',
								'flex-grow' : '1'
							});

							var textArea = $('<textArea />').attr({
								'name' : 'comment'
							}).text(
									commentContainer.find('.comment-body')
											.text()).css({
								'flex-grow' : '1'
							});

							var submit = $('<button />').attr({
								'type' : 'submit'
							}).html('<i class="material-icons">send</i>')
									.addClass('plain-text-btn');

							var cancelBtn = $('<button />')
									.html(
											'<i class="material-icons">remove_circle_outline</i>')
									.click(
											function() {
												commentContainer
														.html(commentContent);
												commentContainer.find(
														'.update-btn').click(
														update);
											}).addClass('plain-text-btn');

							form.append(textArea).append(submit);

							commentContainer.empty();
							commentContainer.append(form).append(cancelBtn);

						};
						$('.update-btn').click(update);
					});
</script>


<title>게시글 보기</title>

</head>
<body>
	<my:navbar />
	<div class="item-container">
		<div class="item-top">
			<div class="item-title">제목 : ${item.title }</div>
			<div class="item-userId">별명 : ${item.nickName }</div>
			<div class="item-timeAgo">
				<small>${item.timeAgo }에 게시</small>
			</div>
		</div>
		<c:if test="${not empty item.file }">
			<div class="item-image">
				<img src="<c:url value="/image/${item.id }/${item.file }" />">
			</div>
		</c:if>
		<div class="item-body">
			<pre><c:out value="${item.body }" /></pre>
			<div>
				<c:if test="${item.userId eq user.id }">
					<c:url value="/item/update" var="updateUrl">
					</c:url>

					<a href="${updateUrl }"><i class="material-icons"> edit </i></a>
					<a href="<c:url value="/item/delete" />"><i
						class="material-icons"> delete </i></a>
				</c:if>
			</div>
		</div>



	</div>

	<div class="comment-insert-container">
		<c:if test="${not empty user }">
			<form action="<c:url value="/comment/insert" />" method="post">
				<textarea name="comment">${comment.comment }</textarea>
				<input type="submit" value="댓글">
			</form>
		</c:if>
	</div>

	<div class="comment-list-container">
		<c:forEach items="${comments }" var="comment">
			<div class="comment-container">
				<div class="comment-body-container">
					<pre class="comment-body">${comment.comment }</pre>
				</div>
				<div class="comment-update-container"></div>
				<div class="comment-userId-container">
					<span>${comment.nickName }</span>
				</div>
				<div class="comment-timeAgo-container">
					<span>${comment.timeAgo }</span>
				</div>
				<c:if test="${comment.userId eq user.id }">
					<c:url value="/comment/delete" var="commentDeleteUrl">
						<c:param name="id" value="${comment.id }" />
					</c:url>
					<c:url value="/comment/update" var="commentUpdateUrl">
						<c:param name="id" value="${comment.id }" />
					</c:url>
					<button class="update-btn plain-text-btn"
						update-url="${commentUpdateUrl }">
						<i class="material-icons"> create </i>
					</button>
					<a class="delete-btn" href="${commentDeleteUrl }"><i
						class="material-icons"> delete </i></a>
				</c:if>

			</div>
		</c:forEach>
	</div>





</body>
</html>





