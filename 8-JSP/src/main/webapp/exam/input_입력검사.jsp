<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table, tr, th, td {
	border: 1px solid;
	border-collapse: collapse;  /* 테두리를 1줄로 표시 */
	padding: 5px;
	text-align: center;
}
</style>

<script type="text/javascript">
	function doSubmit() {
/*
		var frm = document.form;
		// 입력값이 있는 지 검사
		if (!frm.x.value) {
			alert("x쪽 숫자를 입력하세요");
			frm.x.focus();
			return false;
		}

		if (!frm.y.value) {
			alert("y쪽 숫자를 입력하세요");
			frm.y.focus();
			return false;
		}
		
		// 숫자로만 구성되어 있는지 검사
		// isNaN() : true, 문자일경우   false, 숫자일 경우 
		if(isNaN(frm.x.value) || isNaN(frm.y.value)) {
			alert("숫자로만 입력해주세요");
			return false;
		}	
*/
		
		frm.submit();
	}
</script>
</head>
<body>
	<form action="result.jsp" method="post" name="form"
		onsubmit="doSubmit(); return false;">
		<table border="1">
			<tr>
				<th>X</th>
				<td><input type="text" name="x"></td>
			</tr>

			<tr>
				<th>Y</th>
				<td><input type="text" name="y"></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="계산"> <input
					type="reset" value="원래대로"></td>
			</tr>
		</table>
	</form>
</body>
</html>