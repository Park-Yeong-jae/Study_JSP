<%@page import="member.dao.MemberDAO"%>
<%@page import="member.bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	// 브라우저로부터 전달된 데이터 읽기
	String id = (String)session.getAttribute("memId"); 
	String pwd = request.getParameter("pwd");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String addr = request.getParameter("addr");
	
	//System.out.println(pwd + ", " + email1 + ", " + email2 + ", " + tel1 + ", " + tel2 + ", " + tel3 + ", " + addr);
	
	// DB처리 
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail1(email1);
	dto.setEmail2(email2);
	dto.setTel1(tel1);
	dto.setTel2(tel2);
	dto.setTel3(tel3);
	dto.setAddr(addr);
	
	//System.out.println(dto.toString());
	
	MemberDAO dao = new MemberDAO();
	int result = dao.modify(dto);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// 브라우저가 모든 태그를 인식한 다음, onload 이벤트가 동작됨
	window.onload = function() {
		if(<%=result > 0 %>) {
			alert("회원 정보를 수정하였습니다.");
		} else {
			alert("회원 정보를 수정하지 못했습니다.");
		}
		location.href = "../main/index.jsp";
	}
</script>
</head>
<body>

</body>
</html>