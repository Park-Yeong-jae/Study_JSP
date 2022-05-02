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
	<!-- view처리 : HTML영역 -->
	<form action="exam4Pro.jsp" method="post">
		<label>이름 : </label>
		<input type="text" name="name"><br>
		<label>나이 : </label>
		<input type="text" name="age"><br>
		<input type="submit" value="입력완료">
		<input type="reset" value="다시 작성">
	</form>
</body>
</html>