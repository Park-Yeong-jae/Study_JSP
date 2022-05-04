
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	//데이터 처리 : java 영역
	String id = request.getParameter("id");

	// DB : id가 있는지 검사
	MemberDAO dao = new MemberDAO();
	boolean exist = dao.isExistId(id);		// true : id중복 , false : id 중복안됨
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//중복체크 후 사용하고자 하는 함수
	function checkIdClose() {
		//opener : 자바스크립트 내장 객체, 부모브라우저 관리하는 객체
		opener.form.id.value = "<%=id%>";
		window.close();
		opener.form.pwd.focus();
	} 
	//중복아이디 입력검사
	function checkId() {
		if(!document.form.id.value) {
			alert("아이디를 입력하세요");
		} else {
			document.form.submit();
		}
	}
</script>
</head>
<body>
	<!-- view 처리 : HTML 영역 -->
	<form action="checkId.jsp" method="post">
	
	<%if(exist) { %>
		<%=id %>는 사용중입니다. <br><br>
		아이디 <input type="text" name="id">
		<input type="submit" value="중복체크" onclick="checkId()" >
	<%} else { %>
		<%=id %>는 사용할 수 있는 아이디입니다.
		<input type="button" value="사용" onclick="checkIdClose()">
	<% } %>
	
	</form>
</body>
</html>