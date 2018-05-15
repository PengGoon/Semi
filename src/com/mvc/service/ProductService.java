package com.mvc.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mvc.dao.ProductDAO;
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
		request.setCharacterEncoding("UTF-8");
		String prd_Id = request.getParameter("prd_Id");
		String prd_Name = request.getParameter("prd_Name");
		String prd_Price = request.getParameter("prd_Price");
		String prd_From = request.getParameter("prd_From");
		String prd_Count = request.getParameter("prd_Count");
		String prd_Content = request.getParameter("prd_Content");
		ProductDAO dao = new ProductDAO();
		Gson json = new Gson();
		HashMap<String, Integer> map = new HashMap<>();
		map.put("success", dao.update(prd_Id,prd_Name,prd_Price,prd_From,prd_Count,prd_Content));
		String obj = json.toJson(map);
		response.getWriter().println(obj);
	}

	public void updateView(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
	}

	public void sellerdetail(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//DB 에 개별 데이터 요청
		ProductDAO dao = new ProductDAO();
		ProductDTO dto = dao.detail(request.getParameter("prd_id"));
		request.setAttribute("info", dto);
		dto = dao.list(request.getParameter("prd_id"));
		request.setAttribute("list", dto);
		//특정한 페이지로 이동		
		RequestDispatcher dis = request.getRequestDispatcher("prd_sellerDetail.jsp");
		dis.forward(request, response);
	}

	public void sellprdlist(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//DB 이용 해서 데이터 가져오기
		ProductDAO dao = new ProductDAO();
		ArrayList<ProductDTO> list = dao.sellprdlist(request.getParameter("sell_id"));
		//로그인 상태
		//String loginId = (String) request.getSession().getAttribute("loginId");

		//response 반환
		Gson json = new Gson();
		HashMap<String, Object> map = new HashMap<>();
		/*
		if(loginId != null) {
			map.put("login", true);
		}else {
			map.put("login", false);
		}
		*/
		map.put("list",list);
		String obj = json.toJson(map);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().println(obj);
	}

	public void prdDel(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String[] delList= request.getParameterValues("delList[]");
		System.out.println(delList.length);
		//복수개의 데이터를 지우기
		//1. 지울 수 만큼 쿼리를 반복
		//2. DELETE FROM bbs WHERE idx=? OR idx=?
		ProductDAO dao = new ProductDAO();
		boolean success = false;
		if(dao.delete(delList) == delList.length) {
			//성공 처리
			success = true;
		}
		Gson json = new Gson();
		HashMap<String, Boolean> map = new HashMap<>();
		map.put("success", success);
		String obj = json.toJson(map);
		response.getWriter().println(obj);
	}

}
