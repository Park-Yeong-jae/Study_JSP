package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardDetailAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));

		BoardDAO dao = new BoardDAO();
		// 조회수 증가
		dao.updateReadcount(board_num);
		
		// 상세보기 : 1줄데이터
		BoardBean bean = dao.boardView(board_num);		
		
		request.setAttribute("pg", pg);
		request.setAttribute("bean", bean);
		
		//request.setAttribute("ref", "view");
		request.setAttribute("ref", "board/boardView.jsp");
        return "index.jsp";
		//return "/board/boardView.jsp";
	}

}

