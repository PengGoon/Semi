package com.mvc.service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.ProductDAO;
import com.mvc.dto.ProductDTO;

public class PurchaseService {

	public void purch(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//request 전달
		ProductUpload upload = new ProductUpload(request);
		//regist 메서드를 사용해서 사진 등록
		//상품명,판매자,판매가,원산지,물품수량,파일명을 받는다.ProductDTO
		ProductDTO dto = upload.regist();
		//DAO 에 dto 를 전달하여 DB 에 추가해 달라고 요청
		ProductDAO dao = new ProductDAO();
		int pk = dao.write(dto);
		//실패(글쓰기 폼)
		String page = "prd_writeForm.jsp";
		//결과에 따라 페이지 이동
		if(pk > 0) {
			//성공(상세보기) = 글쓰기 한 후 idx 반환
			//page = "detail?id="+pk;
			page = "index.jsp";
		}
		response.sendRedirect(page);
	}
}
