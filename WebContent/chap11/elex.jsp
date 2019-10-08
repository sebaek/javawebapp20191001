<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="chap09.bean.*" %>
<%
User user = new User();
user.setId("jeju");
user.setPassword("tkaektn");
user.setNickName("무지");

User user2 = new User();
user2.setId("jsp");
user2.setPassword("el");
user2.setNickName("languge");

request.setAttribute("user1", user);
session.setAttribute("user2", user2);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expression Language</title>
</head>
<body>
<h3>기본 문법</h3>
&amp;{firstValue.secondValue }<br>
&amp;{firstValue[secondValue] }<br>

firstValue는 11개의 기본객체 또는 Java Bean <br>
.secondValue는 map의 key 또는 bean의 프로퍼티 <br>
.secondValue 작성 규칙은 java naming 규칙 따름<br>
<br>
[secondValue] map의 key 또는 bean의 프로퍼티<br>
 또는 List의 index 또는 배열의 index<br>
[secondValue] java naming 규칙 따르지 않아도 됨<br>


<h3>예제</h3>
<%= request.getParameter("id") %><br>
${param.id } <br>
${param.nick }<br>
${paramValues.nick["1"] }<br>
${paramValues.nick[1] }<br>
${header.host }<br>
${header.connection }<br>
${header["user-agent"] }<br>

${requestScope.user1.nickName }<br>
${requestScope.user1.password }<br>
${requestScope.user1.id }<br>

${requestScope.user1["nickName"] }<br>
${requestScope.user1["password"] }<br>
${requestScope.user1["id"] }<br>

${sessionScope["user2"]["nickName"] }<br>
${sessionScope.user2["nickName"] }<br>
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





