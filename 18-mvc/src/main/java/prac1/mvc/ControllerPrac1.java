package prac1.mvc;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exam2.message1.Action;

@WebServlet("/ControllerPrac1")
public class ControllerPrac1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> map = new HashMap<String, Object>();

    public ControllerPrac1() {
        super();
    }
    
    @Override
    public void init(ServletConfig config) throws ServletException {
    	// 1. properties 파일 읽어오기
    	String realFolder = config.getServletContext().getRealPath("./property");
    	String realPath = realFolder + "/commandPrac1.properties";
    	
    	Properties properties = new Properties();
    	FileInputStream fis = null;
    	try {
			fis = new FileInputStream(realPath);
			properties.load(fis);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(fis != null)fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
    	
    	// 2. 요청정보와 객체 생성후, map에 저장
    	Iterator<?> iterator = properties.keySet().iterator();
    	
    	while(iterator.hasNext()) {
    		String command = (String) iterator.next();
    		String className = properties.getProperty(command);
    		
    		//System.out.println("command = " + command);
    		//System.out.println("className = " + className);
    		
    		try {
				Class<?> commandClass = Class.forName(className);				
				Object object = commandClass.newInstance();
				
				map.put(command, object);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}    
    	}
    	System.out.println(map.toString());
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}

	protected void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청 정보 확인
		String command = request.getParameter("command");
		if(command == null) command = "none";
		
		// 2. 요청 작업 처리
		Action action = (Action)map.get(command);
		
		// 3. 데이터 처리 + view 처리 파일 선택
		String view = null;
		
		if(action != null) {
			try {
				view = action.process(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 4. view 처리 파일로 이동
		if(view != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
	}
}
