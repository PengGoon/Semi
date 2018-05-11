package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
			ps.setString(8, dto.getPrd_content());
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
				prd_imageAdd(fileName1,fk);
				prd_imageAdd(fileName2,fk);
				prd_imageAdd(fileName3,fk);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}finally {
			resClose();
		}
		return (int) fk;//idx 값 반환
	}

	private void prd_imageAdd(String fileName, long fk) throws SQLException {
		if(fileName!=null) {
			//idx 를 이용해서 photo 테이블에 데이터 넣기
			String sql = "INSERT INTO ProductImage (prd_id,newFileName) VALUES(?,?)";
			ps = conn.prepareStatement(sql);
			ps.setLong(1, fk);
			ps.setString(2, fileName);
			ps.executeUpdate();
		}
	}

}
