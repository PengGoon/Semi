package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.dto.NoticeDTO;

public class NoticeDAO {
	
	Connection conn = null ; 
	PreparedStatement ps =  null;
	ResultSet rs = null;

	public NoticeDAO() {
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//공지사항 작성 
	public Integer write(String admin_id,String title,String content) {
		System.out.println("공지사항 작성");
		System.out.println(admin_id);
		int success =0;
		String sql = "INSERT INTO Notice (notice_id,admin_id,notice_title,notice_content)"
				+ "VALUES(notice_seq.NEXTVAL,?,?,?)";
		try {
			ps = conn.prepareStatement(sql, new String[] {"notice_id"});
			ps.setString(1, admin_id);
			ps.setString(2, title);
			ps.setString(3, content);
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

	private void resClose() {
		System.out.println("자원 반납");
		try {
			if (rs != null) {// rs 가 사용해서 있을 경우만 닫아 준다.
				rs.close();
			}
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	//공지사항 리스트 불러오기 
		public ArrayList<NoticeDTO> list() {
			ArrayList<NoticeDTO> list = new ArrayList<>();
			//실행할 쿼리문
			String sql = "SELECT * FROM Notice ORDER BY notice_id DESC";
			
			try {
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()) {
					NoticeDTO dto = new NoticeDTO();
					//번호 , 제목, 작성자, 작성일, 조회수 
					dto.setNotice_id(rs.getInt("notice_id"));
					dto.setNotice_title(rs.getString("notice_title"));
					dto.setAdmin_id(rs.getString("admin_id"));
					dto.setNotice_date(rs.getDate("notice_date"));
					dto.setbHit(rs.getInt("bHit"));
					list.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}finally {
				resClose();
			}
			return list;
	}
		
		
		//공지사항 삭제 
		public int del(String[] delList) {
			int delCnt = 0;
			String sql = "DELETE FROM Notice WHERE notice_id=?";
			try {
				for(int i=0; i<delList.length;i++) {
					ps = conn.prepareStatement(sql);
					ps.setInt(1, Integer.parseInt(delList[i]));
					delCnt += ps.executeUpdate();
					ps.close();
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return 0;
			}finally {
			resClose();
			}
			return delCnt;
		}

		public NoticeDTO detailView(String idx) {
			// TODO Auto-generated method stub
			NoticeDTO dto = null;
			String sql = "SELECT * FROM Notice WHERE notice_id=?"; 
		
			try {
				ps = conn.prepareStatement(sql);	
				ps.setInt(1,Integer.parseInt(idx));
				rs = ps.executeQuery();
				if(rs.next()) {
					upHit(idx);
					dto = new NoticeDTO();
					//번호, 제목, 내용 , 작성자, 조회수 
					dto.setNotice_id(rs.getInt("notice_id"));
					dto.setNotice_title(rs.getString("notice_title"));
					dto.setNotice_content(rs.getString("notice_content"));
					dto.setAdmin_id(rs.getString("admin_id"));
					dto.setbHit(rs.getInt("bHit"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				resClose();
			}
			
			
			return dto;
		}
		
		//조회수 올리기
		private void upHit(String idx) {
			String sql = "UPDATE Notice SET bHit = bHit+1 WHERE notice_id =?";
			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, Integer.parseInt(idx));
				ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}

		public Integer update(String notice_id, String notice_title, String notice_content) {
			int success = 0;
			String sql = "UPDATE Notice SET notice_title=?, notice_content=? WHERE notice_id=?";
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, notice_title);
				ps.setString(2, notice_content);
				ps.setInt(3, Integer.parseInt(notice_id));
				success = ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				resClose();
			}
			return success;
			
		}

		public NoticeDTO main_detailView(String idx) {
			NoticeDTO dto = null;
			String sql = "SELECT * FROM Notice WHERE notice_id=?"; 
		
			try {
				ps = conn.prepareStatement(sql);	
				ps.setInt(1,Integer.parseInt(idx));
				rs = ps.executeQuery();
				if(rs.next()) {
					upHit(idx);
					dto = new NoticeDTO();
					//번호, 제목, 내용 , 작성자, 조회수 
					dto.setNotice_id(rs.getInt("notice_id"));
					dto.setNotice_title(rs.getString("notice_title"));
					dto.setNotice_content(rs.getString("notice_content"));
					dto.setAdmin_id(rs.getString("admin_id"));
					dto.setbHit(rs.getInt("bHit"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				resClose();
			}
			
			
			return dto;
		}


}

