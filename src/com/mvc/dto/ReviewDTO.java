package com.mvc.dto;

import java.sql.Date;

public class ReviewDTO {
	
	//리뷰번호, 구매자, 리뷰제목, 리뷰 내용, 리뷰 작성일, 리뷰 조회수...등등
	private int review_id;
	private int prd_id;
	private String user_id;
	private String review_title;
	private String review_content;
	private Date review_date; 
	private String newFileName;
	private int bHit;
	private String prd_Name;
	

	public String getPrd_Name() {
		return prd_Name;
	}
	public void setPrd_Name(String prd_Name) {
		this.prd_Name = prd_Name;
	}
	public int getbHit() {
		return bHit;
	}
	public void setbHit(int bHit) {
		this.bHit = bHit;
	}

	
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
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
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public String getNewFileName() {
		return newFileName;
	}
	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}
	
}
