package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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

	//관리자 페이지 -> 회원 삭제 
	public int delete(String[] delList) {
		int delCnt = 0;
		String sql = "DELETE FROM UserDB WHERE user_Id=?";
		try {
			for(int i=0; i<delList.length;i++) {
				ps = conn.prepareStatement(sql);
				ps.setString(1, delList[i]);
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
	
	//회원탈퇴
		public int del(String loginUserId) {
			String sql = "DELETE FROM UserDB WHERE user_Id = ?";
			int success = 0;
			try {
				ps = conn.prepareStatement(sql);
				ps.setString(1, loginUserId);
				success = ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				resClose();
			}
			return success;
		}

    //구매 페이지에서 로그인 중인 회원 정보 뽑기
    public UserDTO user(String user_id) {
        UserDTO dto3 = null;
        String sql="SELECT user_Name,user_Phone,user_Addr FROM UserDB WHERE user_id = ?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, user_id);
            rs = ps.executeQuery();
            if(rs.next()) {
                dto3 = new UserDTO();
                dto3.setUser_Name(rs.getString("user_Name"));
                dto3.setUser_Phone(rs.getString("user_Phone"));
                dto3.setUser_Addr(rs.getString("user_Addr"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            resClose();//자원 반납
        }
        return dto3;    
    }
    //회원상세보기
    public UserDTO detailView(String loginId) {
    	UserDTO dto = null;
		String sql = "SELECT * FROM UserDB WHERE user_Id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, loginId);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new UserDTO();
				dto.setUser_Id("user_Id");
				dto.setUser_Pw(rs.getString("user_Pw"));
				dto.setUser_Name(rs.getString("user_Name"));
				dto.setUser_Addr(rs.getString("user_Addr"));
				dto.setUser_Email(rs.getString("user_Email"));
				dto.setUser_Phone(rs.getString("user_Phone"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return dto;
	}
    
    //회원수정
	public Integer update(String loginUserId, String user_Pw, String user_Name, String user_Addr, String user_Email,String user_Phone) 
	{
	
		int success = 0;
		String sql = "UPDATE UserDB SET  user_Pw=?, user_Name=?, user_Addr=?, user_Email=?, user_Phone=? WHERE  user_Id=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user_Pw);
			ps.setString(2, user_Name);
			ps.setString(3, user_Addr);
			ps.setString(4, user_Email);
			ps.setString(5, user_Phone );
			ps.setString(6, loginUserId);
			
			success = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return success;
	}
	
	//회원 비밀번호 체크
	public int chekPw(String loginUserId, String checkPw) {
		int result = 0;
		String sql = "select user_pw from UserDB where user_Id=? and user_Pw = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, loginUserId);
			ps.setString(2, checkPw);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				result = 1;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			resClose();
		}
		return result;
	}
	
	// 회원 ID 찾기
	public String findID(String find_name, String find_email) {
		String find_id = "해당 정보가 없습니다.";
	      String sql = "SELECT user_id from userDB WHERE user_name=? AND user_email=?";
	      try {
	         ps = conn.prepareStatement(sql);
	         ps.setString(1, find_name);
	         ps.setString(2, find_email);
	         rs = ps.executeQuery();
	         System.out.println(rs.getString("find_id"));
	         if (rs.next()) {
	        	 find_id = rs.getString("user_id");
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	         return null;
	      } finally {
	         resClose();
	      }
	      return find_id;
	}

	public boolean findPW(String search_id, String search_name, String search_email) {
		String search_pw = "";
	      boolean success = false;
	      String sql = "SELECT sell_pw from seller WHERE sell_id=? AND sell_name=? AND sell_email=?";
	      try {
	         ps = conn.prepareStatement(sql);
	         ps.setString(1, search_id);
	         ps.setString(2, search_name);
	         ps.setString(3, search_email);
	         rs = ps.executeQuery();
	         // System.out.println(rs.getString("sell_id"));
	         if (rs.next()) {
	            search_pw = rs.getString("sell_pw");

	            System.out.println(search_pw);

	            // 메일 보내기
	            sendEmail(search_pw, search_email);

	            success = true;
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	         return false;
	      } finally {
	         resClose();
	      }
	      return success;
	}

	private void sendEmail(String search_pw, String search_email) {
		String host = "smtp.naver.com";
	      final String user = "audwls7505";
	      final String password = "audwls1185";

	      String to = search_email;
	      Properties props = new Properties();
	      props.put("mail.smtp.host", host);
	      props.put("mail.smtp.auth", "true");
	      props.put("mail.smtp.ssl.enable", "true");
	      props.put("mail.smtp.ssl.trust", "smtp.naver.com");

	      Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	         protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(user, password);
	         }
	      });

	      // Compose the message
	      try {
	         MimeMessage message = new MimeMessage(session);
	         message.setFrom(new InternetAddress(user));
	         message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

	         // Subject
	         message.setSubject("Mar-KH-et 비밀번호 찾기 요청 응답 메일입니다.");

	         // Text
	         message.setText("찾으시는 비밀번호는 < " + search_pw + " > 입니다.");

	         // send the message
	         Transport.send(message);
	         System.out.println("message sent successfully...");

	      } catch (MessagingException e) {
	         e.printStackTrace();
	      }
	   }
	
	
	

}
