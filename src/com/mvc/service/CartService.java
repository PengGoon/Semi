package com.mvc.service;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mvc.dao.CartDAO;
import com.mvc.dao.ProductDAO2;
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
}
