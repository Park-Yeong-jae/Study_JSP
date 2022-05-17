package board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 1. 데이터 처리 
		int pg = 0;
		
		if(request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		} else {
			pg = 1;
		}
		
		// 1) 목록 : 10개
		int endNum = 10 * pg;
		int startNum = endNum - 9;
		
		BoardDAO dao = new BoardDAO();
		List<BoardBean> list = dao.boardList(startNum, endNum);
		
		// 2) 페이징
		int totalA = dao.getTotalA();
		int totalP = (totalA + 9) / 10;
		
		// 5블럭
		int start_Page = (pg - 1) / 5 * 5 + 1;
		int end_Page = start_Page + 4;
		if(end_Page > totalP) end_Page = totalP;
		
		// 2. 데이터 공유 
		request.setAttribute("pg", pg);
		request.setAttribute("list", list);
		request.setAttribute("totalP", totalP);
		request.setAttribute("start_Page", start_Page);
		request.setAttribute("end_Page", end_Page);
		
		// 3. view 처리 파일명 리턴 
		//request.setAttribute("ref", "list");
		request.setAttribute("ref", "board/boardList.jsp");
        return "index.jsp";
        
		//return "/board/boardList.jsp";
	}

}

