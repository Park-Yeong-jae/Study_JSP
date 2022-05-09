<%@page import="imageboard.dao.ImageboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));

	ImageboardDAO dao = new ImageboardDAO();
	int delete_Result = dao.delete(seq);
	
	request.setAttribute("delete_Result", delete_Result);	// 결과값
	request.setAttribute("pg", pg);							// 페이지
	request.setAttribute("seq", seq);							// seq
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=imageboardDeleteResult");
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