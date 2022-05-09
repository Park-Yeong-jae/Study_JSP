<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	<!-- jstl을 사용하기 위해 추가 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<style type="text/css">
body {
	margin : 0;
	padding: 0;
	height: 100%;
}
#header {
	width: 100%;
	height: 10%;
	text-align: center;
	border: 1px solid black;
}
#container {
	width: 100%;
	height: 80%;
	border: 1px solid black;
}
#nav {
	width: 20%;
	height: 97%;
	float: left;
	background: orange;
	padding: 10px;
}
#section {
	width: 75%;
	height: 97%;
	float: left;
	padding: 10px;
}
#footer {
	width: 100%;
	height: 10%;
	clear: both;
	text-align: center;
	border: 1px solid black;
}
h3 > a:link {color: black; text-decoration: none;}
h3 > a:visited {color: black; text-decoration: none;}
h3 > a:action {color: black; text-decoration: none;}
h3 > a:hover {color: green; text-decoration: none;}
</style>
</head>
<body>
<div style="width: 800px; height: 800px; margin: auto;">
	<div id="header">
		<h1>이미지 게시판</h1>
	</div>
	
	<div id="container">
		<div id="nav">
			<h3><a href="../main/index.jsp">*** 메인화면 ***</a></h3>
			<a href="#">회원가입</a><br>
			<a href="#">로그인</a><br>
			<a href="#">로그아웃</a><br>
			<a href="#">회원정보수정</a><br>
			
			<a href="#">글쓰기</a><br>
			<a href="#">글목록</a><br>
		
			<a href="../main/index.jsp?req=imageboardWriteForm">이미지등록</a><br>
			<a href="../imageboard/imageboardList.jsp?pg=1">이미지목록</a><br>
		</div>
		
		<div id="section" align="center">
			<!-- view 처리 파일만 include 해서 보여지게함 -->
			<c:if test="${param.req == null }">
				<jsp:include page="body.jsp"/>	<!-- section태그에 이미지파일 추가하기 -->
			</c:if>
			
			<c:if test="${param.req == 'imageboardWriteForm' }">
				<jsp:include page="../imageboard/imageboardWriteForm.jsp"/>
			</c:if>
			
			<c:if test="${param.req == 'imageboardWriteResult' }">
				<jsp:include page="../imageboard/imageboardWriteResult.jsp"/>
			</c:if>
			
			<c:if test="${param.req == 'imageboardListResult' }">
				<jsp:include page="../imageboard/imageboardListResult.jsp"/>
			</c:if>
			<!-- 
			<c:if test="${param.req == 'imageboardView' }">
				<jsp:include page="../imageboard/imageboardView.jsp?pg=${param.pg }&seq=${param.seq }"/>
			</c:if>
			 -->
			<c:if test="${param.req == 'imageboardViewResult' }">
				<jsp:include page="../imageboard/imageboardViewResult.jsp"/>
			</c:if>
			
			<!-- 삭제기능 -->
			<c:if test="${param.req == 'imageboardDeleteResult' }">
				<jsp:include page="../imageboard/imageboardDeleteResult.jsp"/>
			</c:if>
			
			<!-- 수정 기능 -->
			<c:if test="${param.req == 'imageboardModifyForm' }">
				<jsp:include page="../imageboard/imageboardModifyForm.jsp"/>
			</c:if>
			
			<c:if test="${param.req == 'imageboardModifyResult' }">
				<jsp:include page="../imageboard/imageboardModifyResult.jsp"/>
			</c:if>
			
		</div>
	</div>
	
	<div id="footer">
		<p>EZEN IT ACADEMY</p>
	</div>
</div>
	
	
</body>
</html>