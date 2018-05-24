package com.mvc.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.ProductDAO2;
import com.mvc.dto.ProductDTO2;

public class ProductService2 {

	public void list(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
	}
	public void buy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//DB 에 개별 데이터 요청
		ProductDAO2 dao2 = new ProductDAO2();
		ProductDTO2 dto2 = dao2.buy(request.getParameter("prd_id"));
		request.setAttribute("info", dto2);
		dto2 = dao2.list(request.getParameter("prd_id"));
		request.setAttribute("list", dto2);
		request.setAttribute("cart_id", request.getParameter("cart_id"));
		RequestDispatcher dis = request.getRequestDispatcher("buy.jsp");
		dis.forward(request, response);
		
		
	}
}
