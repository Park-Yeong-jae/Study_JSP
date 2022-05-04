package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import member.bean.MemberDTO;

public class MemberDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String username = "C##dbexam";
	String password = "m1234";
	
	Connection conn;		// DB 접속 관리 클래스
	PreparedStatement pstmt;// DB와 소통하는 클래스 (요청처리, 응답처리)
	ResultSet rs;			// select문 처리 결과를 저장해서 관리하는 클래스
	
	// ojdbc8.jar 라이브러리가 등록되었는 지 검사
	public MemberDAO() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	// db 접속하기
	public Connection getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	// db 접속끊기
	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// insert : 저장
	public int write(MemberDTO dto) {
		int result = 0;
		String sql = "insert into member values (?,?,?,?,?,?,?,?,?,?, sysdate)";
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPwd());
			pstmt.setString(4, dto.getGender());
			pstmt.setString(5, dto.getEmail1());
			pstmt.setString(6, dto.getEmail2());
			pstmt.setString(7, dto.getTel1());
			pstmt.setString(8, dto.getTel2());
			pstmt.setString(9, dto.getTel3());
			pstmt.setString(10, dto.getAddr());
			
			result = pstmt.executeUpdate(); // 1. sql 처리 요청 2. 응답 대기 3. 응답처리
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	// 로그인 
	// select * from member where id='hong' and pwd='1234'
	// => 결과값중에서 이름만 리턴함
	public String login(String id, String pwd) {
		String name = null;		
		String sql = "select * from member where id=? and pwd=?";
		conn = getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				name = rs.getString("name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return name;
	}
	
	// id가 있는 지 검사
	public boolean isExistId(String id) {
		boolean result = false;   // true : id있음, false : id 없음
		String sql = "select * from member where id=?";		
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {  // 데이터가 있으면 => id가 존재함을 의미함
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	// 회원 1명의 데이터 읽어오기
	public MemberDTO getMember(String id) {
		MemberDTO dto = null;
		String sql = "select * from member where id=?";
		conn = getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id); 
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail1(rs.getString("email1"));
				dto.setEmail2(rs.getString("email2"));
				dto.setTel1(rs.getString("tel1"));
				dto.setTel2(rs.getString("tel2"));
				dto.setTel3(rs.getString("tel3"));
				dto.setAddr(rs.getString("addr"));
				dto.setLogtime(rs.getString("logtime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	
	// 데이터 수정
	public int modify(MemberDTO dto) {
		int result = 0;
		String sql = "update member set pwd=?, email1=?, email2=?, "
				   + "tel1=?, tel2=?, tel3=?, addr=? where id=?";
		conn = getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getPwd());
			pstmt.setString(2, dto.getEmail1());
			pstmt.setString(3, dto.getEmail2());
			pstmt.setString(4, dto.getTel1());
			pstmt.setString(5, dto.getTel2());
			pstmt.setString(6, dto.getTel3());
			pstmt.setString(7, dto.getAddr());
			pstmt.setString(8, dto.getId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	} 
	
	// 5개씩 목록 데이터 구하기 
	public List<MemberDTO> selectList(int startNum, int endNum) {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		String sql = "SELECT * from"
				+ "(SELECT ROWNUM rn, tt.* FROM"
				+ "(SELECT * FROM MEMBER ORDER BY name asc, id asc) tt)"
				+ "WHERE rn>=? AND rn<=?";
		conn = getConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail1(rs.getString("email1"));
				dto.setEmail2(rs.getString("email2"));
				dto.setTel1(rs.getString("tel1"));
				dto.setTel2(rs.getString("tel2"));
				dto.setTel3(rs.getString("tel3"));
				dto.setAddr(rs.getString("addr"));
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
	
	// 총인원수 구하기
	public int getTotalMember() {
		int total = 0;
		String sql = "select count(*) as cnt from member";
		conn = getConnection();

		try {
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
	
	// 회원탈퇴 => 삭제작업
	public int delete(String id) {
		int result = 0;
		String sql = "delete member where id = ?";
		conn = getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}
}






















