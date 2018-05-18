package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.dto.CartDTO;

public class CartDAO {
	
	Connection conn = null ; 
	PreparedStatement ps =  null;
	ResultSet rs = null;

	// DB 연결
	public CartDAO() {
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 장바구니 담기
	public int cart(int prd_id, String user_id, int prd_count) {
		int success = 0;
		String sql = "INSERT INTO Cart VALUES (CART_SEQ.NEXTVAL, ?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, prd_id);
			ps.setString(2, user_id);
			ps.setInt(3, prd_count);
			success = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			resClose();
		}
		return success;
	}

	// 장바구니 상세보기 요청
	public CartDTO detail(int prd_id) {
		CartDTO dto = new CartDTO();
		String sql = "SELECT prd_price, prd_name FROM Product WHERE prd_id = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, prd_id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto.setPrd_price(rs.getInt("prd_price"));
				dto.setPrd_name(rs.getString("prd_name"));
			}
			
			// newFileName1, newFileName2, newFileName3
			sql = "SELECT newFileName1 FROM ProductImage WHERE prd_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, prd_id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto.setNewFileName(rs.getString("newFileName1"));
			}
			
			ps = conn.prepareStatement(sql);
			
			sql = "SELECT * FROM cart WHERE prd_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, prd_id);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto.setCart_id(rs.getInt("cart_id"));
				dto.setPrd_id(rs.getInt("prd_id"));
				dto.setUser_id(rs.getString("user_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			resClose();
		}
		return dto;
	}
	
	// 자원 반납
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
}
