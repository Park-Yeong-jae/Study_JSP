<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 회원 1명에 대한 데이터 읽어오기
	String id = (String) session.getAttribute("memId");
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getMember(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../script/memberScript.js?v=5"></script>
<style type="text/css">
    table{
        width: 600px;
        border-collapse: collapse;
        border: 1px solid black;
        font-family: Gothic;
    }
    td{
        border: 1px solid black;
        padding: 5px;
    }
    td.center{
        text-align: center;
    }
</style>
</head>
<body>
	<form action="modify.jsp" method="post" name="frm" id="form"
		onsubmit="checkModify(); return false;">
		<table>
			<tr>
				<td class="center">아이디</td>
				<td><input type="text" name="id" maxlength="10" size="10"
					value="<%=dto.getId()%>" disabled>
				</td>
			</tr>
			<tr>
				<td class="center">이름</td>
				<td><input type="text" name="name" maxlength="10" size="10"
					value="<%=dto.getName()%>" disabled>
				</td>
			</tr>
			<tr>
				<td class="center">변경할 비밀번호</td>
				<td><input type="password" name="pwd" id="pwd" value="<%=dto.getPwd() %>"
					placeholder="* 비밀번호 입력"></td>
			</tr>
			<tr>
				<td class="center">재확인</td>
				<td><input type="password" name="repwd" id="repwd" value="<%=dto.getPwd() %>"
					placeholder="* 비밀번호 재확인"></td>
			</tr>
			<tr>
				<td class="center">성별</td>
				<td>
				<% if(dto.getGender().equals("남")) { %>
					<input type="radio" name="gender" value="남" checked disabled>남
					<input type="radio" name="gender" value="여" disabled>여
				<% } else { %>
					<input type="radio" name="gender" value="남" disabled>남
					<input type="radio" name="gender" value="여" checked disabled>여
				<% } %>
				</td>
			</tr>
			<tr>
				<td class="center">변경할 이메일</td>
				<td><input type="text" name="email1" value="<%=dto.getEmail1() %>">&nbsp;@&nbsp;
					<input type="text" name="email2" value="<%=dto.getEmail2() %>">&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td class="center">변경할 핸드폰</td>
				<td><input type="text" name="tel1" maxlength="3" size="3" value="<%=dto.getTel1() %>">
					&nbsp;-&nbsp; <!-- 숫자만 입력받도록 설정 --> 
					<input type="text"	name="tel2" maxlength="4" size="4" value="<%=dto.getTel2() %>"
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
					&nbsp;-&nbsp; 
					<input type="text" name="tel3" maxlength="4" size="4" value="<%=dto.getTel3() %>"
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				</td>
			</tr>
			<tr>
				<td class="center">변경할 주소</td>
				<td><input type="text" name="addr" size="30" value="<%=dto.getAddr() %>"></td>
			</tr>
			<tr>
				<td colspan="2" class="center">
					<button type="submit">회원 정보 수정</button>&nbsp;
					<button type="reset">다시 작성</button>
				</td>
			</tr>
		</table>
		<a href="../main/index.jsp">메인 화면</a>
	</form>
</body>
</html>