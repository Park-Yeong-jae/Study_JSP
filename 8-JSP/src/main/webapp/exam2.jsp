<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //데이터 처리 : Java 영역
	Calendar calendar = Calendar.getInstance();
	int yy = calendar.get(Calendar.YEAR);
	int mm = calendar.get(Calendar.MONTH)+1;
	int dd = calendar.get(Calendar.DAY_OF_MONTH);
	
	String result = String.format("%d년%d월%d일", yy, mm, dd);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- view 처리 : HTML 영역 -->
	<p>오늘은 <%=result%> 입니다. </p>
</body>
</html>