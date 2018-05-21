package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.dto.ProductDTO;

import com.mvc.dto.ProductDTO2;
import com.mvc.dto.PurchaseDTO;
import com.mvc.dto.UserDTO;


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

	public void resClose() {
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

	public ArrayList<ProductDTO> sellprdlist(String sell_id) {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "SELECT * FROM product WHERE sell_id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, sell_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setPrd_Id(rs.getInt("prd_id"));
				dto.setPrd_Name(rs.getString("prd_name"));
				dto.setPrd_Price(rs.getInt("prd_price"));
				dto.setPrd_Count(rs.getInt("prd_count"));
				dto.setPrd_Date(rs.getDate("prd_date"));
				dto.setPrd_bHit(rs.getInt("prd_bHit"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			resClose();
		}
		return list;
	}

	public int delete(String[] delList) {
		String sql = "DELETE FROM product WHERE prd_id=?";
		int delCnt=0;
		try {
			for(int i=0; i<delList.length; i++) {
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

	public ArrayList<ProductDTO> prdSearch(String prdSearch) {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		try {
			//쿼리 와 ps 준비
			String sql = "SELECT * FROM product WHERE cateF_id LIKE ? OR cateS_id LIKE ? OR prd_name LIKE ?";
			ps = conn.prepareStatement(sql);//쿼리 실행
			ps.setString(1, "%"+prdSearch+"%");
			ps.setString(2, "%"+prdSearch+"%");
			ps.setString(3, "%"+prdSearch+"%");
			rs = ps.executeQuery();
			while(rs.next()) {//rs 에서 값 가져와 dto 담기
				ProductDTO dto = new ProductDTO();	
				dto.setPrd_Id(rs.getInt("prd_id"));
				dto.setPrd_Name(rs.getString("prd_name"));
				//dto.setSell_Id(rs.getString("sell_id"));
				dto.setPrd_Price(Integer.parseInt(rs.getString("prd_price")));
				//dto.setPrd_From(rs.getString("prd_from"));
				dto.setPrd_bHit(Integer.parseInt(rs.getString("prd_bHit")));
				dto.setPrd_Count(Integer.parseInt(rs.getString("prd_count")));
				String[] fileName = fileNameCall(rs.getInt("prd_id"));
				dto.setNewFileName1(fileName[0]);
				list.add(dto);//dto 를 list 에 담기
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();//자원 반납
		}	
		return list;
	}
	
	//게시글에 해당하는 파일명 추출
	public String[] fileNameCall(int prd_id) {		
		String sql="SELECT * From productimage WHERE prd_id = ?";
		String[] fileName = new String[3];
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, prd_id);
			ResultSet rs = ps.executeQuery();
			fileName[0] = rs.next() ? rs.getString("newFileName1") : null;
			fileName[1] = rs.next() ? rs.getString("newFileName2") : null;		
			fileName[2] = rs.next() ? rs.getString("newFileName3") : null;		
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return fileName;
	}

	public Integer update(ProductDTO dto) {
		int success = 0;
		String sql="UPDATE product SET prd_Name=?,prd_Price=?,prd_From=?,prd_Count=?,prd_Content=? WHERE prd_id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getPrd_Name());
			ps.setInt(2, dto.getPrd_Price());
			ps.setString(3, dto.getPrd_From());
			ps.setInt(4, dto.getPrd_Count());
			ps.setString(5, dto.getPrd_Content());
			ps.setInt(6, dto.getPrd_Id());
			success = ps.executeUpdate();
			
			sql = "UPDATE ProductImage SET newFileName1=?,newFileName2=?,newFileName3=? WHERE prd_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getNewFileName1());
			ps.setString(2, dto.getNewFileName2());
			ps.setString(3, dto.getNewFileName3());
			ps.setInt(4, dto.getPrd_Id());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			resClose();
		}
		return success;
	}

	public ArrayList<ProductDTO> searchSort(String data, String content) {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = null;
		if(data.equals("조회수 순")) {
			sql = "SELECT * FROM (SELECT * FROM product WHERE cateF_id LIKE ? OR cateS_id LIKE ? OR prd_name LIKE ?) ORDER BY prd_bHit DESC";
		}else if(data.equals("낮은 가격 순")) {
			sql = "SELECT * FROM (SELECT * FROM product WHERE cateF_id LIKE ? OR cateS_id LIKE ? OR prd_name LIKE ?) ORDER BY prd_price ASC";
		}else if(data.equals("높은 가격 순")) {
			sql = "SELECT * FROM (SELECT * FROM product WHERE cateF_id LIKE ? OR cateS_id LIKE ? OR prd_name LIKE ?) ORDER BY prd_price DESC";
		}else if(data.equals("전체 품목")) {
			sql = "SELECT * FROM (SELECT * FROM product WHERE cateF_id LIKE ? OR cateS_id LIKE ? OR prd_name LIKE ?) product";
		}
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+content+"%");
			ps.setString(2, "%"+content+"%");
			ps.setString(3, "%"+content+"%");
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setPrd_Id(rs.getInt("prd_id"));
				dto.setPrd_Name(rs.getString("prd_name"));
				dto.setPrd_Price(rs.getInt("prd_price"));
				dto.setPrd_Count(rs.getInt("prd_count"));
				dto.setPrd_Date(rs.getDate("prd_date"));
				dto.setPrd_bHit(rs.getInt("prd_bHit"));
				String[] fileName = fileNameCall(rs.getInt("prd_id"));
				dto.setNewFileName1(fileName[0]);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<ProductDTO> mainList(String state) {
		ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = null;
		if(state.equals("bHit")) {
			sql = "SELECT * FROM (SELECT * FROM product ORDER BY prd_bHit DESC) WHERE ROWNUM <=5";
		}else if(state.equals("date")){
			sql = "SELECT * FROM (SELECT * FROM product ORDER BY prd_date DESC) WHERE ROWNUM <=5";
		}else if(state.equals("bHitAll")){
			sql = "SELECT * FROM product ORDER BY prd_bHit DESC";
		}else if(state.equals("dateAll")){
			sql = "SELECT * FROM product ORDER BY prd_date DESC";
		}
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setPrd_Id(rs.getInt("prd_id"));
				dto.setPrd_Name(rs.getString("prd_name"));
				dto.setPrd_Price(rs.getInt("prd_price"));
				dto.setPrd_bHit(rs.getInt("prd_bHit"));
				dto.setPrd_Date(rs.getDate("prd_Date"));
				String[] fileName = fileNameCall(rs.getInt("prd_id"));
				dto.setNewFileName1(fileName[0]);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<PurchaseDTO> delieveryList(int prd_id) {
		ArrayList<PurchaseDTO> list = new ArrayList<PurchaseDTO>();
		String sql = "SELECT * FROM purchase p, userDB u WHERE p.user_id=u.user_id AND prd_id=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, prd_id);
			rs = ps.executeQuery();
			while (rs.next()) {
				PurchaseDTO dto = new PurchaseDTO();
				dto.setPur_id(rs.getInt("pur_id"));
				dto.setPrd_id(rs.getInt("prd_id"));
				dto.setPur_count(rs.getInt("pur_count"));
				dto.setPur_state(rs.getString("pur_state"));
				dto.setPur_delievery(rs.getInt("pur_delievery"));
				dto.setPur_date(rs.getDate("pur_date"));
				
				dto.setUser_Name(rs.getString("user_name"));
				dto.setUser_Phone(rs.getString("user_phone"));
				dto.setUser_Addr(rs.getString("user_addr"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			resClose();
		}
		return list;
	}

	public ArrayList<PurchaseDTO> delievery(int pur_id) {
		ArrayList<PurchaseDTO> list = new ArrayList<PurchaseDTO>();
		String sql = "UPDATE purchase SET pur_delievery=? WHERE pur_id=?";
		Random random = new Random();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, random.nextInt(100000000));
			ps.setInt(2, pur_id);
			ps.executeUpdate();
			
			sql = "SELECT pur_delievery FROM purchase WHERE pur_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pur_id);
			rs = ps.executeQuery();
			while(rs.next()) {
				PurchaseDTO dto = new PurchaseDTO();
				dto.setPur_delievery(rs.getInt("pur_delievery"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			resClose();
		}
		return list;
	}
}
