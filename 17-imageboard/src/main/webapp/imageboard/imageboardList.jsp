<%@page import="imageboard.bean.ImageboardDTO"%>
<%@page import="java.util.List"%>
<%@page import="imageboard.dao.ImageboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	// 1) 목록 처리 : 5개씩
	int endNum = pg*5;
	int startNum = endNum - 4;
	
	// db처리
	ImageboardDAO dao = new ImageboardDAO();
	List<ImageboardDTO> list =  dao.imageboardList(startNum, endNum);
	
	// 2) 페이징 처리
	int totalA = dao.getTotalA();		// 총 글수 구하기
	int totalP = (totalA + 4) / 5;		// 총 페이지수 구하기
	
	int startPage = (pg-1) / 3*3 + 1;		// 3블력
	int endPage = startPage + 2;			// 3블럭에 맞게 +2 해준다
	if(endPage > totalP) endPage = totalP;	// endPage가 크면 총 페이지값을 가진다
	
	// 데이터 공유
	// request.setAttribute("이름", 데이터);
	request.setAttribute("pg", pg);					// 현재 페이지의 값
	request.setAttribute("list", list);				// 데이터 list
	request.setAttribute("totalP", totalP);			// 현재 페이지수
	request.setAttribute("startPage", startPage);	// 시작 페이지수
	request.setAttribute("endPage", endPage);		// 마지막 페이지수
	
	// 화면 이동
	RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=imageboardListResult");	// index에서 req값 검사
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