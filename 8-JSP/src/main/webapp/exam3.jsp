<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //데이터처리 : java 영역

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- view 처리 : HTML 영역 -->
	<form action="examPro.jsp" method="post">
		<input type="text" name="num1"> +
		<input type="text" name="num2"><br>
		<input type="submit" value="입력완료">
		<input type="reset" value="다시 작성">
	</form>
</body>
</html>