<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

<%--
	window.onload = function() {
		
		if(${delete_Result > 0}) {
			alert("삭제되었습니다");
		} else {
			alret("삭제하지 못했습니다");
		}
		location.href="../imageboard/imageboardList.jsp?pg=${pg }&seq=${seq }"
	}
--%>
</script>
</head>
<body>
	<c:if test="${delete_Result > 0 }">
		삭제 성공
	</c:if>
	<c:if test="${delete_Result == 0 }">
		삭제 실패
	</c:if>
</body>
</html>