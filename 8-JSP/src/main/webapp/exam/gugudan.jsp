<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단</title>
</head>
<body>	
   <table border="1">
      <% for(int i=1; i<=9; i++) { // 1~9 %>
      	<tr>
         <% for(int j=2; j<=9; j++) { // 단%>
         	<td>&nbsp;<%= j + "*" + i + "=" + j*i %>&nbsp;</td>
         <% } %>
      	</tr>
      <% } %>
   </table>   
</body>
</html>