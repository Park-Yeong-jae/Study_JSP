<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="boardDeletePro.do" method="post">
		<label>비밀 번호 : </label>
		<input type="password" name="board_pass"><br><br>
		<input type="submit" value="삭제">
		<input type="button" value="돌아가기" onclick="history.back()">
		
		<input type="hidden" name="board_num" value="${board_num }">
		<input type="hidden" name="pg" value="${pg }">
	</form>
</body>
</html>