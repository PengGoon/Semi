package com.mvc.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.google.gson.Gson;
import com.mvc.dao.AdminDAO;
import com.mvc.dao.NoticeDAO;
import com.mvc.dto.NoticeDTO;


public class NoticeService {

	//공지사항 작성 메서드
	public void write(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// 1. 파라메터 추출
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String admin_id = request.getParameter("admin_id");
		System.out.println(title+"/"+content+"/"+admin_id);
		
		// 2. DAO 요청
		NoticeDAO dao = new NoticeDAO();
		
		// 3. 결과값 JSON 변환
		Gson json = new Gson();
		HashMap<String, Integer> map = new HashMap<>();
		int idx = dao.write(admin_id,title,content);
		//세션에서 idx를  string 으로 불러 내기 때문에 넣을 때 문자 열로 형변환 해야 한다. 
		request.getSession().setAttribute("notice_id",Integer.toString(idx));
		map.put("success", idx);
		
		String obj = json.toJson(map);
		System.out.println(obj);
		// 4. response 로 변환
		response.getWriter().println(obj);
		
		
	}
	
	//공지사항 메인화면에 리스트를 보여주는 메서드 
	public void main(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//db에서 가져와야 하기 때문에 db필요 
		
		NoticeDAO dao = new NoticeDAO();
		ArrayList<NoticeDTO> list = dao.list();
		
		//로그인 상태 
		String loginId =(String)request.getSession().getAttribute("loginId");
		//response 반환
		Gson json = new Gson();
		HashMap<String, Object> map = new HashMap<>();
		
		if(loginId !=null) {
			map.put("login", true);
		}else {
			map.put("login", false);
		}

		map.put("list", list);
		String obj = json.toJson(map);
		response.setContentType("text/html; charset = UTF-8");
		response.getWriter().println(obj);
		
	}

	//공지사항 삭제 
	public void del(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] delList = request.getParameterValues("delList[]"); 
		
		NoticeDAO dao = new NoticeDAO();
		boolean success = false;
		
		if(dao.del(delList) == delList.length) {
			success = true;
		}
		
		Gson json = new Gson();
		HashMap<String, Boolean> map = new HashMap<>();
		map.put("success", success);
		String obj = json.toJson(map);
		response.getWriter().println(obj);
	}

	//제목을 클릭했을 때 보여주는 공지사항 상세보기
	public void detailView(HttpServletRequest request, HttpServletResponse response) throws IOException {
				String idx =(String) request.getSession().getAttribute("notice_id");
				Gson json = new Gson();
				HashMap< String, Object> map = new HashMap<>();

				NoticeDAO dao = new NoticeDAO();
				NoticeDTO dto = dao.detailView(idx);

				map.put("dto", dto);
				String obj  = json.toJson(map);
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().println(obj);
	}

	public void detail(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().setAttribute("notice_id", request.getParameter("notice_id"));
		response.sendRedirect("a_notice_detail.jsp");
		
	}

	//공지사항 수정하기 
	public void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("UTF-8");
		//수정할 부분 불러오기 
		String notice_id = request.getParameter("notice_id");
		String notice_title = request.getParameter("notice_title");
		String notice_content = request.getParameter("notice_content");
		NoticeDAO dao = new NoticeDAO();
		//gson 객체 사용
		Gson json = new Gson();
		HashMap<String, Integer> map = new HashMap<>();
		map.put("success", dao.update(notice_id,notice_title,notice_content));
		String obj = json.toJson(map);
		response.getWriter().println(obj);
		
	}

	public void main_detail(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().setAttribute("notice_id", request.getParameter("notice_id"));
		response.sendRedirect("M_notice_detail.jsp");
		
	}
	
	
}

