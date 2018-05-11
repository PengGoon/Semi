package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AdminDAO {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public AdminDAO() {
		//DB 연결 
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	//로그인 
	public boolean login(String id, String pw) {
		// 쿼리 준비 
		String sql = "SELECT admin_id FROM Admin WHERE admin_id=? AND admin_pw=?";
		boolean success = false;
		try {
			ps = conn.prepareStatement(sql);
			//?대응
			ps.setString(1, id);
			ps.setString(2, pw);
			//쿼리 실행
			rs = ps.executeQuery();
			success = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			resClose();
		}
		return success;
	}

	//자원 반납 메서드
	private void resClose() {
		try {
			
			if(rs != null) {
				rs.close();
			}
			conn.close();
			ps.close();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		}
			
	}

