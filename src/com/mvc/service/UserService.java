package com.mvc.service;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.mvc.dao.MemberDAO;
import com.mvc.dao.UserDAO;
import com.mvc.dto.UserDTO;

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
	public void findId(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		  String find_name = request.getParameter("find_name");
	      String find_email = request.getParameter("find_email");

	      System.out.println(find_name + "//" + find_email);

	      UserDAO dao = new UserDAO();
	      String success = dao.findID(find_name, find_email);
	      System.out.println(success);

	      Gson json = new Gson();
	      HashMap<String, String> map = new HashMap<>();
	      map.put("success", success);
	      String obj = json.toJson(map);
	      response.setContentType("text/html; charset=UTF-8");
	      response.getWriter().println(obj);
	   }
	
	
	// 비밀번호 찾기(미구현)
	public void findPw(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		  String search_id = request.getParameter("search_id");
	      String search_name = request.getParameter("search_name");
	      String search_email = request.getParameter("search_email");

	      UserDAO dao = new UserDAO();
	      boolean success = dao.findPW(search_id, search_name, search_email);
	      System.out.println(success);

	      Gson json = new Gson();
	      HashMap<String, Boolean> map = new HashMap<>();
	      map.put("success", success);
	      String obj = json.toJson(map);
	      response.getWriter().println(obj);
		
	}
	
	// 구매 페이지에서 현재 로그인 중인 계정의 정보 뽑기
	public void buyuser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		UserDAO dao3 = new UserDAO();
		System.out.println(request.getParameter("id"));
		UserDTO dto3 = dao3.user(request.getParameter("id"));		
		Gson gson = new Gson();
		HashMap<String, Object> map = new HashMap<>();
		map.put("dto3", dto3);
		//map.put("dto2",dto2);
		String obj = gson.toJson(map);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().println(obj);
		
	}
	//상세보기
	public void detailView(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String loginUserId = (String) request.getSession().getAttribute("loginUserId");
		System.out.println("상세보기" +loginUserId);
		boolean login = false;
		Gson json = new Gson();
		HashMap<String, Object> map = new HashMap<>();
		if(loginUserId !=null) {
			UserDAO dao = new UserDAO();
			UserDTO dto = dao.detailView(loginUserId);
			login = true;
			map.put("dto", dto);
		}
		map.put("login", login);
		String obj = json.toJson(map);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().println(obj);
	}
	//수정
	public void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		String loginUserId = (String) request.getSession().getAttribute("loginUserId");
		String user_Pw = request.getParameter("user_Pw");
		System.out.println("비밀번호확인"+user_Pw);
		String user_Name =request.getParameter("user_Name");
		System.out.println("이름확인"+user_Name);
		String user_Addr = request.getParameter("user_Addr1")+request.getParameter("user_Addr2")+request.getParameter("user_Addr3");
		String user_Email = request.getParameter("user_Email");
		String user_Phone = request.getParameter("user_Phone");
		UserDAO dao = new UserDAO();
		Gson json = new Gson();
		HashMap<String, Object> map =new HashMap<>();
		map.put("success", dao.update(loginUserId,user_Pw,user_Name,user_Addr,user_Email,user_Phone));
		String obj = json.toJson(map);
		response.getWriter().println(obj);
		
	}
	//비밀번호체크
	public void upPwCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String checkPw = request.getParameter("updatePwChk");
		String loginUserId = (String) request.getSession().getAttribute("loginUserId");
		int success =0;
		UserDAO dao = new UserDAO();
		
		success = dao.chekPw(loginUserId,checkPw);
		System.out.println(success);
		Gson json = new Gson();
		HashMap<String, Integer> map = new HashMap<>();
		map.put("success", success);
		String obj = json.toJson(map);
		response.getWriter().println(obj);
	}
	

}
