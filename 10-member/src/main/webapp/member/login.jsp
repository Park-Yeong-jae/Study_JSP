<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	//데이터 처리 : java 영역
	request.setCharacterEncoding("utf-8");	//post 방식 한글 encoding

	//브라우저로부터 전달된 데이터 읽기
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	//DB처리
	MemberDAO dao = new MemberDAO();
	String name = dao.login(id, pwd);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- view 처리 : HTML 영역 -->
	<% if(name==null) {  %>
		<p><b><%=id %></b>아이디 또는 <b><%=pwd %></b>비밀번호가 틀렸습니다.</p>
	<% } else {  %>
		<p><%=name %> 님이 로그인에 성공했습니다</p>
	<% } %>
</body>
</html>