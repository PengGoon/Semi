package com.mvc.service;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.mvc.dao.UserDAO;
import com.mvc.dto.UserDTO;

import oracle.sql.DATE;

public class UserService {

	//중복 체크
		public void overlay(HttpServletRequest request, 
				HttpServletResponse response) throws IOException {
			String user_Id = request.getParameter("user_Id");
			System.out.println("중복 체크 user Id 파라미터: "+user_Id);
			UserDAO dao = new UserDAO();
			boolean overlay = dao.overlay(user_Id);
					
			Gson json = new Gson();//Gson 객체 생성		
			HashMap<String, Boolean> map = new HashMap<>();//map 생성		
			map.put("overlay", overlay);//map 에 값 추가		
			String obj = json.toJson(map);//json 으로 변경
			//response 로 반환(옵션1:한글깨짐, 옵션2:크로스 도메인)
			response.getWriter().println(obj);
		}
	
		//회원 가입
		public void join(HttpServletRequest request, 
				HttpServletResponse response) throws IOException {
			
			request.setCharacterEncoding("UTF-8");
			UserDTO dto = new UserDTO();
			dto.setUser_Id(request.getParameter("user_Id"));
			dto.setUser_Pw(request.getParameter("user_Pw"));
			dto.setUser_Name(request.getParameter("user_Name"));
			dto.setUser_Addr(request.getParameter("addr1")+" "+request.getParameter("addr2")+" "+request.getParameter("addr3"));
			dto.setUser_Email(request.getParameter("email"));
			dto.setUser_Phone(request.getParameter("phone"));
			
			System.out.println(dto);
			UserDAO dao = new UserDAO();
			int success = dao.join(dto);
					
			Gson json = new Gson();//Gson 객체
			HashMap<String, Integer> map = new HashMap<String, Integer>();//map 만들어서 값 추가
			map.put("success", success);
			//json 형태로 변환
			String obj = json.toJson(map);
			//response 반환(한글깨짐 방지,크로스 도메인)
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().println(obj);
		}
	
		//로그인 요청
		public void login(HttpServletRequest request, 
				HttpServletResponse response) throws IOException {
			String user_Id = request.getParameter("user_Id");
			String user_Pw = request.getParameter("user_Pw");
			System.out.println(user_Id+"//"+user_Pw);
			UserDAO dao = new UserDAO();
			boolean success = dao.login(user_Id, user_Pw);
			
			if(success) {
				request.getSession().setAttribute("loginUserId", user_Id);
			}
			//성공 실패 여부를 response 로 반환
			Gson json = new Gson();
			HashMap<String, Boolean> map = new HashMap<>();
			map.put("success", success);
			String obj = json.toJson(map);
			response.getWriter().println(obj);		
		}
		
	// 로그아웃 요청
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("loginUserId");
		response.sendRedirect("main/index.jsp");
	}

	// 아이디 찾기(미구현)
	public void findId(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}
	
	// 비밀번호 찾기(미구현)
	public void findPw(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

}
