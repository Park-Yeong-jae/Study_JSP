<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //데이터처리 : java영역 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- view 처리 : HTML영역 -->
	<form action="exam5Pro.jsp" method="post">
		<label>이름 : </label>
		<input type="text" name="name"><br>
		<label>국어 : </label>
		<input type="text" name="kor"><br>
		<label>영어 : </label>
		<input type="text" name="eng"><br>
		<label>수학 : </label>
		<input type="text" name="mat"><br>
		<input type="submit" value="입력 완료">
		<input type="reset" value="다시 작성">
	</form>
</body>
</html>