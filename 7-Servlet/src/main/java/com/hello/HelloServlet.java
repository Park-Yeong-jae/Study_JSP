package com.hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
	톰캣 서버는 서블릿 클래스를 구동시키면,
	제일 먼저 init() 함수를 호출함
	그 다음에 브라우저로부터 통신방식이 get 방식이면, doGet() 함수를 호출함
	만일 post방식이면, doPost() 함수를 호출함
	
	톰캣서버가 클래스를 종료할 때, destroy() 호출시킴
*/
@WebServlet("/HelloServlet")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HelloServlet() {
        super();
    }
    
    // 클래스가 시작될 때, 한번만 호출됨
    @Override
    public void init(ServletConfig config)	throws ServletException {
    	System.out.println("init() 호출");
    	
    }
    // 클래스가 종료될 때, 한번만 호출됨
    @Override
    public void destroy() {
    	System.out.println("destroy() 호출");
    }
    
    // 브라우저의 요청이 올 때마다, 호출됨
    // 데이터처리 + view처리(HTML문서 작성)
    // request : 데이터처리
    // response : view 처리
    
    // get방식
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println("doGet()호출");
		// 1. 데이터 처리
		
		// 2. View 처리
		response.setContentType("text/html; charset=UTF-8");	// 지금부터 작성하는 문자열은 html 문서로 설정함.
		PrintWriter out = response.getWriter();		// html 문서 출력 객체	
		out.println("<html>");
		out.println("<head>");
		out.println("<title>서블릿</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<p>Hello Servlet</p>");
		out.println("<p>안녕, 서블릿 !!</p>");
		out.println("</body>");
		out.println("</html>");
	}
	// post방식
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	
	}

}
