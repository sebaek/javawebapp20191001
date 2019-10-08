<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="chap09.bean.*" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/login" var="loginUrl" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>네이버</h1>
<%--

<%
User user = (User) session.getAttribute("user");
if (user == null) {

%>
<a href="<%= contextPath %>/login">로그인</a>

<%
} else {
%>
<p>반갑습니다. <%= user.getNickName() %> 님 </p>
<a href="<%= contextPath %>/logout">로그아웃</a>

<%
}
%>

 --%>


<%--
<%
User user = (User) session.getAttribute("user");
if (user == null) {

%>
 --%>
<%-- <a href="${pageContext.request.contextPath }/login">로그인</a> --%>
<c:if test="${empty user }" >
<a href="${loginUrl }">로그인</a>
</c:if>

<%-- <%
} else {
%> --%>

<c:if test="${not empty user }" >
<p>반갑습니다. ${user.nickName } 님 </p>
<%-- <a href="${pageContext.request.contextPath }/userinfo.jsp">사용자</a> --%>
<a href="<c:url value="/userinfo.jsp" />">사용자</a>
<br>

<%-- <a href="${pageContext.request.contextPath }/logout">로그아웃</a> --%>
<a href="<c:url value="/logout" />">로그아웃</a>

</c:if>
<%-- <%
}
%> --%>



</body>
</html>


