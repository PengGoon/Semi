package com.mvc.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mvc.dao.CartDAO;
import com.mvc.dto.CartDTO;

public class CartService {
	public void cart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CartDAO dao = new CartDAO();
		int prd_id = Integer.parseInt(request.getParameter("prd_id"));
		String user_id = request.getParameter("user_id");
		int prd_count = Integer.parseInt(request.getParameter("prd_count"));
		
		int success = dao.cart(prd_id, user_id, prd_count);
		
		String msg = "장바구니 담기에 성공했습니다.";
		if(success == 0) {
			msg = "장바구니 담기에 실패했습니다.";
		}
		
		Gson gson = new Gson();
		HashMap<String, String> map = new HashMap<>();
		map.put("msg", msg);
		
		String obj = gson.toJson(map);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(obj);
	}

	// 장바구니 상세보기 요청
	public void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int prd_id = Integer.parseInt(request.getParameter("prd_id"));
		
		CartDAO dao = new CartDAO();
		CartDTO dto = dao.detail(prd_id);
		
		request.setAttribute("dto", dto);
		RequestDispatcher dis = request.getRequestDispatcher("cart.jsp");
		dis.forward(request, response);
	}
	
	// 장바구니 리스트 보기 요청
	public void view(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		CartDAO dao = new CartDAO();
		ArrayList<CartDTO> list = dao.view(user_id);
		
		Gson gson = new Gson();
		HashMap<String, ArrayList<CartDTO>> map = new HashMap<>();
		map.put("list", list);
		
		String obj = gson.toJson(map);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(obj);
	}
	
	public void buy(HttpServletRequest request, HttpServletResponse response) throws IOException {
	//form 방식에서는 상관 없으나 javascript 배열 방식으로 보낼 경우는 뒤에 [] 를 붙여 준다.
	String[] buyList = request.getParameterValues("buyList[]");
	System.out.println(buyList.length);
	CartDAO dao = new CartDAO();
	boolean success = false;
		
	if(dao.buy(buyList) == buyList.length) {
		success = true;
	}
		
	Gson json = new Gson();
	HashMap<String, Boolean> map = new HashMap<>();
	map.put("success", success);
	String obj = json.toJson(map);
	response.getWriter().println(obj);	
}
	
	/*public void buy(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String prd_id = request.getParameter("prd_id");
		CartDAO dao = new CartDAO();
		CartDTO dto = dao.cartbuy(prd_id);
		
		Gson gson = new Gson();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dto", dto);
		
		String obj = gson.toJson(map);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(obj);
	}*/

	public void delete(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		//form 방식에서는 상관 없으나 javascript 배열 방식으로 보낼 경우는 뒤에 [] 를 붙여 준다.
			String[] delList = request.getParameterValues("delList[]");
			System.out.println(delList.length);
			//복수개의 데이터를 지우기
			//1. 지울 수 만큼 쿼리를 반복
			//2. DELETE FROM bbs WHERE idx=? + OR idx=?
			CartDAO dao = new CartDAO();
			boolean success = false;
				
			if(dao.delete(delList) == delList.length) {
				success = true;
			}
				
			Gson json = new Gson();
			HashMap<String, Boolean> map = new HashMap<>();
			map.put("success", success);
			String obj = json.toJson(map);
			response.getWriter().println(obj);	
	}
}
