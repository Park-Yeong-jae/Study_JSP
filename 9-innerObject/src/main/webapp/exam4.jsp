<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = "홍길동";

	//두번째 방법 (거의 사용안함)
	out.println(name);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> out 내장 객체 - out.println()</h2>
	<p> 첫번쨰 방법 : <%=name %></p>
</body>
</html>