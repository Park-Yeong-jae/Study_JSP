<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //데이터 처리 : java 영역
	//post 방식으로 한글이 전송되어 올 경우에는 반드시 한글 엔코딩 처리를 해야함
	request.setCharacterEncoding("UTF-8");
	
	String str_name = request.getParameter("name");
	String str_kor = request.getParameter("kor");
	String str_eng = request.getParameter("eng");
	String str_mat = request.getParameter("mat");

	int kor = Integer.parseInt(str_kor);
	int eng = Integer.parseInt(str_eng);
	int mat = Integer.parseInt(str_mat);
	//double avg = (double)(kor+eng+mat)/3;		로 해도 됨.
	
	String result="";
	
	// switch 문으로도 가능.
	if((kor+eng+mat)/3 >= 90) {
		result = "<수>";
	} else if ((kor+eng+mat)/3 >= 80) {
		result = "<우>";
	} else if ((kor+eng+mat)/3 >= 70) {
		result = "<미>";
	} else if ((kor+eng+mat)/3 >= 60) {
		result = "<양>";
	} else
		result = "<가>";
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- view 처리 : HTML 영역 -->
	<%=str_name %> 님의 성적은 <%=result %> 입니다.
</body>
</html>