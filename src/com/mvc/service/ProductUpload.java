package com.mvc.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import com.mvc.dto.ProductDTO;
import com.oreilly.servlet.MultipartRequest;

public class ProductUpload {

	HttpServletRequest request = null;
	String savePath = null;
	
	public ProductUpload(HttpServletRequest request) {
		this.request = request;
		String root = request.getSession().getServletContext().getRealPath("/");
		savePath = root+"upload";
		System.out.println(savePath);
	}

	public ProductDTO regist() {
		ProductDTO dto = new ProductDTO();		
		//upload 폴더 없으면 만들어 준다.
		File dir = new File(savePath);
		if(!dir.exists()) {
			dir.mkdir();
		}
		try {
			//MultipartRequest(request, 저장경로,용량,인코딩,중복정책(생략)) 로 변환
			MultipartRequest multi = new MultipartRequest(request, savePath,1024*1024*10,"UTF-8");
			
			//MultipartRequest 에서 상품명,판매자,가격,원산지,조회수,수량 추출 해서 DTO 에 추가
			dto.setCateFirst_Id(multi.getParameter("cateFirst"));
			dto.setCateSecond_Id(multi.getParameter("cateSecond"));
			dto.setPrd_Name(multi.getParameter("prd_name"));
			dto.setSell_Id(multi.getParameter("sell_id"));
			dto.setPrd_Price(Integer.parseInt(multi.getParameter("prd_price")));
			dto.setPrd_From(multi.getParameter("prd_from"));
			dto.setPrd_bHit(0);
			dto.setPrd_Count(Integer.parseInt(multi.getParameter("prd_count")));
						
			//파일명 변경(업로드한 파일이 있을 경우만 실행)
			String oriFileName1 = multi.getFilesystemName("photo1");
			String oriFileName2 = multi.getFilesystemName("photo2");
			String oriFileName3 = multi.getFilesystemName("photo3");
			System.out.println(oriFileName1);
			System.out.println(oriFileName2);
			System.out.println(oriFileName3);
			String newFileName1 = productImageAdd(oriFileName1,dto);
			String newFileName2 = productImageAdd(oriFileName2,dto);
			String newFileName3 = productImageAdd(oriFileName3,dto);
			dto.setNewFileName1(newFileName1);
			dto.setNewFileName2(newFileName2);
			dto.setNewFileName3(newFileName3);
			
			dto.setPrd_content(multi.getParameter("prd_content"));
			
			//수정할 때 필요(idx 값이 넘어올 경우만 작동)
			/*String idx = multi.getParameter("idx");
			if(idx != null) {
				dto.setIdx(Integer.parseInt(idx));
			}*/
		} catch (IOException e) {
			e.printStackTrace();
		}			
		return dto;//DTO 반환
	}

	private String productImageAdd(String oriFileName, ProductDTO dto) {
		if(oriFileName != null) {
			//확장자 추출
			String ext = oriFileName.substring(oriFileName.indexOf("."));
			//새파일명 만들기(새파일명+확장자)
			String newFileName = System.currentTimeMillis()+ext;		
			//파일명 변경
			File oldFile = new File(savePath+"/"+oriFileName);
			File newFile = new File(savePath+"/"+newFileName);
			oldFile.renameTo(newFile);
			//변경된 파일명 DTO에 추가	
			//dto.setNewFileName(newFileName);
		}
		return oriFileName;			
	}

}
