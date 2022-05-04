<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../script/memberScript.js"></script>
</head>
<body>
	<!-- view 처리 : HTML 영역 -->
	<form action="login.jsp" method="post" name="form">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="로그인" onclick="checkLogin(); return false;"> <!-- 입력검사 -->
					<input type="button" value="회원가입" onclick="location.href='writeForm.jsp'">
					 <!-- 함수로도 페이지 이동가능 
					 <input type="button" value="회원가입" onclick="move_writeForm()">
					 -->
				</td>
			</tr>
		</table>
	</form>
</body>
</html>