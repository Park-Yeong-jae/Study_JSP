<%@page import="imageboard.bean.ImageboardDTO"%>
<%@page import="java.util.List"%>
<%@page import="imageboard.dao.ImageboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	ImageboardDAO dao = new ImageboardDAO();
	ImageboardDTO dto = dao.getImageboardView(seq);
	
	request.setAttribute("dto", dto);
	request.setAttribute("imageId ", dto.getImageId());
	request.setAttribute("imageName ", dto.getImageName());
	request.setAttribute("imagePrice ", dto.getImagePrice());
	request.setAttribute("imageQty ", dto.getImageQty());
	request.setAttribute("imageContent ", dto.getImageContent());
	request.setAttribute("image1 ", dto.getImage1());
	request.setAttribute("seq", seq);
	request.setAttribute("pg", pg);
	RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=imageboardModifyForm");
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