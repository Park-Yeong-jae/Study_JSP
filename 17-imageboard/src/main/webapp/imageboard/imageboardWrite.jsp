<%@page import="imageboard.dao.ImageboardDAO"%>
<%@page import="imageboard.bean.ImageboardDTO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 데이터 처리
	String realFolder = request.getServletContext().getRealPath("./storage");
	
	// 파일 저장
	MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024, "UTF-8");
	
	// 데이터 읽기
	// replace(" ", "") : 공백제거
	String imageId = multi.getParameter("imageId").replace(" ","");
	String imageName = multi.getParameter("imageName").replace(" ","");
	int imagePrice = Integer.parseInt(multi.getParameter("imagePrice").replace(" ",""));
	int imageQty = Integer.parseInt(multi.getParameter("imageQty").replace(" ",""));
	String imageContent = multi.getParameter("imageContent");
	String image1 = multi.getOriginalFileName("image1");	// 얘만 OriginalFileName
	
	// db
	ImageboardDTO dto = new ImageboardDTO();
	dto.setImageId(imageId);
	dto.setImageName(imageName);
	dto.setImagePrice(imagePrice);
	dto.setImageQty(imageQty);
	dto.setImageContent(imageContent);
	dto.setImage1(image1);
	
	ImageboardDAO dao = new ImageboardDAO();
	int result = dao.imageboardWrite(dto);
	
	// view 처리 파일로 이동 : forward방식
	// 1. 데이터 공유	// list도 저장이 가능하다
	request.setAttribute("result", result);
	request.setAttribute("imageName", imageName);
	// 세션에 공유하는법
	//session.setAttribute("result", result);
	
	// 2. 화면 이동	// 화면분할을 해서 인덱스의 섹션에 띄우기 위해 index.jsp로 넘어감
	// RequestDispatcher dispatcher = request.getRequestDispatcher("imageboardWriteResult.jsp");
	RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=imageboardWriteResult");
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