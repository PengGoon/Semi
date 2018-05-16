package com.mvc.service;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.mvc.dao.AdminDAO;

public class AdminService {

	
	//로그인 메서드 
	public void login(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		
		// id와 pw 값을 가져와야한다. => db에서 
		String id = request.getParameter("admin_id");
		String pw = request.getParameter("admin_pw");
		System.out.println(id+"/"+pw);
		
		AdminDAO dao = new AdminDAO();
		boolean success = dao.login(id, pw);
		
		if(success) {
			request.getSession().setAttribute("loginId", id);
		}
		
		//성공 실패 여부를 response로 반환
		Gson json = new Gson();
		HashMap<String, Boolean> map = new HashMap<>();
		map.put("success" ,success);
		String obj = json.toJson(map);
		response.getWriter().println(obj);

		
	}

	//메인페이지 이동 메서드 
	public void main(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//메인페이지 이동 , 
		response.sendRedirect("a_main_user.jsp");
		
	}
	//로그아웃 메서드
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//세션 추출
		HttpSession session = request.getSession();
		//loninId 속성값 삭제
		session.removeAttribute("loginId");
		//로그인 페이지 요청 , 
		response.sendRedirect("a_login.jsp");
		
	}

	public void loginCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String loginId =(String) request.getSession().getAttribute("loginId");
		boolean login = false;
		Gson json = new Gson();
		HashMap<String, Object> map = new HashMap<>();
		
		//아이디가 아닐경우 
		if(loginId != null) {
			login = true;
			map.put("loginId", loginId);
		}
		map.put("login", login);
		String obj = json.toJson(map);
		response.getWriter().println(obj);
		
	}


}
