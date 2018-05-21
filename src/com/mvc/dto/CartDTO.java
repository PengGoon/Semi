package com.mvc.dto;

public class CartDTO {
	private int cart_id;
	private int prd_id;
	private String user_id;
	private String prd_name;
	private int prd_price;
	private int prd_count;
	private String newFileName;
	private String sell_Id;
	
	public String getSell_Id() {
		return sell_Id;
	}
	public void setSell_Id(String sell_Id) {
		this.sell_Id = sell_Id;
	}
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getPrd_id() {
		return prd_id;
	}
	public void setPrd_id(int prd_id) {
		this.prd_id = prd_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public int getPrd_count() {
		return prd_count;
	}
	public void setPrd_count(int prd_count) {
		this.prd_count = prd_count;
	}
	public String getNewFileName() {
		return newFileName;
	}
	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}
}
