<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.function.DoubleUnaryOperator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String str_x = request.getParameter("x");
	String str_y = request.getParameter("y");
	String calcPlus = "";
	String calcMinus = "";
	String calcMulti = "";
	String calcDiv = "";
	
	// 입력값 검사(정규표현식)
	String warning = "";
	if(str_x.equals("") || str_y.equals("")) {
		warning = "입력값이 없습니다.";		
	} else {
		String regex = "^[0-9]+(.[0-9]+)?$";  // 실수인지 검사하는 정규표현식 
		boolean isNum1 = Pattern.matches(regex, str_x);
		boolean isNum2 = str_y.matches(regex);
		
		if(isNum1 && isNum2) {
			double x = Double.parseDouble(str_x);
			double y = Double.parseDouble(str_y);
				
			calcPlus = x + "+" + y + "=" + (x + y);
			calcMinus = x + "-" + y + "=" + (x - y);
			calcMulti = x + "*" + y + "=" + (x * y);
			calcDiv = x + "/" + y + "=" + (x / y);
		} else {
			warning = "숫자로 입력해주세요";		
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if("<%=warning%>" != "") {
		alert("<%=warning%>");
		history.back();	// 이전 화면 이동
	}
</script>
</head>
<body>	
<% if(warning.equals("")) {%>	
	<%=calcPlus %><br>
	<%=calcMinus %><br>
	<%=calcMulti %><br>
	<%=calcDiv %><br>
<% } else { %>
	<%=warning %>
<% } %>
</body>
</html>




