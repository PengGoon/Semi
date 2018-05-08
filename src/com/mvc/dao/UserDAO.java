package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public UserDAO() { // connection 연결
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	// 자원 반납 메소드
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
		
	//중복 체크
	public boolean overlay(String id) {
		boolean over = false;
		String sql="SELECT id FROM member WHERE id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			over = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return over;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
