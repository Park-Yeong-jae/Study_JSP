<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>정보 입력 폼</h1>
	<form action="sessionExamPro.jsp" method="post" name="form">
		<label>아이디 : </label>
		<input type="text" name="id" maxlength="16"><br>
		<label>패스워드 : </label>
		<input type="password" name="pwd" maxlength="16"><br>
		
		<input type="submit" value="정보입력">	
	</form>
</body>
</html>