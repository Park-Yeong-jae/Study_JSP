<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	//데이터처리 : java영역 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- view 처리 : HTML 영역 -->
	<h1>학번, 이름, 학년, 선택과목을 입력하는 폼</h1>
	<hr>
	<form action="exam1Pro.jsp" method="post">
		<label>학번 : </label>
		<input type="text" name="studentID"><br>
		<label>이름 : </label>
		<input type="text" name="name"><br>
		<label>학년 : </label>
		<input type="radio" name="grade" value="1학년">1학년
		<input type="radio" name="grade" value="2학년">2학년
		<input type="radio" name="grade" value="3학년">3학년
		<input type="radio" name="grade" value="4학년">4학년<br>
		<label>선택과목 : </label>
		<select name="subject">
			<option value="JSP">JSP</option>
			<option value="Java">Java</option>
			<option value="CSS">CSS</option>
		</select><br>
		
		<input type="submit" value="입력 완료">
	</form>
</body>
</html>