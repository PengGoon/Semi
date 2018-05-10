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
			HttpSession session = request.getSession();
			session.setAttribute("loginId",id);
			response.sendRedirect("/AdminPage/a_main_user.jsp"); //controller의 /main 으로 요청 보냄 
			
		}else { //로그인 실패시 
			request.setAttribute("msg", "아이디 또는 비밀번호를 확인 하세요");
			System.out.println("실패");
			RequestDispatcher dis =request.getRequestDispatcher("a_login.jsp");
			//특정 페이지를 선택하여 보내는 방법 
			dis.forward(request, response);
		}
		
	}

	//메인페이지 이동 메서드 
	public void main(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		RequestDispatcher dis = request.getRequestDispatcher("a_main_user.jsp");
		dis.forward(request, response);
		
	}
	//로그아웃 메서드
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//세션 추출
		HttpSession session = request.getSession();
		//loninId 속성값 삭제
		session.removeAttribute("admin_id");
		//main 페이지 요청 (index 인데 세션 검사 작동 확인을 위해...)
		response.sendRedirect("a_login.jsp");
		
	}

}
