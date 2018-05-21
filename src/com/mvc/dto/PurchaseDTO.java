package com.mvc.dto;

import java.sql.Date;

public class PurchaseDTO {
	private int pur_id;
	private String user_id;
	private int prd_id;
	private String sell_Id;
	private int pur_count;
	private Date pur_date;
	private String pur_state;
	private int pur_delievery;
	private String prd_name;
	private int prd_price;
	private String newFileName1;
	
	
	
	
	public String getNewFileName1() {
		return newFileName1;
	}
	public void setNewFileName1(String newFileName1) {
		this.newFileName1 = newFileName1;
	}
	public String getPrd_name() {
		return prd_name;
	}
	public void setPrd_name(String prd_name) {
		this.prd_name = prd_name;
	}
	
	public int getPrd_price() {
		return prd_price;
	}
	public void setPrd_price(int prd_price) {
		this.prd_price = prd_price;
	}
	public int getPur_id() {
		return pur_id;
	}
	public void setPur_id(int pur_id) {
		this.pur_id = pur_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getPrd_id() {
		return prd_id;
	}
	public void setPrd_id(int prd_id) {
		this.prd_id = prd_id;
	}
	public String getSell_Id() {
		return sell_Id;
	}
	public void setSell_Id(String sell_Id) {
		this.sell_Id = sell_Id;
	}
	public int getPur_count() {
		return pur_count;
	}
	public void setPur_count(int pur_count) {
		this.pur_count = pur_count;
	}
	public Date getPur_date() {
		return pur_date;
	}
	public void setPur_date(Date pur_date) {
		this.pur_date = pur_date;
	}
	public String getPur_state() {
		return pur_state;
	}
	public void setPur_state(String pur_state) {
		this.pur_state = pur_state;
	}
	public int getPur_delievery() {
		return pur_delievery;
	}
	public void setPur_delievery(int pur_delievery) {
		this.pur_delievery = pur_delievery;
	}
}
