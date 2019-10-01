<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/mywebapp/chap03/viewParameter.jsp" method="post">
	이름: <input type="text" name="name"><br>
	주소: <input type="text" name="address"><br>
	좋아하는 동물:
		<input type="checkbox" name="pet" value="dog">강아지
		<input type="checkbox" name="pet" value="cat">고양이
		<input type="checkbox" name="pet" value="pig">돼지
<br>
<input type="submit">
</form>
</body>
</html>


