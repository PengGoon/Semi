package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import com.mvc.dto.CartDTO;
import com.mvc.dto.ProductDTO;

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
	
	public ArrayList<CartDTO> view(String user_id) {
		ArrayList<CartDTO> list = new ArrayList<>();
		String sql = "SELECT * FROM cart c, product p WHERE c.prd_id = p.prd_id AND c.user_id=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user_id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				CartDTO dto = new CartDTO();
				dto.setCart_id(rs.getInt("cart_id"));
				dto.setPrd_name(rs.getString("prd_name"));
				dto.setPrd_id(rs.getInt("prd_id"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setPrd_price(rs.getInt("prd_price"));
				dto.setPrd_count(rs.getInt("prd_count"));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			resClose();
		}
		return list;
	}
	
	public CartDTO cartbuy(String prd_id) {
		String sql = "SELECT sell_id, prd_id FROM Product WHERE prd_id=?";
		CartDTO dto = new CartDTO();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, prd_id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				dto.setPrd_id(rs.getInt("prd_id"));
				dto.setSell_Id(rs.getString("sell_id"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			resClose();
		}
		return dto;
	}
	
	//장바구니 삭제
	public int delete(String[] delList) {		
		String sql="DELETE FROM cart WHERE cart_id = ?";
		int delCnt = 0;
		try {
			for(int i=0;i<delList.length; i++) {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, Integer.parseInt(delList[i]));
				delCnt += ps.executeUpdate();
				ps.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}		
		return delCnt;
	}
	
	//장바구니 구매
	public int buy(String[] buyList) {
		String sql="SELECT sell_id, prd_id FROM Product WHERE prd_id=?";
		int buyCnt = 0;
		try {
			for(int i=0;i<buyList.length; i++) {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, Integer.parseInt(buyList[i]));
				buyCnt += ps.executeUpdate();
				ps.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}		
		return buyCnt;
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
