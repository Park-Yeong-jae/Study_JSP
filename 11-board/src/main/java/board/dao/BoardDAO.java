package board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.bean.BoardDTO;

public class BoardDAO {
	Connection conn = null; // DB 접속 정보 관리
	PreparedStatement pstmt = null; // db 처리
	ResultSet rs = null; // select문 처리결과 저장
	DataSource ds = null; // 커넥션풀 관리

	// 1) DataSource 객체 얻어오기
	// => DataSource 객체가 커넥션풀을 관리함
	public BoardDAO() {
		try {
			Context context = new InitialContext(); // context.xml파일을 읽어오는 클래스
			// 톰캣이인 경우, DataSource 객체를 찾을 경우
			// context.xml의 name="jdbc/oracle" 속성값에에 반드시 "java:comp/env/"를 붙여야 한다.
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle"); // DataSource 객체 얻어오기
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	// 3) 접속 끊기
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			System.out.println("접속 끊기 실패입니다.");
			// e.printStackTrace();
		}
	}

	// insert into board values(seq_board.nextval, 'num1', '홍길동', '내일은', '웃으리...',
	// 0, sysdate)
	// insert : 글저장
	public int boardWrite(BoardDTO dto) {
		int result = 0;
		String sql = "insert into board values(seq_board.nextval, ?, ?, ?, ?, 0, sysdate)";
		// conn = getConnection(); // 일반 커넥션 사용

		try {
			// 커넥션 풀 사용
			conn = ds.getConnection(); 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("저장 실패입니다.");
			// e.printStackTrace();
		} finally {
			close();
		}

		return result;
	}

	// 목록 보기
	// select seq, id, name, subject, content, hit,
	// to_char(logtime,'YYYY.MM.DD') as logtime from
	// (select rownum rn, tt.* from
	// (select * from board order by seq desc) tt)
	// where rn>=1 and rn<=5;
	public List<BoardDTO> boardList(int startNum, int endNum) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		String sql = "select seq, id, name, subject, content, hit, " + " to_char(logtime, 'YYYY.MM.DD')as logtime from "
				+ " (select rownum rn, tt.* from " + " (select * from board order by seq desc) tt) "
				+ " where rn>=? and rn<=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setSeq(rs.getInt("seq"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setHit(rs.getInt("hit"));
				dto.setLogtime(rs.getString("logtime"));

				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// 상세보기
	public BoardDTO boardView(int seq) {
		BoardDTO dto = null;
		String sql = "select * from board where seq=?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new BoardDTO();
				dto.setSeq(rs.getInt("seq"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				;
				dto.setContent(rs.getString("content"));
				;
				dto.setHit(rs.getInt("hit"));
				dto.setLogtime(rs.getString("logtime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}

	// 조회수 증가하기
	public int updateHit(int seq) {
		int result = 0;
		String sql = "update board set hit = hit+1 where seq=?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	// 글삭제
	// delete board where seq=1
	public int boardDelete(int seq) {
		int result = 0;
		String sql = "delete board where seq=?";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	// 총 데이터 갯수 구하기
	public int getTotalA() {
		int total = 0;
		String sql = "select count(*) as cnt from board";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				total = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return total;
	}

	// 글 수정
	public int boardModify(BoardDTO dto) {
		String sql = "update board set subject = ?, content = ? where seq = ?";
		int result = 0;

		try {
			conn = ds.getConnection(); // 커넥션 풀 사용
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getSeq());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
}
