<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		List<String> list = new ArrayList<>();
		list.add("eclipse");
		list.add("java");
		list.add("python");
		list.add("react");
		pageContext.setAttribute("mylist", list);
	%>
	<h3>core forEach</h3>
	<ul>
		<c:forEach items="${mylist}" var="item">
			<li>${item }</li>
		</c:forEach>
	</ul>


	<h3>core choose, when, otherwise</h3>
	<c:choose>

		<c:when test="${200 gt 100 }">
			<p>10이 100보다 크다</p>
		</c:when>
		<c:when test="${200 gt 100 }">
			<p>20이 100보다 크다</p>
		</c:when>
		<c:when test="${50 gt 100 }">
			<p>50이 100보다 크다</p>
		</c:when>
		<c:otherwise>
			<p>100보다 큰 수가 없다.</p>
		</c:otherwise>

	</c:choose>




	<h3>core url</h3>
	<c:url value="/login" />


	<h3>core if</h3>
	<c:if test="${ 2 > 3 }">
		<p>2는 3보다 크다.</p>
	</c:if>

	<c:if test="${ 2 lt 3 }">
		<p>2는 3보다 작다.</p>
	</c:if>


	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
</html>







