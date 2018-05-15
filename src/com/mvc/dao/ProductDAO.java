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

public class ProductDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public ProductDAO() {
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
	
	public int write(ProductDTO dto) {
		String sql="INSERT INTO product(prd_id,sell_id,cateF_id,cateS_id,prd_name,prd_price,prd_count,prd_from,prd_soldout,prd_bHit,prd_content) " + 
				"VALUES(product_seq.NEXTVAL,?,?,?,?,?,?,?,0,0,?)";
		long fk = 0;
		try {
			//ojdbc 8  버전 이상에서 가능
			//2번째 인자 값은 값을 넣고 반환 해 줄 컬럼
			//new String[]{"반환받을 컬럼명"} 또는 new int[]{반환받을 컬럼번호}
			ps = conn.prepareStatement(sql, new String[] {"prd_id"});
			//product 테이블에 데이터 추가
			ps.setString(1, dto.getSell_Id());
			ps.setString(2, dto.getCateFirst_Id());
			ps.setString(3, dto.getCateSecond_Id());
			ps.setString(4, dto.getPrd_Name());
			ps.setInt(5, dto.getPrd_Price());
			ps.setInt(6, dto.getPrd_Count());
			ps.setString(7, dto.getPrd_From());
			ps.setString(8, dto.getPrd_Content());
			ps.executeUpdate();
			rs = ps.getGeneratedKeys();//이 과정으로 원하는 컬럼을 받아 올 수 있다.
			String fileName1 = dto.getNewFileName1();
			String fileName2 = dto.getNewFileName2();
			String fileName3 = dto.getNewFileName3();
			System.out.println("fileName : "+fileName1);
			System.out.println("fileName : "+fileName2);
			System.out.println("fileName : "+fileName3);
			if(rs.next()) {
				fk = rs.getLong(1);//넣은 값의 idx 받아오기
				sql = "INSERT INTO ProductImage (prd_id,newFileName1,newFileName2,newFileName3) VALUES(?,?,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setLong(1, fk);
				ps.setString(2, fileName1);
				ps.setString(3, fileName2);
				ps.setString(4, fileName3);
				ps.executeUpdate();
			}			
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}finally {
			resClose();
		}
		return (int) fk;//idx 값 반환
	}

	public ProductDTO detail(String prd_id) {
		ProductDTO dto = null;
		String sql="SELECT * FROM product WHERE prd_id = ?";
		try {
			ps  = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(prd_id));
			rs = ps.executeQuery();
			if(rs.next()) {
				upHit(prd_id);
				dto = new ProductDTO();
				dto.setPrd_Id(rs.getInt("prd_id"));
				dto.setPrd_Name(rs.getString("prd_name"));
				dto.setSell_Id(rs.getString("sell_id"));
				dto.setPrd_Price(rs.getInt("prd_price"));
				dto.setPrd_From(rs.getString("prd_from"));
				dto.setPrd_bHit(rs.getInt("prd_bHit")+1);
				dto.setPrd_Content(rs.getString("prd_content"));
				dto.setCateFirst_Id(rs.getString("cateF_id"));
				dto.setCateSecond_Id(rs.getString("cateS_id"));
				dto.setPrd_Count(rs.getInt("prd_count"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//조회수 올리기
	private void upHit(String prd_id) {
		String sql="UPDATE product SET prd_bHit = prd_bHit+1 WHERE prd_id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(prd_id));
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}

	public ProductDTO list(String prd_id) {
		ProductDTO dto = null;
		String sql="SELECT * From productimage WHERE prd_id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(prd_id));
			rs = ps.executeQuery();	
			if(rs.next()) {
				dto = new ProductDTO();	
				dto.setNewFileName1(rs.getString("newFileName1"));
				dto.setNewFileName2(rs.getString("newFileName2"));
				dto.setNewFileName3(rs.getString("newFileName3"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();//자원 반납
		}	
		return dto;		
	}

	public Integer update(String prd_Id, String prd_Name, String prd_Price, String prd_From, String prd_Count, String prd_Content) {
		int success = 0;
		String sql="UPDATE product SET prd_Name=?,prd_Price=?,prd_From=?,prd_Count=?,prd_Content=? WHERE prd_id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, prd_Name);
			ps.setString(2, prd_Price);
			ps.setString(3, prd_From);
			ps.setString(4, prd_Count);
			ps.setString(5, prd_Content);
			ps.setInt(6, Integer.parseInt(prd_Id));
			success = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			resClose();
		}
		return success;
	}
	
}
