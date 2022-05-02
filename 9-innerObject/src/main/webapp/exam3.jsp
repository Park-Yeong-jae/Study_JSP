<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//데이터처리 : java 영역
	response.sendRedirect("exam3Pro.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response 내장 객체</title>
<script type="text/javascript">
	function move() {
		location.href="exam3Pro.jsp";
	}
</script>
</head>
<body>
	<!-- view 처리 : HTML 영역 -->
	<h1>response 내장 객체 - 리다이렉트</h1>
	<script type="text/javascript">
		alert("현재 페이지는 <b>exam3Pro.jsp</b>페이지 입니다.")
	</script>
	
	<p>a 태그 이용 : <a href="exam3Pro.jsp">exam3Pro.jsp</a></p>
	<p>js 이용 : <input type="button" onclick="move()" value="확인">exam3Pro.jsp</p>

</body>
</html>