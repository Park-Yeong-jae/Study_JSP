<%@page import="imageboard.bean.ImageboardDTO"%>
<%@page import="imageboard.dao.ImageboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 데이터처리 -->
<%
	int pg = Integer.parseInt(request.getParameter("pg"));
	int seq = Integer.parseInt(request.getParameter("seq"));
	
	// DB작업
	ImageboardDAO dao = new ImageboardDAO();
	ImageboardDTO dto = dao.getImageboardView(seq);
	
	// 데이터 공유
	request.setAttribute("dto", dto);
	request.setAttribute("pg", pg);
	
	// 화면 이동
	RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=imageboardViewResult");	// index에서 req값 검사
	dispatcher.forward(request, response);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>