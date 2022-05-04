<%@page import="member.bean.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int pg = Integer.parseInt(request.getParameter("pg"));
	String id = (String) session.getAttribute("memId");
	
	// 1페이지당 5개 목록 출력
	int endNum = pg * 5;
	int startNum = endNum - 4;
	
	MemberDAO dao = new MemberDAO();
	List<MemberDTO> list = dao.selectList(startNum, endNum);
		
	// 페이징 처리
	int totalA = dao.getTotalMember();	// 총 회원수 구하기
	int totalP = (totalA + 4) / 5;		// 총 페이지수 구하기
		 
	// 3블럭씩 숫자 표시
	int startPage = (pg-1)/3*3 + 1;
	int endPage = startPage + 2;	
	if(endPage > totalP) endPage = totalP; // endPage값 보정
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table, tr, th, td {
	border: 1px solid;
	border-collapse: collapse;
	padding: 3px;
}

th {
	background: lightgray;
}

.paging {color: blue; text-decoration: none;}
.currentPaging {color: red; text-decoration: underline;}
</style>
</head>
<body>
	<div style="height:170px;">
		<table align="center" width="650">
			<tr>
				<th>이름</th>
				<th>아이디</th>
				<th>성별</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>가입일</th>
			</tr>

			<% for (MemberDTO dto : list) { %>
			<tr align="center">
				<td><%=dto.getName()%></td>
				<td><%=dto.getId()%></td>
				<td><%=dto.getGender()%></td>
				<td><%=dto.getEmail1()%>@<%=dto.getEmail2()%></td>
				<td><%=dto.getTel1()%>-<%=dto.getTel2()%>-<%=dto.getTel3()%></td>
				<td><%=dto.getLogtime()%></td>
			</tr>
			<% } %>
		</table>
	</div>
	<br>
		
	<div style="text-align: center;">
		<% if(startPage > 3) { %>	  
			  [<a class="paging" href="memberList.jsp?pg=<%=startPage - 1%>">이전</a>]
		<% } %>	  
		
		<% for(int i=startPage; i<=endPage; i++) { %>
			<% if(pg==i) { %>
			  [<a class="currentPaging" href="memberList.jsp?pg=<%=i%>"><%=i %></a>]
			<% } else { %>  
			  [<a class="paging" href="memberList.jsp?pg=<%=i%>"><%=i %></a>]
			<% } %>
		<% } %>
			  
		<% if(endPage < totalP) { %>
			  [<a class="paging" href="memberList.jsp?pg=<%=endPage + 1%>">다음</a>]
		<% } %>
	</div> 
	
	<a href="../main/index.jsp">메인</a>
</body>
</html>