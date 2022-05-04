<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	//데이터 처리 : java영역
	
	String id = (String)session.getAttribute("memId");

	// DB에서 데이터 삭제
	MemberDAO dao = new MemberDAO();
	int result = dao.delete(id);
	
	// 세션 삭제
	if(result>0) {
		session.removeAttribute("memName");
		session.removeAttribute("memId");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		if(<%=result > 0 %>) {
			alert("탈퇴 완료");
		} else {
			alert("탈퇴 실패");
		}
		location.href = "../main/index.jsp";
	}
</script>
</head>
<body>

</body>
</html>