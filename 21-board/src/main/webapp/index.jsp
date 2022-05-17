<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>메인화면</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	height: 100%;
}
div#main {
	width: 800px;
	height: 650px;
	margin: auto;
}
header {
	width: 100%;
	height: 10%;
	text-align: center;
	border: 1px solid lightgray;
}
section{
    float: left;
    width: 190px;
    height: 80%;
    background: orange;
    padding-left: 10px;
}
aside{
    float: left;
    width: 600px;
    height: 80%;
    text-align: center;
    background: aliceblue;
}
footer{
    clear: both;
    width: 100%;
    height: 10%;
    color: aliceblue;
    background: black;
}

#index:link {color: black; text-decoration: none;}
#index:visited {color: black; text-decoration: none;}
#index:active {color: black; text-decoration: none;}
#index:hover {color: green; text-decoration: none;}
</style>
</head>
<body>
<div id="main">
	<header>
		<h1>유머 게시판</h1>
	</header>
	
	<section>
		<h2><a href="index.jsp" id="index">** 메인 메뉴**</a></h2>
		<a href="boardWriteForm.do">게시물 작성</a><br> 
		<a href="boardList.do">목록 이동</a>
	</section>
	
	<aside>
		<c:if test="${ref == null}">
			<jsp:include page="board/body.html" />
		</c:if>
		
		<c:if test="${ref != null}">
			<jsp:include page="${ref}" />
		</c:if>
		
<%-- 
		<c:if test="${ref=='list'}">
			<jsp:include page="board/boardList.jsp" />
		</c:if>
		<c:if test="${ref=='modify'}">
			<jsp:include page="board/boardModify.jsp" />
		</c:if>
		<c:if test="${ref=='modify_fail'}">			
			<jsp:include page="board/boardModifyFail.jsp" /> 
		</c:if>
		<c:if test="${ref=='reply'}">
			<jsp:include page="board/boardReply.jsp" />
		</c:if>
		<c:if test="${ref=='delete'}">
			<jsp:include page="board/boardDelete.jsp" />
		</c:if>
		<c:if test="${ref=='view'}">
			<jsp:include page="board/boardView.jsp" />
		</c:if>
		<c:if test="${ref=='write'}">
			<jsp:include page="board/boardWriteForm.jsp" />
		</c:if>
		<c:if test="${ref==null}">
			<jsp:include page="board/body.html" />
		</c:if>
--%>
	</aside>
	
	<footer> create by HGT 2022.03 </footer>
</div>
</body>
</html>
