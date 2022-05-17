<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   .writeFormArea {
      width: 100%;
      margin: 30px auto;
   }
   
   table {
      border-spacing: 0;
      border: 1px solid ;
      width: 500px;
      margin: 30px auto;
   }
   
   h2 {
      margin-top: 50px;
      text-align: center;
   }
   
   table td, table th {
      border: 1px solid;
   }
   
   table th {
      background: aliceblue;
      padding: 5px;
   }
   
   textarea {
      resize: none;
      width: 98.5%;
      height: 170px;
      font-size: 15px;
   }
</style>

</head>
<body>
	<div class="boardWriteForm">
		<form action="boardReplyPro.do" method="post">
			<input type = "hidden" name = "pg" value = "${pg }">
			<input type = "hidden" name = "board_num" value = "${boardBean.board_num}">
			<input type = "hidden" name = "board_re_ref" value = "${boardBean.board_re_ref }">
			<input type = "hidden" name = "board_re_lev" value = "${boardBean.board_re_lev }">
			<input type = "hidden" name = "board_re_seq" value = "${boardBean.board_re_seq }">
			
			<h2>답글 등록</h2>
			<table>
				<tr>
					<th width="20%">글쓴이</th>
					<td><input type="text" name="board_name" size="50"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="board_pass" size="50"></td>
				</tr>
				<tr>
					<th>제 목</th>
					<td><input type="text" name="board_subject" size="50"></td>
				</tr>
				<tr>
					<th>내 용</th>
					<td><textarea name="board_content"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="답변글등록">
						<input type="reset" value="다시쓰기">
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>