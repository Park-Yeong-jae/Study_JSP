<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//세션에 데이터 저장
	session.setAttribute("id", id);
	session.setAttribute("pwd", pwd);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>세션 속성 설정 및 사용</h1>
	<p>id와 password 세션 속성을 설정하였습니다.</p>
	<p> 
		id 속성의 값은
		<%=session.getAttribute("id") %>이고<br>
		password 속성의 값은
		<%=session.getAttribute("pwd")%> 입니다.
	</p>
	
</body>
</html>