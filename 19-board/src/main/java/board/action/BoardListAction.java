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
		// boardList.do      : pg=1
		// boardList.do?pg=3 : pg=3
		// 현재 페이지 번호
		int pg=0;
        if(request.getParameter("pg") != null) {
            pg = Integer.parseInt(request.getParameter("pg"));
        } else {
            pg = 1;
        }
		// 1) 목록보기 작업
        BoardDAO dao = new BoardDAO();
        
        // 페이당 표시할 게시물 숫자
        // 계산식 1
        int indexMaxNum = 10; // 표시할 목록의 수
        int startNum = indexMaxNum * (pg - 1) + 1;
        int endNum = indexMaxNum * pg;
        // 계산식 2
        //endNum = 10*pg;
        //startNum = endNum - 9;

        List<BoardBean> list = dao.boardBeanList(startNum, endNum);
        
		// 2) 페이징 처리 작업
        // 전체 게시물 숫자
        int totalA = dao.getTotalA();
        // 전체 페이지 수 
        // int totalP = (totalA + 9) / 10;
        int totalP = (totalA + (indexMaxNum - 1)) / indexMaxNum;
        
        // 블럭 숫자
        int block = 3;

        // 페이지 나누기
        int startPage = (pg - 1) / block * block + 1;
        int endPage = startPage + (block - 1);

        if (endPage > totalP) endPage = totalP;
        
		// 2. 데이터 공유
        request.setAttribute("list", list);
        request.setAttribute("pg", pg);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage); 
        request.setAttribute("totalP", totalP);
        
		// 3. view 처리 파일명 리턴
		return "/board/boardList.jsp";
	}

}
