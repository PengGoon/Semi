package com.mvc.dto;

import java.sql.Date;

public class UserDTO {
	private String user_Id;
	private String user_Pw;
	private String user_Name;
	private String user_Addr;
	private String user_Email;
	private String user_Phone;
	private Date user_Date;
	
	// user_Date는 sysdate로 처리하기때문에 getter/ setter 불필요
	

	public String getUser_Id() {
		return user_Id;
	}

	public Date getUser_date() {
		return user_Date;
	}

	public void setUser_date(Date user_Date) {
		this.user_Date = user_Date;
	}

	public void setUser_Id(String user_Id) {
		this.user_Id = user_Id;
	}
	public String getUser_Pw() {
		return user_Pw;
	}
	public void setUser_Pw(String user_Pw) {
		this.user_Pw = user_Pw;
	}
	public String getUser_Name() {
		return user_Name;
	}
	public void setUser_Name(String user_Name) {
		this.user_Name = user_Name;
	}
	public String getUser_Addr() {
		return user_Addr;
	}
	public void setUser_Addr(String user_Addr) {
		this.user_Addr = user_Addr;
	}
	public String getUser_Phone() {
		return user_Phone;
	}
	public void setUser_Phone(String user_Phone) {
		this.user_Phone = user_Phone;
	}
	public String getUser_Email() {
		return user_Email;
	}
	public void setUser_Email(String user_Email) {
		this.user_Email = user_Email;
	}

}
