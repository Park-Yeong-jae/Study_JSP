<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	//데이터처리 : java영역

	//post 방식으로 한글이 전송되어 올 경우에는 반드시 한글 엔코딩 처리를 해야함
	request.setCharacterEncoding("UTF-8");

	String str_name = request.getParameter("name");
	String str_age = request.getParameter("age");
	
	int age = Integer.parseInt(str_age);
	
	String result="";
	
	if(age>=20) {
		result ="이상";
	} else {
		result ="미만";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- view 처리 : HTML -->
	<%=str_name %>님의 나이는 20세 <%=result%> 입니다.
</body>
</html>