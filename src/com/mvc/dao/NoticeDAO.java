package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.sql.DataSource;
import javax.naming.InitialContext;
import javax.naming.NamingException;

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
	public int write(NoticeDTO dto) {
		int success =0;
		//글번호 , 제목, 작성자, 작성일, 조회수
		String sql = "INSERT INTO Notice VALUES(notice_seq.NEXTVAL,?,?,SYSDATE,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getNotice_title()); //제목
			ps.setString(2, dto.getAdmin_id()); //작성자
			ps.setDate(3, dto.getNotice_date()); //작성일
			ps.setInt(4, 0); //조회수 
			success = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}finally {
			resClose();
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
		}finally {
			resClose();
		}
		return list;
	}

}
