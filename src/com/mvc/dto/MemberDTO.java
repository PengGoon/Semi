package com.mvc.dto;
public class MemberDTO {

   private String id;
   private String pw;
   private String pwchk;
   private String addr;
   private String email;
   private String phone;
   private String filename;
   private String name;
   private int sell_yn;
   private String reg_date;
   
   public String getReg_date() {
      return reg_date;
   }
   public void setReg_date(String reg_date) {
      this.reg_date = reg_date;
   }
   public int getSell_yn() {
      return sell_yn;
   }
   public void setSell_yn(int sell_yn) {
      this.sell_yn = sell_yn;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getPw() {
      return pw;
   }
   public void setPw(String pw) {
      this.pw = pw;
   }
   public String getPwchk() {
      return pwchk;
   }
   public void setPwchk(String pwchk) {
      this.pwchk = pwchk;
   }
   public String getAddr() {
      return addr;
   }
   public void setAddr(String addr) {
      this.addr = addr;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getPhone() {
      return phone;
   }
   public void setPhone(String phone) {
      this.phone = phone;
   }
   public String getFilename() {
      return filename;
   }
   public void setFilename(String filename) {
      this.filename = filename;
   }
   
   
}