<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	//데이터 처리 : java 영역
	request.setCharacterEncoding("UTF-8");	// post 방식 한글 엔코딩
	
	String str_num1 = request.getParameter("num1");
	String str_num2 = request.getParameter("num2");
	String str_calc = request.getParameter("calc");
	
	double num1 = Double.parseDouble(str_num1);
	double num2 = Double.parseDouble(str_num2);
	
	String result="";
	
	switch(str_calc) {
	case "+" : 
		result = num1 + str_calc + num2 + "=" + (num1+num2) ;
		break;
	case "-" :
		result = num1 + str_calc + num2 + "=" + (num1-num2) ;
		break;
	case "*" :
		result = num1 + str_calc + num2 + "=" + (num1*num2) ;
		break;
	case "/" :
		result = num1 + str_calc + num2 + "=" + (num1/num2) ;
		break;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- view 처리 : HTML 영역 -->
	<%=result %>

</body>
</html>