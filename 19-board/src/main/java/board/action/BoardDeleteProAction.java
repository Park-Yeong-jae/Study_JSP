package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardDeleteProAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1. 데이터 처리		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		String board_pass = request.getParameter("board_pass");
				
		// DB
		BoardDAO dao = new BoardDAO();
		// 1) 글쓴이가 맞는 지 확인
		boolean isWriter = dao.isArticleBoardWriter(board_num, board_pass);
		// 2) 글쓴이가 맞으면 삭제
		int result = 0;
		if(isWriter) {
			result = dao.deleteBoard(board_num);
		}
		
		// 2. 데이터 공유
		request.setAttribute("board_num", board_num);
		request.setAttribute("pg", pg);
		request.setAttribute("result", result);
		// 3. 파일이름 리턴
		return "/board/board_deletePro.jsp";
		
/*		String forward = null;
		if(result == 0) {   // 삭제 실패
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		} else {			// 삭제 성공
			forward = "boardList.do?pg=" + pg;  // 출발했던 목록으로 돌아가기
		}
	
		return forward;
*/	
	}

}
