<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //데이터처리 : java영역
	String str_num1 = request.getParameter("num1");
	String str_num2 = request.getParameter("num2");
	
	int num1 = Integer.parseInt(str_num1);
	int num2 = Integer.parseInt(str_num2);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- view 처리 : HTML 영역 -->
	<h2> 두수의 합 구하기 </h2>
	<hr>
	<%=num1 %> + <%=num2 %> = <%=num1 + num2 %>
</body>
</html>