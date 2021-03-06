package com.mvc.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mvc.dao.PurchaseDAO;
import com.mvc.dto.PurchaseDTO;

public class PurchaseService {

	public void purch(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");

		String user_id = request.getParameter("user_id");
		int prd_id = Integer.parseInt(request.getParameter("prd_id"));
		String sell_id = request.getParameter("sell_id");
		int pur_count = Integer.parseInt(request.getParameter("pur_count"));
		String pur_state = request.getParameter("pur_state");

		PurchaseDTO dto = new PurchaseDTO();

		dto.setUser_id(user_id);
		dto.setPrd_id(prd_id);
		dto.setSell_Id(sell_id);
		dto.setPur_count(pur_count);
		dto.setPur_state(pur_state);

		PurchaseDAO dao = new PurchaseDAO();
		int success = 0;
		dao = new PurchaseDAO();
		int cnt = dao.countprint(prd_id);
		int cart_id = 0;
		String msg = "";
		System.out.println("카트아이디 test : " + request.getParameter("cart_id"));
		msg = countdown(pur_count, prd_id, cnt);
		if(msg.equals("상품 구매에 성공하였습니다.")) {
			dao = new PurchaseDAO();
			success = dao.purch(dto);
		}
		if (cart_id != 0) {
			cart_id = Integer.parseInt(request.getParameter("cart_id"));
			cartDel(cart_id);
		}

		// msg = "상품 결제에 성공했습니다.";
		System.out.println(msg);
		Gson gson = new Gson();
		HashMap<String, String> map = new HashMap<>();
		map.put("msg", msg);
		String obj = gson.toJson(map);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(obj);
	}

	private void cartDel(int cart_id) {
		PurchaseDAO dao = new PurchaseDAO();
		dao.cartDel(cart_id);
	}

	private String countdown(int pur_count, int prd_id, int cnt) {
		PurchaseDAO dao = new PurchaseDAO();
		String msg = dao.countdown(pur_count, prd_id, cnt);

		return msg;
	}

	// 주문내역
	public void ulist(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String user_id = request.getParameter("user_id");
		PurchaseDAO dao = new PurchaseDAO();
		ArrayList<PurchaseDTO> list = dao.list(user_id);
		Gson json = new Gson();
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		String obj = json.toJson(map);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().println(obj);
	}

	// 삭제
	public void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String[] delList = request.getParameterValues("delList[]");
		System.out.println(delList.length);
		PurchaseDAO dao = new PurchaseDAO();
		boolean success = false;

		if (dao.delete(delList) == delList.length) {
			success = true;
		}

		Gson json = new Gson();
		HashMap<String, Boolean> map = new HashMap<>();
		map.put("success", success);
		String obj = json.toJson(map);
		response.getWriter().println(obj);

	}
}
