package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.dto.ProductDTO;
import com.mvc.dto.ProductDTO2;

public class ProductDAO2 {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public ProductDAO2() {
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
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

	public ProductDTO2 buy(String prd_id) {
		ProductDTO2 dto2 = null;
		String sql = "SELECT * FROM Product WHERE prd_id = ?";
		try {
			ps  = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(prd_id));
			rs = ps.executeQuery();
			if(rs.next()) {
				dto2 = new ProductDTO2();
				dto2.setPrd_Id(rs.getInt("prd_id"));
				dto2.setPrd_Name(rs.getString("prd_name"));
				dto2.setPrd_Price(rs.getInt("prd_price"));
				dto2.setPrd_Count(rs.getInt("prd_count"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto2;
	}

	public ProductDTO2 list(String prd_id) {
		ProductDTO2 dto2 = null;
		String sql="SELECT * From productimage WHERE prd_id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(prd_id));
			rs = ps.executeQuery();	
			if(rs.next()) {
				dto2 = new ProductDTO2();	
				dto2.setNewFileName1(rs.getString("newFileName1"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return dto2;	
	}

	public ArrayList<ProductDTO2> ulist(String prd_id) {
		ArrayList<ProductDTO2> list = new ArrayList<ProductDTO2>();
		String sql = "SELECT * FROM Product WHERE prd_id = ?";
			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, Integer.parseInt(prd_id));
				rs = ps.executeQuery();
				while(rs.next()) {
					ProductDTO2 dto = new ProductDTO2();
					dto.setPrd_Name(rs.getString("prd_Name"));
					dto.setPrd_Price(rs.getInt("prd_Price"));
					dto.setPrd_Count(rs.getInt("prd_Count"));
					dto.setNewFileName1(rs.getString("newFileName1"));
					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				resClose();
			}
			
		return list;
	}

	public ArrayList<ProductDTO2> uulist(String prd_id) {
		ArrayList<ProductDTO2> list = new ArrayList<ProductDTO2>();
		String sql="SELECT * From productimage WHERE prd_id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(prd_id));
			rs = ps.executeQuery();
			if(rs.next()) {
				ProductDTO2 dto = new ProductDTO2();
				dto.setNewFileName1(rs.getString("newFileName1"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	/*public ProductDTO2 user(String user_id) {
		ProductDTO2 dto2 = null;
		String sql="SELECT user_Name,user_Phone,user_Addr FROM UserDB WHERE user_id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user_id);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto2 = new ProductDTO2();
				dto2.setUser_Name(rs.getString("user_Name"));
				dto2.setUser_Phone(rs.getString("user_Phone"));
				dto2.setUser_Addr(rs.getString("user_Addr"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();//자원 반납
		}
		return dto2;
	}*/

}
