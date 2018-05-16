package com.mvc.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.dto.UserDTO;

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
			if (rs != null) {
				rs.close();
			}
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 중복 체크
	public boolean overlay(String user_Id) {
		boolean over = false;
		String sql = "SELECT user_Id FROM UserDB WHERE user_Id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user_Id);
			rs = ps.executeQuery();
			over = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			resClose();
		}
		return over;
	}

	// 회원가입
	public int join(UserDTO dto) {
		int success = 0;
		String sql = "INSERT INTO UserDB VALUES(?,?,?,?,?,?,SYSDATE)";
		System.out.println(dto.getUser_Id());
		System.out.println(dto.getUser_Pw());
		//,SYS_DATE
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getUser_Id());
			ps.setString(2, dto.getUser_Pw());
			ps.setString(3, dto.getUser_Name());
			ps.setString(4, dto.getUser_Addr());
			ps.setString(5, dto.getUser_Email());
			ps.setString(6, dto.getUser_Phone());
			success = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			resClose();
		}
		return success;
	}

	// 로그인 메서드
	public boolean login(String user_Id, String user_Pw) {
		boolean success = false;
		String sql = "SELECT user_Id FROM UserDB WHERE user_Id=? AND user_Pw=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user_Id);
			ps.setString(2, user_Pw);
			rs = ps.executeQuery();
			success = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			resClose();
		}
		return success;
	}

	//회원 리스트 
	public ArrayList<UserDTO> list() {
		ArrayList<UserDTO> list = new ArrayList<>();
		String sql = "SELECT * FROM UserDB ORDER BY user_Date ASC";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				UserDTO dto = new UserDTO();
				//리스트에 출력할 값 : 아이디, 주소, 전화번호, 가입날짜 
				dto.setUser_Id(rs.getString("user_Id"));
				dto.setUser_Addr(rs.getString("user_Addr"));
				dto.setUser_Phone(rs.getString("user_Phone"));
				dto.setUser_date(rs.getDate("user_Date"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			resClose();
		}
		return list;
	}
	
	

}
