<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //데이터 처리 : java 영역
   
	request.setCharacterEncoding("utf-8");	////post 방식 한글 encoding

	String str_name = request.getParameter("name");
	String str_city= request.getParameter("city");
	String str_number = request.getParameter("number");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- view 처리 : HTML 영역 -->
	<p><%=str_name %>님의 전화번호는 <%=str_city%> <%=str_number %> 입니다. </p>
</body>
</html>