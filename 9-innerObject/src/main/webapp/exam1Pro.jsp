<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	//데이터처리 : java영역 
	request.setCharacterEncoding("utf-8");	//post 방식은 한글을 encoding 해줘야됨
	
	String str_studentID = request.getParameter("studentID");
	String str_name = request.getParameter("name");
	String str_grade = request.getParameter("grade");
	String str_subject = request.getParameter("subject");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- view 처리 : HTML영역 -->
	<h1>학생정보</h1>
	<table border="1" width="200">
		<tr>
			<td width="50%">학번</td>
			<td width="50%"><%=str_studentID %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=str_name%></td>
		</tr>
		<tr>
			<td>학년</td>
			<td><%=str_grade %></td>
		</tr>
		<tr>
			<td>선택과목</td>
			<td><%=str_subject %></td>
		</tr>
	</table>
	<hr>
	
	<h2> request 객체 </h2>
	클라이언트IP = <%=request.getRemoteAddr() %><br>
	요청정보 길이 = <%=request.getContentLength() %><br>
	요청정보 인코딩 = <%=request.getCharacterEncoding() %><br>
	요청정보 컨텐트타입 = <%=request.getContentType() %><br>
	요청정보 프로토콜 = <%=request.getProtocol() %><br>
	요청정보 전송방식 = <%=request.getRequestURI() %><br>
	요청 URL = <%=request.getRequestURL() %><br>
	컨텍스트 경로 = <%=request.getContextPath() %><br>
	서버이름 = <%=request.getServerName() %><br>
	서버포트 = <%=request.getServerPort() %><br>
	<hr>
	
	<h2>헤더 정보</h2>
	<%
		Enumeration header = request.getHeaderNames();
		while(header.hasMoreElements()) {
			String headerName = (String) header.nextElement();
			String headerValue = request.getHeader(headerName);
	%>
	<%=headerName%> = <%=headerValue %>
	<% } %>

</body>
</html>