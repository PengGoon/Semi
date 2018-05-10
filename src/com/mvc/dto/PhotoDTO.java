package com.mvc.dto;

public class PhotoDTO {
	/*bbs 에 있는 컬럼*/
	private int prd_id;
	/*photo 에 있는 컬럼*/
	private String newFileName;
	
	public int getprd_id() {
		return prd_id;
	}
	public void setprd_id(int prd_id) {
		this.prd_id = prd_id;
	}
	public String getNewFileName() {
		return newFileName;
	}
	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}
}
