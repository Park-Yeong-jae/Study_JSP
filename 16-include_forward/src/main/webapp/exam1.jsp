<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = "고길동";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3> ** include 지시자 ** </h3>
	<!-- 컴파일 되기 전 파일을 불러옴 , 같은 자바 변수가 존재하면 안됨. (소개용)-->
	<%@ include file="today.jsp" %>		
	
	<h3> ** include jsp tag ** </h3>
	<!-- view 처리가 끝난 html 문서로 불러옴 (주로 사용)-->
	<jsp:include page="image.jsp" />	
	
	exam1.jsp : name = <%=name %>	
</body>
</html>