package imageboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import imageboard.bean.ImageboardDTO;

public class ImageboardDAO {
	// 커넥션 풀 사용
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	public ImageboardDAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");	// 커넥션 풀을 관리할 객체
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	// 커넥션은 돌려주고 rs, pstmt는 닫아버린다
	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
	}
	
	// insert
	public int imageboardWrite(ImageboardDTO dto) {
		int result = 0;
		String sql = "insert into imageboard values (seq_imageboard.nextval, ?, ?, ?, ?, ?, ?, sysdate)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getImageId());
			pstmt.setString(2, dto.getImageName());
			pstmt.setInt(3, dto.getImagePrice());
			pstmt.setInt(4, dto.getImageQty());
			pstmt.setString(5, dto.getImageContent());
			pstmt.setString(6, dto.getImage1());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public List<ImageboardDTO> imageboardListExam() {
		List<ImageboardDTO> list = new ArrayList<ImageboardDTO>();
		String sql = "select * from imageboard order by seq desc";	// seq기준 내림차순
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ImageboardDTO dto = new ImageboardDTO();
				
				dto.setSeq(rs.getInt("seq"));
				dto.setImageId(rs.getString("imageId"));
				dto.setImageName(rs.getString("imageName"));
				dto.setImagePrice(rs.getInt("imagePrice"));
				dto.setImageQty(rs.getInt("imageQty"));
				dto.setImageContent(rs.getString("imageContent"));
				dto.setImage1(rs.getString("image1"));
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
	
	// 목록보기 : 5개씩
	public List<ImageboardDTO> imageboardList(int startNum, int endNum) {
		List<ImageboardDTO> list = new ArrayList<ImageboardDTO>();
		String sql = "select * from "
				+ "(select rownum rn, tt. * from "
				+ "(select * from imageboard order by seq desc) tt) "
				+ "where rn>=? and rn<=?";	// seq기준 내림차순
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ImageboardDTO dto = new ImageboardDTO();
				
				dto.setSeq(rs.getInt("seq"));
				dto.setImageId(rs.getString("imageId"));
				dto.setImageName(rs.getString("imageName"));
				dto.setImagePrice(rs.getInt("imagePrice"));
				dto.setImageQty(rs.getInt("imageQty"));
				dto.setImageContent(rs.getString("imageContent"));
				dto.setImage1(rs.getString("image1"));
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
	
	// 총 데이터 수 구하기
	public int getTotalA() {
		int total = 0;
		String sql = "select count(*) as cnt from imageboard";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())
				total = rs.getInt("cnt");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return total;
	}
	
	// 상세보기
	public ImageboardDTO getImageboardView(int seq) {
		ImageboardDTO dto = null;
		String sql = "select * from imageboard where seq=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new ImageboardDTO();

				dto.setSeq(rs.getInt("seq"));
				dto.setImageId(rs.getString("imageId"));
				dto.setImageName(rs.getString("imageName"));
				dto.setImagePrice(rs.getInt("imagePrice"));
				dto.setImageQty(rs.getInt("imageQty"));
				dto.setImageContent(rs.getString("imageContent"));
				dto.setImage1(rs.getString("image1"));
				dto.setLogtime(rs.getString("logtime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return dto;
	}
	
	// 삭제
	public int delete(int seq) {
		int result = 0;
		String sql = "delete imageboard where seq=?";
		
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
	
	
	// 수정하기 - 양성훈씨 코드
	public int imageboardModify(ImageboardDTO dto) {
		int result = 0;
		String sql = "";
		
		try {
			conn = ds.getConnection();	//공통이므로 밖에서 같이 써도 됨
			
			// image1이 있을경우
			if(dto.getImage1() != null) {
				sql = "update imageboard set imageId=?, imageName=?, imagePrice=?, "
						+ "imageQty=?, imageContent=?, image1=? where seq=?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getImageId());
				pstmt.setString(2, dto.getImageName());
				pstmt.setInt(3, dto.getImagePrice());
				pstmt.setInt(4, dto.getImageQty());
				pstmt.setString(5, dto.getImageContent());
				pstmt.setString(6, dto.getImage1());
				pstmt.setInt(7, dto.getSeq());
			}
			
			// image1이 없을경우
			else {
				sql = "update imageboard set imageId=?, imageName=?, imagePrice=?, "
						+ "imageQty=?, imageContent=? where seq=?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getImageId());
				pstmt.setString(2, dto.getImageName());
				pstmt.setInt(3, dto.getImagePrice());
				pstmt.setInt(4, dto.getImageQty());
				pstmt.setString(5, dto.getImageContent());
				pstmt.setInt(6, dto.getSeq());
			}
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}
}

































