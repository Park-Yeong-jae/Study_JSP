<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //데이터 처리 영역 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- ▼ 입력검사 스크립트 받아오기 -->
<script type="text/javascript" src="../script/memberScript2.js"></script>
</head>
<body>
	<!-- view 처리 영역 -->
	<form action="login2.jsp" method="post" name="form">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="text" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="로그인" onclick="checkLogin2(); return false;">
					<input type="button" value="회원가입" onclick="location.href='../member/writeForm2.jsp'">
				</td>
				</tr>
		</table>
	</form>
</body>
</html>