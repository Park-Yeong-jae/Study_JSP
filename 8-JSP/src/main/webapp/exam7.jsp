<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	//데이터처리 : java영역 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- view 처리 : HTML 영역 -->
	<h1>다음 중 권역을 선택하세요.</h1>
	<form action="exam7Pro.jsp">
		<input type=radio name="location" value="강남, 역삼, 도곡">0 권역<br>
		<input type=radio name="location" value="도봉, 신사, 잠실">1 권역<br>
		<input type="submit" value="제출하기">
	</form>
</body>
</html>