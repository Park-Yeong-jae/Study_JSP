<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    pageContext.setAttribute("apple1", "사과1");
	request.setAttribute("apple2", "사과2");
	session.setAttribute("apple3", "사과3");
	application.setAttribute("apple4", "사과4");
	
	//forward 방식 이동 클래스
	RequestDispatcher dispatcher = request.getRequestDispatcher("forwardResult.jsp");
	dispatcher.forward(request, response);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 
	<jsp:forward page="forwardResult.jsp"/>
--%>
</body>
</html>