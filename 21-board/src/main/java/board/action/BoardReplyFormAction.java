package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardReplyFormAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1. 데이터 처리
		int pg = Integer.parseInt(request.getParameter("pg"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));

		// DB
		// => 원글 데이터 읽어오기
		BoardDAO dao = new BoardDAO();
		BoardBean boardBean = dao.boardView(board_num);

		// 2. 데이터 공유
		request.setAttribute("boardBean", boardBean);
		request.setAttribute("pg", pg);

		// 3. view 처리 파일 리턴
		//request.setAttribute("ref", "reply");
		request.setAttribute("ref", "board/boardReply.jsp");
        return "index.jsp";
        
		//return "/board/boardReply.jsp";
	}

}
