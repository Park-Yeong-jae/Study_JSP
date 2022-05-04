package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.bean.MemberDTO;

public class MemberDAO {
	// 전역변수
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String username = "C##dbexam";
	String password = "m1234";
	
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//ojdbc8.jar 라이브러리 설치 검사
	public MemberDAO() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	// db 접속
	public Connection getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	// db 접속 끊기
	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// insert 작업
	public int write(MemberDTO dto) {
		int result = 0;
		String sql = "insert into member values (?,?,?,?,?,?,?,?,?,?,sysdate)";
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
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	// 로그인
	public String login(String id, String pwd) {
		// select * from member where id='hong' and pwd='1234';
		// => 결과값중에서 이름만 리턴함
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
		} finally {
			close();
		}
		return name;
	}
	
	// id가 있는지 검사
	public boolean isExistId(String id) {
		boolean result = false;	//true : 있음 , false : id 없음
		String sql = "select * from member where id=?";
		conn = getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	// 데이터가 있으면(id가 존재함)
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
}












