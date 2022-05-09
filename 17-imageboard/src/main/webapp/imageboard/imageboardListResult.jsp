<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border: 1px solid black;
	width: 500;
	border-collapse: collapse;
}
tr {
	text-align: center;
}
td, th {
	border: 1px solid black;
	border-collapse: collapse;
}
.paging {
	color: blue;
	text-decoration: none;
}

.currentPaging {
	color: red;
	font-weight: bold;
	text-decoration: underline;
}
</style>
</head>
<body>
	<div style="height: 50%;">
		<table width="100%">
			<tr>
				<th width="7%">번호</th>
				<th>이미지</th>
				<th width="20%">상품명</th>
				<th width="20%">단가</th>
				<th width="7%">개수</th>
				<th width="20%">합계</th>
			</tr>
			
			<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.seq }</td>
				<td> <!-- 이미지를 클릭했을경우에 상세보기 -->
					<!--  <a href="../main/index.jsp?req=imageboardView&pg=${pg }&seq=${dto.seq }">  -->
					<a href="../imageboard/imageboardView.jsp?pg=${pg }&seq=${dto.seq }">
						<img width="50" height="50" src="../storage/${dto.image1 }">
					</a> 
				</td>
				<td>${dto.imageName }</td> <%-- ${dto.imageName() } --%>
				<td>${dto.imagePrice }</td>
				<td>${dto.imageQty }</td>
				<td>${dto.imagePrice * dto.imageQty }</td>
			</tr>
			</c:forEach>
			
		</table>
	</div>
	<br>
	<div align="center">
		<c:if test="${startPage > 3 }">
			[<a class="paging" href="../imageboard/imageboardList.jsp?pg=${startPage-1 }">이전</a>]
		</c:if>
			
			
		<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
			<c:if test="${pg == i }">
				[<a class="currentPaging" href="../imageboard/imageboardList.jsp?pg=${i }">${i }</a>]
			</c:if>
				
			<c:if test="${pg!=i }">
				[<a class="paging" href="../imageboard/imageboardList.jsp?pg=${i }">${i }</a>]
			</c:if>
		</c:forEach>
			
		<c:if test="${endPage < totalP}">
			[<a class="paging" href="../imageboard/imageboardList.jsp?pg=${endPage+1 }">다음</a>]
		</c:if>
		</div>
</body>
</html>