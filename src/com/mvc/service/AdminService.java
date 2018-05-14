package com.mvc.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mvc.dao.AdminDAO;

public class AdminService {

	
	//로그인 메서드 
	public void login(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		
		// id와 pw 값을 가져와야한다. => db에서 
		AdminDAO dao = new AdminDAO();
		String id = request.getParameter("admin_id");
		String pw = request.getParameter("admin_pw");
		System.out.println(id+"/"+pw);
		
		//---여기까지 성공
		if(dao.login(id,pw)) { //로그인 성공시 
			//controller에 요청을 보내는 방식
			request.getSession().setAttribute("loginId", id);
			//컨트롤러의 메인페이지로 보냄 admin_main
			response.sendRedirect("/SemiProject/admin_main");

		}else { //로그인 실패시 
			request.setAttribute("msg", "아이디 또는 비밀번호를 확인 하세요");
			RequestDispatcher dis =request.getRequestDispatcher("a_login.jsp");
			//특정 페이지를 선택하여 보내는 방법 
			dis.forward(request, response);
		}
		
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


}
