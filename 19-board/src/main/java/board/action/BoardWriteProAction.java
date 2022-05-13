package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardWriteProAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1. 데이터 처리
		String realFolder = request.getServletContext().getRealPath("boardUpload");
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024, "utf-8",
													new DefaultFileRenamePolicy());
		BoardBean boardBean = new BoardBean();
		boardBean.setBoard_name(multi.getParameter("board_name"));
		boardBean.setBoard_pass(multi.getParameter("board_pass"));
		boardBean.setBoard_subject(multi.getParameter("board_subject"));
		boardBean.setBoard_content(multi.getParameter("board_content"));
		boardBean.setBoard_file(multi.getOriginalFileName("board_file"));
		
		//System.out.println("이름 : " + boardBean.getBoard_name());
		//System.out.println("비밀번호 : " + boardBean.getBoard_pass());
		//System.out.println("제목 : " + boardBean.getBoard_subject());
		//System.out.println("내용 : " + boardBean.getBoard_content());
		//System.out.println("파일명 : " + boardBean.getBoard_file());
		
		// DB
		BoardDAO dao = new BoardDAO();
		int result = dao.insertArticle(boardBean);
		
		// 2. 데이터 공유
		//request.setAttribute("result", result);
		
		// 3. 파일이름 리턴
		// => view 처리 : ~.jsp
		// => 데이터 처리 : ~.do
		String forward = null;
		if(result == 0) {   // 저장 실패
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('등록실패'");
			out.println("history.back()");
			out.println("</script>");
		} else {			// 저장 성공
			forward = "boardList.do";  // 목록의 첫페이지를 요청
		}
		
		return forward;
	}

}
