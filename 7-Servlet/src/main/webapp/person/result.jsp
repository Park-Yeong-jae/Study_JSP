<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //데이터 처리 : 자바 영역 
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String[] hobby = request.getParameterValues("hobby");		//여러개 불러올때에는 배열로 getParameterValues
	String color = request.getParameter("color");
	String[] subject = request.getParameterValues("subject");
	
	String hobby_result = "";
	for(int i=0; i<hobby.length; i++) {
		hobby_result += hobby[i] + " ";
	}
	String subject_result = "";
	for(int i=0; i<subject.length; i++) {
		subject_result += subject[i] + " ";
	}
%>

<!-- view 처리 : HTML 영역 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	background : <%=color%>;
}
li {
	color : yellow;
}
</style>
</head>
<body>
	<ul>
		<li>이름 : <%=name%></li>
		<li>성별 : <%=gender%></li>
		<li>취미 : <%=hobby_result%></li>
		<li>색깔 : <%=color%></li>
		<li>과목 : <%=subject_result%></li>
	</ul>
</body>
</html>