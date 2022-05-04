<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	//System.out.println(seq + ", " + pg);
	// DB처리
	BoardDTO dto = new BoardDTO(); 	
	dto.setSeq(seq);
	dto.setSubject(subject);
	dto.setContent(content);
	
	BoardDAO dao = new BoardDAO();
	int result = dao.boardModify(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// 브라우저가 모든 태그를 인식한 다음, onload 이벤트가 동작됨
	window.onload = function() {
		if(<%=result > 0%>) {
			alert("글 수정 성공");			
		} else {
			alert("글 수정 실패");
		}
		location.href = "boardView.jsp?seq=<%=seq%>&pg=<%=pg%>";
	}
</script>
</head>
<body>

</body>
</html>