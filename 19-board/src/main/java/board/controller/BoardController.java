package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.action.Action;
import board.action.BoardDeleteProAction;
import board.action.BoardDetailAction;
import board.action.BoardListAction;
import board.action.BoardModifyFormAction;
import board.action.BoardModifyProAction;
import board.action.BoardReplyFormAction;
import board.action.BoardReplyProAction;
import board.action.BoardWriteProAction;


@WebServlet("*.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public BoardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");  // 한글 인코딩 설정
		
		// 1. 요청 정보 확인
		String command = request.getServletPath();
		// "/boardWriteForm.do"
		System.out.println("command = " + command);
		
		// 2. 요청 작업 처리 클래스 선택
		String forward = null;
		Action action = null;
		
		if(command.equals("/boardWriteForm.do")) {
			forward = "/board/boardWriteForm.jsp";
		} else if(command.equals("/boardWritePro.do")) {
			action = new BoardWriteProAction();
		} else if(command.equals("/boardList.do")) {
			action = new BoardListAction();
		} else if(command.equals("/boardDetail.do")) {
			action = new BoardDetailAction();  
		} else if(command.equals("/boardDeleteForm.do")) {
			forward = "/board/board_delete.jsp";
			//System.out.println("forward = " + forward);
		} else if(command.equals("/boardDeletePro.do")) {
			action = new BoardDeleteProAction();
		} else if(command.equals("/boardModify.do")) {
			action = new BoardModifyFormAction();  
		} else if(command.equals("/boardModifyPro.do")) {
			action = new BoardModifyProAction();
		} else if(command.equals("/boardReplyForm.do")) {
			action = new BoardReplyFormAction();
		} else if(command.equals("/boardReplyPro.do")) {
			action = new BoardReplyProAction();
		}
		
		// 3. 요청 작업 처리
		// => 파일이름은 ~.jsp 또는 ~.do
		if(action != null) {
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// 4. 화면 이동
		if(forward != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward);
			dispatcher.forward(request, response);
		}		
	}
}








