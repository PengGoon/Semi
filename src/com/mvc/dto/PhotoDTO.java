package com.mvc.dto;

import java.sql.Date;

public class PhotoDTO {
	/*Product 에 있는 컬럼*/
	private int prd_id;
	private String sell_id;
	private String cateF_id;
	private String cateS_id;
	private String prd_name;
	private int prd_price;
	private int prd_count;
	private String prd_from;
	private int prd_soldout;
	private Date prd_date;
	private int prd_bHit;
	
	/*productImage 에 있는 컬럼*/
	private String newFileName;
	
	public int getPrd_id() {
		return prd_id;
	}
	public void setPrd_id(int prd_id) {
		this.prd_id = prd_id;
	}
	public String getSell_id() {
		return sell_id;
	}
	public void setSell_id(String sell_id) {
		this.sell_id = sell_id;
	}
	public String getCateF_id() {
		return cateF_id;
	}
	public void setCateF_id(String cateF_id) {
		this.cateF_id = cateF_id;
	}
	public String getCateS_id() {
		return cateS_id;
	}
	public void setCateS_id(String cateS_id) {
		this.cateS_id = cateS_id;
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
	public String getPrd_from() {
		return prd_from;
	}
	public void setPrd_from(String prd_from) {
		this.prd_from = prd_from;
	}
	public int getPrd_soldout() {
		return prd_soldout;
	}
	public void setPrd_soldout(int prd_soldout) {
		this.prd_soldout = prd_soldout;
	}
	public Date getPrd_date() {
		return prd_date;
	}
	public void setPrd_date(Date prd_date) {
		this.prd_date = prd_date;
	}
	public int getPrd_bHit() {
		return prd_bHit;
	}
	public void setPrd_bHit(int prd_bHit) {
		this.prd_bHit = prd_bHit;
	}
	
	public String getNewFileName() {
		return newFileName;
	}
	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}
}
