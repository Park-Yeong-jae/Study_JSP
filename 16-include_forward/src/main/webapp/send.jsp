<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// jsp 내장 객체에 데이터 저장
	// pageContext < request < session < application
	// ▼ (순서대로) 현재 페이지	  현재, 다음 페이지		모든페이지		서버가 동작되는동안
	pageContext.setAttribute("apple1", "사과1");
	request.setAttribute("apple2", "사과2");
	session.setAttribute("apple3", "사과3");
	application.setAttribute("apple4", "사과4");
	//페이지 이동
	//response.sendRedirect("sendResult.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>** jsp 표현식 사용 **</h3>
	<%=pageContext.getAttribute("apple1") %><br>
	<%=request.getAttribute("apple2") %><br>
	<%=session.getAttribute("apple3") %><br>
	<%=application.getAttribute("apple4") %><br>
	<hr>
	
	<h3>** EL 표현식 사용 **</h3>
	${pageScope.apple1 }<br>
	${requestScope.apple2 }<br>
	${sessionScope.apple3 }<br>
	${applicationScope.apple4 }<br>
	<hr>
	
	<h3>** EL 표현식 사용 **</h3>
	<!-- 각 내장객체에 저장된 이름이 다른 경우에는 Scope을 생략할 수 있음 -->
	${apple1 }<br>
	${apple2 }<br>
	${apple3 }<br>
	${apple4 }<br>
</body>
</html>