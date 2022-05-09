<%@page import="imageboard.dao.ImageboardDAO"%>
<%@page import="imageboard.bean.ImageboardDTO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// get 방식일때는 가져올 수 있으나 , hidden 으로 가져왔으므로 multi로 가져와야됨
	//int pg = Integer.parseInt(request.getParameter("pg"));
	//int seq = Integer.parseInt(request.getParameter("seq"));
	
	String realFolder = request.getServletContext().getRealPath("./storage");
	
	// 파일 저장
	MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024, "UTF-8");
	
	// 데이터 읽기
	int pg = Integer.parseInt(multi.getParameter("pg"));
	int seq = Integer.parseInt(multi.getParameter("seq"));
	String imageId = multi.getParameter("imageId").replace(" ","");		// replace는 공백문자 없애는것임
	String imageName = multi.getParameter("imageName").replace(" ","");
	int imagePrice = Integer.parseInt(multi.getParameter("imagePrice").replace(" ",""));
	int imageQty = Integer.parseInt(multi.getParameter("imageQty").replace(" ",""));
	String imageContent = multi.getParameter("imageContent");
	String image1 = multi.getOriginalFileName("image1");	// 얘만 OriginalFileName
	
	ImageboardDTO dto = new ImageboardDTO();
	dto.setSeq(seq);
	dto.setImageId(imageId);
	dto.setImageName(imageName);
	dto.setImagePrice(imagePrice);
	dto.setImageQty(imageQty);
	dto.setImageContent(imageContent);
	dto.setImage1(image1);
	
	ImageboardDAO dao = new ImageboardDAO();
	int result = dao.imageboardModify(dto);
	
	request.setAttribute("result", result);
	// request.setAttribute("pg", pg);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=imageboardModifyResult");
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