<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String fileName = request.getParameter("fileName");
	//System.out.println("파일명 : " + fileName);
	
	// 저장 폴더위치 구하기
	String realPath = request.getServletContext().getRealPath("/storage");
	
	// 다운받고자 하는 파일 풀네임
	// 파일명 : C:\Users\USER\Desktop\WEB\4. JSP\workspace\.metadata\.plugins\
	//		org.eclipse.wst.server.core\tmp0\wtpwebapps\14-file\storage\jinra.jpg
	File file = new File(realPath, fileName);
	System.out.println("파일명 : " + file);
	
	/* HTML문서 형식이 아닌, "파일 다운로드" 형태로 전송 */
	// response 객체로 응답 header 설정
	// response.setHeader("이름", "데이터");
	// replaceAll("\\+", " ") : 간혹 파일명에 "+" 문자가 포함되는 경우가 있는데, "+" 문자를 공백문자로 변경한다.
	String str_fileName = new String(URLEncoder.encode(fileName, "UTF-8")).replaceAll("\\+", " ");
	response.setHeader("Content-Disposition", "attachment; fileName=" + str_fileName);
	response.setHeader("Content-Length", String.valueOf(file.length()));
	
	/* 파일 출력 */
	// 기존 out 객체의 출력버퍼를 지우고 출력해야, 예외발생이 안생김
	out.clear();
	out = pageContext.pushBody();
	
	// HDD에 저장된 파일을 RAM으로 읽어옴
	FileInputStream fis = new FileInputStream(file);
	BufferedInputStream bis = new BufferedInputStream(fis);
	byte[] b = new byte[(int)file.length()];
	bis.read(b, 0, b.length);	//byte 배열에 파일데이터 저장
	bis.close();
	fis.close();
	
	// 클라이언트로 전송
	ServletOutputStream sos = response.getOutputStream();
	BufferedOutputStream bos = new BufferedOutputStream(sos);
	bos.write(b);
	bos.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일</title>
</head>
<body>
	파일명 : <%=fileName %>
</body>
</html>