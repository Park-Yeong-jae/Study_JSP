<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

	// DB : id가 있는 지 검사
	MemberDAO dao = new MemberDAO();
	boolean exist = dao.isExistId(id);	// true: id가 존재함, false: id가 존재하지 않음
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkIdClose() {
		// opener : 자바스크립트 내장 객체, 부모 브라우저를 관리하는 객체
		opener.frm.id.value = "<%=id%>";
		window.close();
		opener.frm.pwd.focus();
	}
	
	function checkId() {
		if(!document.frm.id.value) {
			alert("아이디를 입력하세요.");
			document.frm.id.focus();
		} else {
			document.frm.submit();
		}
	}
</script>
</head>
<body>
<form action="checkId.jsp" method="post" name="frm">
	<% if(exist) { %>
		<%=id %>는 사용중입니다.<br><br>
		아이디 <input type="text" name="id">
		<input type="button" value="중복체크" onclick="checkId()">
	<% } else { %>
		<%=id %>는 사용가능합니다.<br><br>
		<input type="button" value="사용" onclick="checkIdClose()">
	<% } %>
</form>
</body>
</html>