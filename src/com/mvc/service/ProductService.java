package com.mvc.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.ProductDAO;
import com.mvc.dto.PhotoDTO;
import com.mvc.dto.ProductDTO;

public class ProductService {

	public void list(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
	}

	public void detail(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//DB 에 개별 데이터 요청
		ProductDAO dao = new ProductDAO();
		ProductDTO dto = dao.detail(request.getParameter("prd_id"));
		request.setAttribute("info", dto);
		dto = dao.list(request.getParameter("prd_id"));
		request.setAttribute("list", dto);
		//특정한 페이지로 이동		
		RequestDispatcher dis = request.getRequestDispatcher("prd_detailForm.jsp");
		dis.forward(request, response);
	}

	public void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
	}

	public void write(HttpServletRequest request, HttpServletResponse response) throws IOException {
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

	public void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
	}

	public void updateView(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
	}

}
