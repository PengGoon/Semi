package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.sql.DataSource;

import org.apache.catalina.connector.Request;
import org.apache.catalina.connector.Response;

import com.mvc.dto.ProductDTO;
import com.mvc.dto.PurchaseDTO;

public class PurchaseDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	Request request = null;
	Response response = null;

	public PurchaseDAO() {
		try {
			System.out.println("객체화");
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void resClose() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public int purch(PurchaseDTO dto) {
		ProductDTO dto1 = null;
		int success = 0;
		int cnt = 0;

		String sql = "INSERT INTO Purchase(pur_id, user_id, prd_id, sell_id, pur_count, pur_date, pur_state, pur_delievery) "
				+ "VALUES(product_seq.NEXTVAL,?,?,?,?,SYSDATE,?,?)";
		long fk = 0;
		try {
			// ojdbc 8 버전 이상에서 가능
			// 2번째 인자 값은 값을 넣고 반환 해 줄 컬럼
			// new String[]{"반환받을 컬럼명"} 또는 new int[]{반환받을 컬럼번호}
			// ps = conn.prepareStatement(sql, new String[] {"prd_id"});
			ps = conn.prepareStatement(sql);
			// product 테이블에 데이터 추가
			ps.setString(1, dto.getUser_id());
			ps.setInt(2, dto.getPrd_id());
			ps.setString(3, dto.getSell_Id());
			ps.setInt(4, dto.getPur_count());
			cnt = dto.getPur_count();
			ps.setString(5, dto.getPur_state());
			// ps.setInt(6, dto.getPur_delievery());
			ps.setInt(6, 0);
			success = ps.executeUpdate();
			/*
			 * String fileName1 = dto.getNewFileName1(); String fileName2 =
			 * dto.getNewFileName2(); String fileName3 = dto.getNewFileName3();
			 * System.out.println("fileName : "+fileName1);
			 * System.out.println("fileName : "+fileName2);
			 * System.out.println("fileName : "+fileName3); if(rs.next()) { fk =
			 * rs.getLong(1);//넣은 값의 idx 받아오기 sql =
			 * "INSERT INTO ProductImage (prd_id,newFileName1,newFileName2,newFileName3) VALUES(?,?,?,?)"
			 * ; ps = conn.prepareStatement(sql); ps.setLong(1, fk); ps.setString(2,
			 * fileName1); ps.setString(3, fileName2); ps.setString(4, fileName3);
			 * ps.executeUpdate(); }
			 */
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		} finally {
			resClose();
		}
		return success; // idx 값 반환
	}

	public ArrayList<PurchaseDTO> list(String loginUserId) {
		ArrayList<PurchaseDTO> list = new ArrayList<PurchaseDTO>();
		String sql = "SELECT p.prd_id, p.pur_id,t.prd_name,p.pur_count,t.prd_price,p.pur_date,p.pur_state FROM Purchase P,Product t WHERE p.prd_id=t.prd_id AND user_id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, loginUserId);
			rs = ps.executeQuery();
			System.out.println(loginUserId);
			while (rs.next()) {
				PurchaseDTO dto = new PurchaseDTO();
				ProductDAO dao = new ProductDAO();
				dto.setPur_id(rs.getInt("pur_id"));// 상품고유번호 됨 됨
				dto.setPrd_id(rs.getInt("prd_id"));//
				dto.setPur_count(rs.getInt("pur_count"));// 수량
				dto.setPur_date(rs.getDate("pur_date"));// 구매일
				dto.setPur_state(rs.getString("pur_state"));// 배송
				dto.setPrd_name(rs.getString("prd_name")); // 안됨
				dto.setPrd_price(rs.getInt("prd_price"));
				String[] fileName = dao.fileNameCall(rs.getInt("prd_id"));
				dto.setNewFileName1(fileName[0]);
				dao.resClose();
				list.add(dto);
				System.out.println(rs.getInt("prd_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			resClose();
		}
		System.out.println("ulist dao 확인");
		return list;
	}

	// 삭제
	public int delete(String[] delList) {
		String sql = "DELETE FROM Purchase WHERE pur_id = ?";
		int delCnt = 0;
		try {
			for (int i = 0; i < delList.length; i++) {
				ps = conn.prepareStatement(sql);
				ps.setString(1, (delList[i]));
				// ps.setInt(1, Integer.parseInt(delList[i]));
				delCnt += ps.executeUpdate();
				ps.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			resClose();
		}
		return delCnt;
	}

	// 구매시 상품수량 감소
	public String countdown(int pur_count, int prd_id, int cnt) {
		String msg = "상품 수량 부족";
		try {
			String sql = "UPDATE Product SET prd_count=? WHERE prd_id=?";
			ps = conn.prepareStatement(sql);
			if (cnt - pur_count >0) {
				ps.setInt(1, cnt - pur_count);
				ps.setLong(2, prd_id);
				ps.executeUpdate();
				msg = "상품 구매에 성공하였습니다.";
			} else {
				ps.setInt(1, cnt);
				ps.setLong(2, prd_id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			resClose();
		}
		return msg;
	}

	public int countprint(int prd_id) {
		int cnt = 0;
		try {
			String sql = "SELECT prd_count FROM product WHERE prd_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, prd_id);
			rs = ps.executeQuery();
			if (rs.next()) {
				ProductDTO dto = new ProductDTO();
				cnt = rs.getInt("prd_count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			resClose();
		}
		return cnt;
	}

	public void cartDel(int cart_id) {
		try {
			String sql = "DELETE FROM cart WHERE cart_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, cart_id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			resClose();
		}
	}

}
