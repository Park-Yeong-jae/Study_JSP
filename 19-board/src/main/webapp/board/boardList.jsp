<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
.orange {
    background: orange;
}
.currentPaging {color: red; text-decoration: underline;}
.paging {color: blue; text-decoration: none;}

td > a:link {color: black; text-decoration: none;}
td > a:visited {color: black; text-decoration: none;}
td > a:action {color: black; text-decoration: none;}
td > a:hover {color: green; text-decoration: underline;}
 </style>
</head>
<body>
	<div style="width: 600px;text-align: center; margin: auto;">
		<h1>글 목록</h1>
		
		<div style="height: 300px;">
			<table>
				<tr>
					<td class="orange" style="width: 10%">번호</td>
					<td class="orange" style="width: 30%">제목</td>
					<td class="orange" style="width: 20%">작성자</td>
					<td class="orange" style="width: 30%">날짜</td>
					<td class="orange" style="width: 10%">조회수</td>
				</tr>
				<c:forEach var="bean" items="${list}">
					<tr>
						<td>${bean.board_num}</td>
						<td align="left">
							<c:if test="${bean.board_re_lev != 0}">
								<!-- 화살표 문자앞에 공백문자 출력 : re_lev * 공백문자 -->
								<c:forEach var="i" begin="0" end="${bean.board_re_lev}" step="1">
									&nbsp;
								</c:forEach>
								▶
							</c:if>
							
							<a href="boardDetail.do?board_num=${bean.board_num}&pg=${pg}">
								${bean.board_subject}</a></td>
						<td>${bean.board_name}</td>
						<td>${bean.board_date}</td>
						<td>${bean.board_readcount}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<div style="text-align: center">
			<c:if test="${startPage>3}">
				<a class="paging" href="boardList.do?pg=${startPage-1}">이전</a>&nbsp;
	    	</c:if>
	    
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<c:if test="${i == pg}">
	            	&nbsp;<a class="currentPaging" href="boardList.do?pg=${i}">${i}</a>
				</c:if>
				<c:if test="${i != pg}">
	            	&nbsp;<a class="paging" href="boardList.do?pg=${i}">${i}</a>
				</c:if>
			</c:forEach>			
			
			<c:if test="${endPage<totalP}">
	        	&nbsp;<a class="paging" href="boardList.do?pg=${endPage+1}">다음</a>
			</c:if>
		</div>
		
		<br>
		<div style="text-align: left;">
			<a href="index.jsp" >메인화면</a> &nbsp;&nbsp;
			<a href="boardWriteForm.do">글쓰기</a>
		</div>
	</div>
	
</body>
</html>