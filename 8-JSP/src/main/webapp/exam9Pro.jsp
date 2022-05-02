<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //데이터 처리 : java 영역
	request.setCharacterEncoding("utf-8");	//post 방식 한글 엔코딩
	
	String str_ID = request.getParameter("ID");
	String str_PW = request.getParameter("PW");
	
	String result="";

	if(str_ID.equals("root")&&(str_PW.equals("1234"))) {
		result = "로그인에 성공했습니다";
	} else {
		result = "로그인에 실패했습니다";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- view 처리 : HTML 영역 -->
	<%=result %>
</body>
</html>