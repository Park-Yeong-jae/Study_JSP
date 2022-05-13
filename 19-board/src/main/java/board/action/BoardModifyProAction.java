package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardModifyProAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/* 데이터 처리 */
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		String board_name = request.getParameter("board_name");
		String board_pass = request.getParameter("board_pass");
		String board_subject = request.getParameter("board_subject");
		String board_content = request.getParameter("board_content");
		
		// DB
		BoardDAO dao = new BoardDAO();
		// 글쓴이 인지 확인
		boolean isWriter = dao.isArticleBoardWriter(board_num, board_pass);
		String forward = null;
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(isWriter) {  // 글쓴이가 맞을 경우
			BoardBean bean = new BoardBean();
			bean.setBoard_num(board_num);
			bean.setBoard_name(board_name);
			bean.setBoard_subject(board_subject);
			bean.setBoard_content(board_content);
			
			int result = dao.boardModify(bean);
			
			/* view 처리 파일 리턴 */			
			if(result == 0) {				
				out.println("<script>");
				out.println("alert('수정 실패')");
				out.println("history.back()");
				out.println("</script>");
			} else {				
				out.println("<script>");
				out.println("alert('수정 성공')");
				out.println("location.href='boardDetail.do?pg=" + pg + "&board_num=" + board_num+ "'");
				out.println("</script>");
				//forward = "boardDetail.do?pg=" + pg + "&board_num=" + board_num;
			}
		} else {	// 글쓴이가 아닐 경우			
			out.println("<script>");
			out.println("alert('수정할 권한이 없습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}

