<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- jstl 사용을 위한 선언 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록</title>
<style type="text/css">
table, td, th {
	border: 2px solid #CCC;
	border-collapse: collapse;
}
#frameDiv {
	text-align: center;
	width: 600px;
	height: 500px;
	margin: auto;
}
#tableDiv {
	height: 300px;
}
table {
	width: 100%;
}
th {
	background: orange;
}
td {
	text-align: center;
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
td>a:link {color: black; text-decoration: none;}
td>a:visited {color: black; text-decoration: none;}
td>a:hover {color: green; text-decoration: underline;}
td>a:active {color: black; text-decoration: none;}

</style>
</head>
<body>
	<div id="frameDiv">
		<h2>글 목록</h2>
		<div id="tableDiv">
			<table>
				<!-- Title -->
				<tr>
					<th width="55px">번호</th>
					<th width="*">제목</th>
					<th width="100px">작성자</th>
					<th	width="180px">날짜</th>
					<th width="55px">조회수</th>
				</tr>
				
				<!-- List -->
				<c:forEach var="bean" items="${list }">
					<tr>
						<td>${bean.board_num }</td>
						<td style="text-align: left;">
							<c:if test="${bean.board_re_lev != 0}">
								<c:forEach var="i" begin="0" end="${bean.board_re_lev}" step="1">
									&nbsp;
								</c:forEach>
								▶
							</c:if>
							<a href="boardDetail.do?board_num=${bean.board_num }&pg=${pg}">
								${bean.board_subject }</a>					
						</td>
						<td>${bean.board_name }</td>
						<td>${bean.board_date }</td>
						<td>${bean.board_readcount }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div>
			<!-- Paging -->
			<c:if test="${start_Page > 5 }">
				[<a class="paging" href="boardList.do?pg=${start_Page-1 }">이전</a>]
			</c:if>
			
			<c:forEach var="i" begin="${start_Page }" end="${end_Page }" step="1">
				<c:if test="${pg == i }">
					[<a class="currentPaging" href="boardList.do?pg=${i }">${i }</a>]
				</c:if>
				
				<c:if test="${pg != i }">
					[<a class="paging" href="boardList.do?pg=${i }">${i }</a>]
				</c:if>
			</c:forEach>
			
			<c:if test="${end_Page < totalP}">
				[<a class="paging" href="boardList.do?pg=${end_Page+1 }">다음</a>]
			</c:if>
		</div>
		
		<div align="left">
			<input type="button" value="메인으로" onclick="location.href='index.jsp'">
		</div>
	</div>
	
	
</body>
</html>