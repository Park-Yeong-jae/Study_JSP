<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#passForm {
	width: 300px;
	margin: auto;
	border: 1px solid lightgray;
	text-align: center;
}
</style>
</head>
<body>
<div id="passForm">
	<form action="boardDeletePro.do" method="post" >
		<input type="hidden" name="board_num" value="${param.board_num}">
		<input type="hidden" name="pg" value="${param.pg}">
		
		<label>글 비밀번호 :</label>
		<input type="password" name="board_pass"><br>
		<input type="submit" value="삭제">
		<input type="button" value="돌아가기" onclick="history.back()">
	</form>
</div>
</body>
</html>