<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	//데이터 처리 : java 영역 
	String cookieName = "id";
	Cookie cookie = new Cookie(cookieName, "hongkd");
	cookie.setMaxAge(120);	//120초
	response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- view 처리 : HTML 영역 -->
	<h2>쿠키를 생성하는 페이지</h2>
	<p>쿠키가 생성되었습니다.</p>
	<input type="button" value="생성된 쿠키 확인" 
		onclick="location.href='useCookie.jsp'">
	
</body>
</html>