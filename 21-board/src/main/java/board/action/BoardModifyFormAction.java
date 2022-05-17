package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardModifyFormAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/* 1.데이터 처리 */
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		// DB
		BoardDAO dao = new BoardDAO();
		// 해당 데이터 1줄 가져오기
		BoardBean bean = dao.boardView(board_num);
		
		/* 2.데이터 공유 */
		request.setAttribute("bean", bean);
		request.setAttribute("pg", pg);
		
		/* 3.view 처리 파일 리턴 */
		//request.setAttribute("ref", "modify");
		request.setAttribute("ref", "board/boardModify.jsp");
        return "index.jsp";
        
		//return "/board/boardModify.jsp";
	}
	
}

