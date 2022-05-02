<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //데이터처리 : java 영역 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- view처리 : HTML영역 -->
	<h1>회원 인증 화면</h1>
	<hr>
	<form action="exam9Pro.jsp" method="post">
		<label>ID : </label>
		<input type="text" name="ID"><br>
		<label>PW : </label>
		<input type="password" name="PW"><br>
		<input type="submit" value="확인">
	</form>
</body>
</html>