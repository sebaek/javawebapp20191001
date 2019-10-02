<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int grade = 11;
	%>
	<%
		String gradeStringA = "A학점";
	%>
	<%
		String gradeStringB = "B학점";
	%>
	<%
		if (grade > 10) {
	%>
	<%=gradeStringA%>
	<%
		} else if (grade > 5) {
	%>
	<%=gradeStringB%>
	<%
		}
	%>
	
	<%
		if (grade > 10) {
			out.println(gradeStringA);
		} else if (grade > 5) {
			out.println(gradeStringB);
		}
	%>


	<%
		out.println("안녕하세요");
	%>
	<br> out기본 객체를 사용하여
	<%
		out.println("출력한 결과입니다.");
	%>
</body>
</html>



