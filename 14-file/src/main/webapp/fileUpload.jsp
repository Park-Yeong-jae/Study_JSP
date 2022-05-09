<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*   // <form> 태그의 enctype="multipart/form-data" 일 경우에는
   // request 객체로는 전달된 데이터를 읽을 수 없음
   String subject = request.getParameter("subject");
   String content = request.getParameter("content");
   System.out.println("subject = " + subject);
   System.out.println("content = " + content);
*/
   // 실제 파일 저장 폴더위치 확인
   // realFolder = D:\aa_ycs\java_ycs\jsp\workspace\.metadata\.plugins\
   //              org.eclipse.wst.server.core\tmp0\wtpwebapps\14-file\storage
   String realFolder = request.getServletContext().getRealPath("./storage");
   //String realFolder = application.getRealPath("./storage");
   System.out.println("realFolder = " + realFolder);
   
   String subject="";
   String content="";
   String originalFileName1="", originalFileName2="";
   String fileName1="", fileName2="";
   long fileSize1=0, fileSize2=0;
   
   // 데이터 처리 클래스 : <form> 태그의 enctype="multipart/form-data" 일 경우
   // request   : 요청 처리 객체
   // realFolder : 파일 저장 폴더 위치
   // 5*1024*1024 : 업로드할 때의 최대 파일 크기, 5MB = 5*1KB*1KB
   // "UTF-8" : 인코딩 설정
   // new DefaultFileRenamePolicy() : 업로드시, 저장 폴더에 똑같은 파일이름이 있을 경우
   //                           기존 파일 이름에 숫자를 덧붙여서 저장시키는 설정 클래스   
   try {
      MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024, 
                              "UTF-8", new DefaultFileRenamePolicy());
      subject = multi.getParameter("subject");
      content = multi.getParameter("content");
      // 브라우저에서 서버로 보낸 파일이름    
      originalFileName1 = multi.getOriginalFileName("upload1");
      originalFileName2 = multi.getOriginalFileName("upload2");
      // 서버의 storage 폴더에 저장된 파일 이름
      fileName1 = multi.getFilesystemName("upload1");
      fileName2 = multi.getFilesystemName("upload2");
      // 저장된 파일 크기
      File file1 = multi.getFile("upload1");
      File file2 = multi.getFile("upload2");
      fileSize1 = 0;
      fileSize2 = 0;
      
      if(file1 != null) fileSize1 = file1.length();
      if(file2 != null) fileSize2 = file2.length();
   } catch(Exception e) {
      if(originalFileName1.equals("")) {
         PrintWriter out1 = response.getWriter();
         out1.println("<script>");
         out1.println("alert('파일용량이 너무 큽니다.');");
         out1.println("history.back();");
         out1.println("</script>");
      }
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
   <ul>
      <li>제목 : <%=subject %></li>
      <li>내용 : <%=content %></li>
      <li>파일 : 
         <a href="fileDownload.jsp?fileName=<%=originalFileName1 %>"><%=originalFileName1 %></a>
          &nbsp;&nbsp;&nbsp; 
         <%=fileName1 %>
      </li>
      <li>크기 : <%=fileSize1 %></li>
      <br><br>
      <li>파일 : <%=originalFileName2 %> &emsp; <%=fileName2 %></li>
      <li>크기 : <%=fileSize2 %></li>
   </ul>
   
   <img alt="그림" src="storage/<%=fileName1%>" width="150">
   <img alt="그림" src="storage/<%=fileName2%>" width="150">
</body>
</html>


