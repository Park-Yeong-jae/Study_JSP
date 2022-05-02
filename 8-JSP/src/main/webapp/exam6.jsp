<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //데이터 처리 : java영역 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- view처리 : HTML영역 -->
	<h2>이름과 전화번호를 입력하세요</h2>
	
	<form action="exam6Pro.jsp" method="post">
			<label>이름 : </label>
			<input type="text" name="name"><br>
			<label>전화번호 : </label>
			<select name = "city">
				<option value="031">경기</option>
				<option value="02">서울</option>
				<option value="051">부산</option>
			</select>
			<label> - </label>
			<input type="text" name="number"><br>
			<input type="submit" value="제출">
			<input type="reset" value="다시 작성">
	</form>
</body>
</html>