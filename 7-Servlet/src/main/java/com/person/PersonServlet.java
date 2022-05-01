package com.person;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PersonServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	// 데이터 처리
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String[] hobby = request.getParameterValues("hobby");		//여러개 불러올때에는 배열로 getParameterValues
	String color = request.getParameter("color");
	String[] subject = request.getParameterValues("subject");
	
	String hobby_result = "";
	for(int i=0; i<hobby.length; i++) {
		hobby_result += hobby[i] + " ";
	}
	String subject_result = "";
	for(int i=0; i<subject.length; i++) {
		subject_result += subject[i] + " ";
	}
	
	// view 처리
	response.setContentType("text/html; charset=UTF-8");
	PrintWriter out = response.getWriter();
	
	out.println("<html>");
	out.println("<head>");
	out.println("<title>서블릿</title>");
	out.println("<style>");
	out.println("body {background: " + color + ";}");
	out.println("li {color: yellow;}");
	out.println("</style>");
	out.println("</head>");
	out.println("<body>");
	out.println("<ul>");
	out.println("<li>이름 : " + name + "</li>");
	out.println("<li>성별 : " + gender + "</li>");
	out.println("<li>취미 : " + hobby_result + "</li>");
	out.println("<li>색깔 : " + color + "</li>");
	out.println("<li>과목 : " + subject_result + "</li>");
	out.println("</ul>");
	out.println("<a href>" + "취소" + "</a>");
	out.println("</body>");
	out.println("</html>");
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
