<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 수정</title>
<style type="text/css">
h3 {text-align: center;}
table {
	width: 500px;
	margin: auto;
	border-collapse: collapse;
	border: 2px solid #8F8394;
}
table td, th {border: 1px solid #8F8394; padding: 5px;}
textarea {resize: none;}
.label {background-color: #E4DCE8;}
</style>
<script type="text/javascript">
	function modifyCheck() {
		var frm = document.frm;
		
		if(!frm.board_name.value) {
			alert("이름을 입력하세요");
			frm.board_name.focus();
		} else if(!frm.board_pass.value) {
			alert("비밀번호를 입력하세요");
			frm.board_pass.focus();
		} else if(!frm.board_subject.value) {
			alert("제목을 입력하세요");
			frm.board_subject.focus();
		} else if(!frm.board_content.value) {
			alert("내용을 입력하세요");
			frm.board_content.focus();
		} else {
			frm.submit();
		}
	}
</script>
</head>
<body>
	<form action="boardModifyPro.do" method="post" name="frm">
		<input type="hidden" name="board_num" value="${bean.board_num }">
		<input type="hidden" name="pg" value="${pg}">
		
		<h3>게시판 글 수정</h3>
		<table>
			<tr>
				<td class="label">글쓴이</td>
				<td class="input"><input type="text" name="board_name" value="${bean.board_name }"></td>
			</tr>
			<tr>
				<td class="label">비밀번호</td>
				<td class="input"><input type="password" name="board_pass"></td>
			</tr>
			<tr>
				<td class="label">제목</td>
				<td class="input"><input type="text" name="board_subject" value="${bean.board_subject }"></td>
			</tr>
			<tr>
				<td class="label">내용</td>
				<td class="input">
					<textarea name="board_content" rows="15" cols="40">${bean.board_content }</textarea>
				</td>
			</tr>
		</table>
		<!-- 버튼 -->
		<div style="text-align: center;">
			<input type="button" value="수정" onclick="modifyCheck()">
			<input type="button" value="뒤로가기" onclick="history.back()">
		</div>
	</form>
</body>
</html>