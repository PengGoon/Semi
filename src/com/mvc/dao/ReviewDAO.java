package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.dto.ReviewDTO;

public class ReviewDAO {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public ReviewDAO() {
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//리스트 불러오기
	public ArrayList<ReviewDTO> list() {		
		ArrayList<ReviewDTO> list = new ArrayList<ReviewDTO>();		
		String sql = "SELECT * FROM review ORDER BY review_id DESC";
		try {
			//쿼리 와 ps 준비
			ps = conn.prepareStatement(sql);//쿼리 실행			
			rs = ps.executeQuery();
			while(rs.next()) {//rs 에서 값 가져와 dto 담기
				//번호, 제목, 상품명, 작성자 , 작성일, 조회수 
				ReviewDTO dto = new ReviewDTO();			
				System.out.println("dto 확인");
				dto.setReview_id(rs.getInt("review_id")); //번호
				dto.setReview_title(rs.getString("review_title")); //제목
				dto.setPrd_id(rs.getInt("prd_id"));
				dto.setUser_id(rs.getString("user_id")); //작성자
				dto.setReview_date(rs.getDate("review_date"));
				dto.setbHit(rs.getInt("bHit"));
				dto.setNewFileName(rs.getString("newFileName"));
				list.add(dto);//dto 를 list 에 담기
			}						
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();//자원 반납
		}	
		return list;
	}

	private void resClose() {
		try {
			if(rs != null) {
				rs.close();
			}
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}

	// 상세보기
	public ReviewDTO detailView(String review_id) {
		ReviewDTO dto = null;
		String sql="SELECT * FROM review WHERE review_id = ?";
		try {
			ps  = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(review_id));
			rs = ps.executeQuery();
			if(rs.next()) {
				upHit(review_id);
				dto = new ReviewDTO();
				dto.setReview_id(rs.getInt("review_id"));
				dto.setPrd_id(rs.getInt("prd_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setReview_title(rs.getString("review_title"));
				dto.setReview_content(rs.getString("review_content"));
				dto.setReview_date(rs.getDate("review_date"));
				dto.setbHit(rs.getInt("bHit"));
			}
			//파일명 추출
			String newFileName = fileNameCall(dto.getReview_id());
			if(newFileName != null) {
				dto.setNewFileName(newFileName);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return dto;
	}

	
	/*
	 * 2018/ 05/ 09  13:08 기준 photo 테이블이 없음
	 * 
	 * 
	 */
	//게시글에 해당하는 파일명 추출
	public String fileNameCall(int review_id) {		
		String sql="SELECT newFileName From photo WHERE review_id = ?";
		String fileName = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, review_id);
			rs = ps.executeQuery();
			fileName = rs.next() ? rs.getString("newFileName") : null;			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return fileName;
	}

	//조회수 올리기
	private void upHit(String review_id) {
		String sql="UPDATE review SET bHit = bHit+1 WHERE review_id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(review_id));
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}

	// 글쓰기
	public Integer write(String user_Id, String review_title, String review_content) {
		System.out.println("공지사항 작성");
		System.out.println(user_Id);
		int success =0;
		// 상품번호 4번에대해서만 들어감
		String sql = "INSERT INTO review(review_id, prd_id, user_id, review_title, review_content, "
				+ "review_date,newfilename) "
				
				+"VALUES(review_seq.NEXTVAL, 19, ?, ?, ?, "
				+ "SYSDATE, 12345)";
		try {
			ps = conn.prepareStatement(sql, new String[] {"review_id"});
			ps.setString(1, user_Id);
			ps.setString(2, review_title);
			ps.setString(3, review_content);
			ps.executeUpdate();
			rs = ps.getGeneratedKeys();
			if(rs.next()) {
				success = (int)rs.getLong(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
		return success;
	}

	//글 삭제 메서드
	public int del(String id) {
		int success = 0;
		String sql="DELETE FROM review WHERE review_id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(id));
			success = ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}finally {
			resClose();
		}
		return success;
	}

	//수정
	public int update(ReviewDTO dto) {
		String sql="UPDATE review SET review_title=?, review_content=?, user_id=?"
				+" WHERE review_id=?";
		int success = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getReview_title());
			ps.setString(2, dto.getReview_content());
			ps.setString(3, dto.getUser_id());
			ps.setInt(4, dto.getReview_id());
			success = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}				
		return success;
	}

	public void fileNameUpdate(int review_id, String newFileName, String oldFileName) {
		String sql="";		
		try {
			if(oldFileName != null) {//기존에 올린 파일이 있는 경우(UPDATE)
				sql="UPDATE photo SET newFileName = ? WHERE review_id = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1,newFileName);
				ps.setInt(2, review_id);
			}else {//기존 파일이 없는 경우(INSERT)
				sql="INSERT INTO photo VALUES(photo_seq.NEXTVAL,?,?,?)";
				ps = conn.prepareStatement(sql);			
				ps.setInt(1,review_id);
				ps.setString(2, "no file");
				ps.setString(3, newFileName);
			}
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}		
	}

	

	
	
}
	


