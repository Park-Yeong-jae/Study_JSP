<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#wrap {
		width: 500px;
		min-height: 510px;
		margin: 0 auto;
		text-align: center;
		border: 1px solid orange;
	}
	.contentArea {
		min-height: 300px;
		background: orange;
		padding: 10px;
	}
</style>
</head>
<body>

	<div id="wrap">
		<h1>글 내용 상세보기</h1>
		<p>제목 : ${bean.board_subject }</p>
		<p>첨부파일 : <a href="#">${bean.board_file }</a></p>
		<div class="contentArea">
			<pre>${bean.board_content }</pre>		
		</div>
		<a href="boardReplyForm.do?board_num=${bean.board_num}&pg=${pg}">[답변]</a>	
		<a href="boardModifyForm.do?board_num=${bean.board_num}&pg=${pg}">[수정]</a>			
		<a href="boardDeleteForm.do?board_num=${bean.board_num}&pg=${pg}">[삭제]</a>	
		<a href="boardList.do?pg=${pg }">[목록]</a>	
	</div>

</body>
</html>