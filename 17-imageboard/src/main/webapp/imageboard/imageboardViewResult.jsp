<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 뷰처리 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	text-align: left;
}
table, td {
	border: 1px solid black;
	border-collapse: collapse;
}
div {
	margin: 0;
	text-align: left;
}
tr#textarea {
	margin: 0;
	height: 400;
	text-align: left;
}
</style>
</head>
<body>
	<div>
		<table style="width: 500px; height: 500px;">
			<tr>
				<td rowspan="4" align="center"><img alt="상품이미지" src="../storage/${dto.image1 }" width="150"> </td>
				<td>상품명 : ${dto.imageName }</td>
			</tr>
			
			<tr>
				<td>단가 : ${dto.imagePrice }</td>
			</tr>
			
			<tr>
				<td>개수 : ${dto.imageQty }</td>
			</tr>
			
			<tr>
				<td>합계 : ${dto.imagePrice * dto.imageQty }</td>
			</tr>
			
			<tr>
				<td colspan="2" id="textarea" height="400" valign="top">
					<pre>${dto.imageContent }</pre>
				</td>
			</tr>
		</table>
		
		<br>
		<div>
			<input type="button" value="목록" onclick="location.href='../imageboard/imageboardList.jsp?pg=${pg }'">
			<input type="button" value="수정" onclick="location.href='../imageboard/imageboardModifyFormReady.jsp?pg=${pg }&seq=${dto.seq }'">
			<input type="button" value="삭제" onclick="location.href='../imageboard/imageboardDelete.jsp?pg=${pg }&seq=${dto.seq }'">
		</div>
	</div>
</body>
</html>