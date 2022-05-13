package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardDetailAction  implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		BoardDAO dao = new BoardDAO();		
		dao.updateReadcount(board_num);  // 조회수 증가
		BoardBean bean  = dao.boardView(board_num);
		
		request.setAttribute("bean", bean);
		request.setAttribute("pg", pg);
		
		return "/board/board_view.jsp";
	}
}
