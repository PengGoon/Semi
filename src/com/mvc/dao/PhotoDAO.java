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
		public ArrayList<PhotoDTO> list() {		
			ArrayList<PhotoDTO> list = new ArrayList<PhotoDTO>();		
			try {
				//쿼리 와 ps 준비
				String sql = "SELECT NEWFILENAME FROM ProductImage WHERE prd_id = ?";
				ps = conn.prepareStatement(sql);//쿼리 실행			
				rs = ps.executeQuery();
				while(rs.next()) {//rs 에서 값 가져와 dto 담기
					PhotoDTO dto = new PhotoDTO();				
					dto.setprd_id(rs.getInt("prd_id"));
					list.add(dto);//dto 를 list 에 담기
				}			
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				resClose();//자원 반납
			}	
			return list;
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
}