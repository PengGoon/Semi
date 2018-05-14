package com.mvc.dto;

import java.sql.Date;

public class ProductDTO {
	
	private int prd_Id;
	private String sell_Id;
	private String cateFirst_Id;
	private String cateSecond_Id;
	private String prd_Name;
	private int prd_Price;
	private int prd_Count;
	private String prd_From;
	private int prd_Soldout;
	private Date prd_Date;
	private int prd_bHit;
	private String newFileName1;
	private String newFileName2;
	private String newFileName3;
	private String prd_Content;
	
	public int getPrd_Id() {
		return prd_Id;
	}
	public void setPrd_Id(int prd_Id) {
		this.prd_Id = prd_Id;
	}
	public String getSell_Id() {
		return sell_Id;
	}
	public void setSell_Id(String sell_Id) {
		this.sell_Id = sell_Id;
	}
	public String getCateFirst_Id() {
		return cateFirst_Id;
	}
	public void setCateFirst_Id(String cateFirst_Id) {
		this.cateFirst_Id = cateFirst_Id;
	}
	public String getCateSecond_Id() {
		return cateSecond_Id;
	}
	public void setCateSecond_Id(String cateSecond_Id) {
		this.cateSecond_Id = cateSecond_Id;
	}
	public String getPrd_Name() {
		return prd_Name;
	}
	public void setPrd_Name(String prd_Name) {
		this.prd_Name = prd_Name;
	}
	public int getPrd_Price() {
		return prd_Price;
	}
	public void setPrd_Price(int prd_Price) {
		this.prd_Price = prd_Price;
	}
	public int getPrd_Count() {
		return prd_Count;
	}
	public void setPrd_Count(int prd_Count) {
		this.prd_Count = prd_Count;
	}
	public String getPrd_From() {
		return prd_From;
	}
	public void setPrd_From(String prd_From) {
		this.prd_From = prd_From;
	}
	public int getPrd_Soldout() {
		return prd_Soldout;
	}
	public void setPrd_Soldout(int prd_Soldout) {
		this.prd_Soldout = prd_Soldout;
	}
	public Date getPrd_Date() {
		return prd_Date;
	}
	public void setPrd_Date(Date prd_Date) {
		this.prd_Date = prd_Date;
	}
	public int getPrd_bHit() {
		return prd_bHit;
	}
	public void setPrd_bHit(int prd_bHit) {
		this.prd_bHit = prd_bHit;
	}
	public String getNewFileName1() {
		return newFileName1;
	}
	public void setNewFileName1(String newFileName1) {
		this.newFileName1 = newFileName1;
	}
	public String getNewFileName2() {
		return newFileName2;
	}
	public void setNewFileName2(String newFileName2) {
		this.newFileName2 = newFileName2;
	}
	public String getNewFileName3() {
		return newFileName3;
	}
	public void setNewFileName3(String newFileName3) {
		this.newFileName3 = newFileName3;
	}
	public String getPrd_Content() {
		return prd_Content;
	}
	public void setPrd_Content(String prd_Content) {
		this.prd_Content = prd_Content;
	}
}
