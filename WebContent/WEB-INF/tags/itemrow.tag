<%@ attribute name="item" type="chap09.bean.Item" %>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:url value="/item" var="itemUrl">
	<c:param name="id" value="${item.id }" />
</c:url>

<div class="itemRow">
	<div class="itemId">${item.id }</div>
	<a class="itemLink" href="${itemUrl }">${item.title }</a>
	<div class="itemUserId">${item.userId }</div>
	<div class="itemTimeAgo">${item.timeAgo }</div>
</div>