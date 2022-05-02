<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	//데이터처리 : java영역
	request.setCharacterEncoding("utf-8");	//post 방식 한글 encoding

	String str_location = request.getParameter("location");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- view 처리 : HTML 영역 -->
	<p>선택하신 지역은 <b><%=str_location %></b> 입니다.</p>
</body>
</html>