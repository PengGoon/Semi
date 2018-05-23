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

import com.mvc.dto.MemberDTO;

public class MemberDAO {
   
   	
   Connection conn = null;
   PreparedStatement ps = null;
   ResultSet rs = null;

   public MemberDAO() {// connection 연결
      try {
         Context ctx = new InitialContext();
         DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle");
         conn = ds.getConnection();
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   // 중복 체크
   public boolean overlay(String id) {
      boolean over = false;
      String sql = "SELECT sell_id FROM seller WHERE sell_id=?";
      try {
         ps = conn.prepareStatement(sql);
         ps.setString(1, id);
         rs = ps.executeQuery();
         over = rs.next();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         resClose();
      }
      return over;
   }

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

   // 회원 가입 메서드
   public int join(MemberDTO dto) {
      int success = 0;
      System.out.println("dto.getFilename() : " + dto.getFilename());
      String sql = "INSERT INTO seller VALUES(?,?,?,?,?,?,?,0,sysdate)";
      try {
         ps = conn.prepareStatement(sql);
         ps.setString(1, dto.getId());
         ps.setString(2, dto.getPw());
         ps.setString(3, dto.getName());
         ps.setString(4, dto.getAddr());
         ps.setString(5, dto.getEmail());
         ps.setString(6, dto.getPhone());
         ps.setString(7, dto.getFilename());
         success = ps.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         resClose();
      }
      return success;
   }

   // 로그인 메서드
   public boolean login(String id, String pw) {
      boolean success = false;
      String sql = "SELECT sell_id FROM seller WHERE sell_id=? AND sell_pw=?";
      try {
         ps = conn.prepareStatement(sql);
         ps.setString(1, id);
         ps.setString(2, pw);
         rs = ps.executeQuery();
         success = rs.next();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         resClose();
      }
      return success;
   }

   public String searchID(String search_name, String search_email) {
      String search_id = "해당 정보가 없습니다.";
      String sql = "SELECT sell_id from seller WHERE sell_name=? AND sell_email=?";
      try {
         ps = conn.prepareStatement(sql);
         ps.setString(1, search_name);
         ps.setString(2, search_email);
         rs = ps.executeQuery();
//         System.out.println(rs.getString("sell_id"));
         if (rs.next()) {
            search_id = rs.getString("sell_id");
         }
      } catch (SQLException e) {
         e.printStackTrace();
         return null;
      } finally {
         resClose();
      }
      return search_id;
   }

   public boolean searchPW(String search_id, String search_name, String search_email) {

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

   public void send_no(String seller_mail, String no_msg) {
      String host = "smtp.naver.com";
      final String user = "audwls7505";
      final String password = "audwls1185";

      String to = seller_mail;
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
         message.setSubject("Mar-KH-et 판매자 등록요청이 거절 되었습니다.");

         // Text
         message.setText("거절 사유 : " + no_msg);

         // send the message
         Transport.send(message);
         System.out.println("message sent successfully...");

      } catch (MessagingException e) {
         e.printStackTrace();
      }
      
   }
   
   public void sendEmail(String search_pw, String search_email) {
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

   public MemberDTO detailView(String loginId) {

      MemberDTO dto = null;
      String sql = "SELECT * FROM seller WHERE sell_id=?";
      try {
         ps = conn.prepareStatement(sql);
         ps.setString(1, loginId);
         rs = ps.executeQuery();
         if (rs.next()) {
            dto = new MemberDTO();
            dto.setId(rs.getString("sell_id"));
            dto.setPw(rs.getString("sell_pw"));
            dto.setPwchk("");
            dto.setName(rs.getString("sell_name"));
            dto.setAddr(rs.getString("sell_addr"));
            dto.setEmail(rs.getString("sell_email"));
            dto.setPhone(rs.getString("sell_phone"));
            dto.setFilename(rs.getString("sell_img"));
            dto.setSell_yn(rs.getInt("sell_yn"));
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         resClose();
      }
      return dto;
   }

   public Integer update(String login_id, String sell_pw, String sell_name, String sell_addr, String sell_email,
         String sell_phone, String sell_img) {

      int success = 0;
      String sql = "UPDATE seller SET sell_pw=?, sell_name=?, sell_addr=?, sell_email=?, sell_phone=?, sell_img=? WHERE sell_id=?";
      try {
         ps = conn.prepareStatement(sql);
         ps.setString(1, sell_pw);
         ps.setString(2, sell_name);
         ps.setString(3, sell_addr);
         ps.setString(4, sell_email);
         ps.setString(5, sell_phone);
         ps.setString(6, sell_img);
         ps.setString(7, login_id);
         success = ps.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         resClose();
      }
      return success;
   }

   public int chekPw(String login_id, String checkPw) {
      int result = 0;
      String sql = "select sell_pw from seller where sell_id=? and sell_pw = ?";
      try {
         ps = conn.prepareStatement(sql);
         ps.setString(1, login_id);
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

   public int request(String loginId) {
      int result = 0;
      
      String sql = "UPDATE seller SET sell_yn=1 WHERE sell_id=?";
      try {
         ps = conn.prepareStatement(sql);
         ps.setString(1, loginId);
         result = ps.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
         return 0;
      }finally {
         resClose();
      }
      return result;
   }

   public ArrayList<MemberDTO> list() {
      ArrayList<MemberDTO> list = new ArrayList<>();
      String sql="SELECT * FROM seller ORDER BY reg_date DESC";
      try {
         ps = conn.prepareStatement(sql);
         rs = ps.executeQuery();
         while(rs.next()) {
            MemberDTO dto = new MemberDTO();
            dto.setId(rs.getString("sell_id"));
            dto.setEmail(rs.getString("sell_email"));
            dto.setName(rs.getString("sell_name"));
            dto.setFilename(rs.getString("newfilename"));
            dto.setSell_yn(rs.getInt("sell_YN"));
            dto.setAddr(rs.getString("sell_addr"));
            dto.setPhone(rs.getString("sell_phone"));
            dto.setReg_date(rs.getString("reg_date"));
            list.add(dto);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         resClose();
      }
      return list;
   }

   public int acptok(String seller_id) {
      String sql = "UPDATE seller set sell_yn=2 where sell_id=?";
      int result = 0;
      try {
         ps =conn.prepareStatement(sql);
         ps.setString(1,seller_id);
         result = ps.executeUpdate();
      } catch (SQLException e) {
         return 0;
      }finally {
         resClose();
      }
      return result;
   }

   public int acptno(String seller_id, String seller_mail, String no_msg) {
      String sql = "UPDATE seller set sell_yn=0 where sell_id=?";
      int result = 0;
      try {
         ps =conn.prepareStatement(sql);
         ps.setString(1,seller_id);
         result = ps.executeUpdate();
         
         if(result>0) {
            send_no(seller_mail, no_msg);
         }
      } catch (SQLException e) {
         return 0;
      }finally {
         resClose();
      }
      return result;
   }

   public int delete(String[] delList) {
      String sql="DELETE FROM seller WHERE sell_id = ?";
      int delCnt = 0;
      try {
         for(int i=0;i<delList.length; i++) {
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

}