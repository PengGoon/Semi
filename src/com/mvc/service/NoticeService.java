package com.mvc.service;

import java.io.IOException;
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
	public void write(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//DB에서 처리해야 함으로 DAO 생성해서 wirte() 요청
		System.out.println("공지사항 작성");
		NoticeDAO dao = new NoticeDAO();
		NoticeDTO dto = new NoticeDTO();
	
		//작성할 부분(제목, 내용) 
		//a_notice_write.jsp에 저장되어 있는 변수값을 사용해줘야함.
		dto.setNotice_title(request.getParameter("title"));
		dto.setNotice_content(request.getParameter("content"));
		
		
		String msg = "공지사항 등록 실패 !";
		String page = "a_notice_write.jsp";
		
		if(dao.write(dto)>0) {
			msg = "게시판 등록 성공";
			page = "a_notice.jsp";
		}
		request.setAttribute("msg",msg);
		RequestDispatcher dis = request.getRequestDispatcher(page);
		dis.forward(request, response);
		
		
		
	}
	
	//공지사항 메인화면에 리스트를 보여주는 메서드 
	public void main(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//db에서 가져와야 하기 때문에 db필요 
		NoticeDAO dao = new NoticeDAO();
		ArrayList<NoticeDTO> list = dao.list();
		//리스트에서 가져온 데이터를 request에 담기
		request.setAttribute("list", list);
		// 리스트를  특정 페이지로 이동 
		RequestDispatcher dis = request.getRequestDispatcher("a_notice.jsp");
		dis.forward(request, response);
		
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

}
