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


import com.mvc.dto.ProductDTO2;
import com.mvc.dto.PurchaseDTO;


public class ProductService {

	

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
			page = "index.jsp";
		}
		response.sendRedirect(page);
	}

	public void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ProductUpload upload = new ProductUpload(request);
		ProductDTO dto = upload.regist();
		ProductDAO dao = new ProductDAO();
		Gson json = new Gson();
		HashMap<String, Integer> map = new HashMap<>();

		String[] oldFileName = null;
		System.out.println("새파일:"+dto.getNewFileName1());
		if(dto.getNewFileName1() != null) {//새로 올리는 파일이 있을경우
			//올린파일이 있다는것은 기존파일을 지워야 하는 것을 의미하므로 파일명을 알아야한다.
			//oldFileName = dao.fileNameCall(dto.getPrd_Id());
			oldFileName = dao.fileNameCall(dto.getPrd_Id());
			System.out.println("배열:"+oldFileName[0]);
			//파일명을 DB에서 수정
			//dao.fileNameUpdate(dto.getPrd_Id(),dto.getNewFileName1(),dto.getNewFileName2(),dto.getNewFileName3(),oldFileName);
			//기존 파일을 폴더에서 삭제
			//upload.del(oldFileName);
		}
		int success = dao.update(dto);
		String page = "./prd_sellerdetail?prd_id="+dto.getPrd_Id();
		if(success > 0) {
			//성공(상세보기) = 글쓰기 한 후 idx 반환
			page = "./prd_sellerdetail?prd_id="+dto.getPrd_Id();
		}
		response.sendRedirect(page);
	}

	public void updateView(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
	}

	public void sellerdetail(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		//DB 에 개별 데이터 요청
		ProductDAO dao = new ProductDAO();
		System.out.println("상품번호:"+request.getParameter("prd_id"));
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

	public void prdSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//DB 에 개별 데이터 요청
		ProductDAO dao = new ProductDAO();
		ArrayList<ProductDTO> list = dao.prdSearch(request.getParameter("search_name"));
		//가져온 데이터를 request에 담기
		request.setAttribute("list", list);
		//특정한 페이지로 이동		
		RequestDispatcher dis = request.getRequestDispatcher("searchList.jsp");
		dis.forward(request, response);
	}
	

	public void prdSearchSort(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//DB 이용 해서 데이터 가져오기
		ProductDAO dao = new ProductDAO();
		ArrayList<ProductDTO> list = dao.searchSort(request.getParameter("data"),request.getParameter("content"));
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

	public void mainList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//DB 이용 해서 데이터 가져오기
		System.out.println("aaa");
		ProductDAO dao = new ProductDAO();
		System.out.println("111");
		ArrayList<ProductDTO> list1 = dao.mainList("bHit");
		System.out.println("2");
		ArrayList<ProductDTO> list2 = dao.mainList("date");
		System.out.println("3");
		dao.resClose();
		System.out.println("bbb");

		//response 반환
		Gson json = new Gson();
		HashMap<String, Object> map = new HashMap<>();

		map.put("list1",list1);
		map.put("list2",list2);
		String obj = json.toJson(map);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().println(obj);
	}

	public void bHitlist(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//DB 이용 해서 데이터 가져오기
		ProductDAO dao = new ProductDAO();
		ArrayList<ProductDTO> list = dao.mainList("bHitAll");
		dao.resClose();
		
		//response 반환
		Gson json = new Gson();
		HashMap<String, Object> map = new HashMap<>();

		map.put("list",list);
		String obj = json.toJson(map);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().println(obj);
	}

	public void datelist(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//DB 이용 해서 데이터 가져오기
		ProductDAO dao = new ProductDAO();
		ArrayList<ProductDTO> list = dao.mainList("dateAll");
		dao.resClose();
		
		//response 반환
		Gson json = new Gson();
		HashMap<String, Object> map = new HashMap<>();

		map.put("list",list);
		String obj = json.toJson(map);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().println(obj);
	}

	public void delieveryList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//DB 이용 해서 데이터 가져오기
		ProductDAO dao = new ProductDAO();
		ArrayList<PurchaseDTO> list = dao.delieveryList(Integer.parseInt(request.getParameter("prd_id")));
		dao.resClose();
		
		//response 반환
		Gson json = new Gson();
		HashMap<String, Object> map = new HashMap<>();

		map.put("list",list);
		String obj = json.toJson(map);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().println(obj);
	}

	public void delievery(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//DB 이용 해서 데이터 가져오기
		ProductDAO dao = new ProductDAO();
		//response 반환
		Gson json = new Gson();
		HashMap<String, Object> map = new HashMap<>();
		ArrayList<PurchaseDTO> list = dao.delievery(Integer.parseInt(request.getParameter("pur_id")));
		map.put("list",list);
		String obj = json.toJson(map);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().println(obj);
	}

}
