package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mvc.dto.PhotoDTO;

public class PhotoDAO {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public PhotoDAO() {
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//리스트 불러오기
		public ArrayList<PhotoDTO> list(String cateS_id) {		
			ArrayList<PhotoDTO> list = new ArrayList<PhotoDTO>();
			try {
				//쿼리 와 ps 준비
				String sql = "SELECT prd_id, prd_name FROM Product WHERE cateS_id=?";
				ps = conn.prepareStatement(sql);//쿼리 실행
				ps.setString(1, cateS_id);
				rs = ps.executeQuery();
				while(rs.next()) {//rs 에서 값 가져와 dto 담기
					PhotoDTO dto = new PhotoDTO();	
					dto.setPrd_name(rs.getString("prd_name"));
					String newFileName = fileNameCall(rs.getInt("prd_id"));
					if(newFileName != null) {
						dto.setNewFileName(newFileName);
					}
					System.out.println(dto.getPrd_name());
					System.out.println(dto.getNewFileName());
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
		public String fileNameCall(int prd_id) {		
			String sql="SELECT newFileName1 From productimage WHERE prd_id = ?";
			String fileName = null;
			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, prd_id);
				ResultSet rs = ps.executeQuery();
				fileName = rs.next() ? rs.getString("newFileName1") : null;			
			} catch (SQLException e) {
				e.printStackTrace();
			}		
			return fileName;
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

		/*public PhotoDTO detail(String prd_id) {
			PhotoDTO dto = null;
			String sql="SELECT * FROM ProductImage WHERE prd_id = ?";
			try {
				ps  = conn.prepareStatement(sql);
				ps.setInt(1, Integer.parseInt(prd_id));
				rs = ps.executeQuery();
				if(rs.next()) {
					dto = new PhotoDTO();
					dto.setPrd_id(rs.getInt("prd_id"));
				}
				//파일명 추출
				String newFileName = fileNameCall(dto.getPrd_id());
				if(newFileName != null) {
					dto.setNewFileName(newFileName);
				}			
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				resClose();
			}
			return dto;
		}*/
		
		/*private String fileNameCall(int prd_id) {		
			String sql="SELECT newFileName From ProductImage WHERE prd_id = ?";
			String fileName = null;
			try {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, prd_id);
				rs = ps.executeQuery();
				fileName = rs.next() ? rs.getString("newFileName") : null;			
			} catch (SQLException e) {
				e.printStackTrace();
			}		
			return fileName;
		}*/

}