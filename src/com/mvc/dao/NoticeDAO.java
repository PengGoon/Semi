package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
		String sql = "INSERT INTO Notice VALUES(notice_seq.NEXTVAL,?,?,?,SYSDATE)";
		try {
			ps = conn.prepareStatement(sql);
			//작성자, 제목, 내용 
			ps.setString(1, dto.getAdmin_id());
			ps.setString(2,dto.getNotice_title());
			ps.setString(3, dto.getNotice_content());
			
			success = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
	}

}
