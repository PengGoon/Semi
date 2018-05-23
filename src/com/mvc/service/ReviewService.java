package com.mvc.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mvc.dao.ReviewDAO;
import com.mvc.dto.ReviewDTO;

public class ReviewService {

	// 리스트 호출 하기
	public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// DB 이용 해서 데이터 가져오기
		ReviewDAO dao = new ReviewDAO();
		ArrayList<ReviewDTO> list = dao.list();

		// response 반환
		Gson json = new Gson();
		HashMap<String, Object> map = new HashMap<>();

		map.put("list", list);
		String obj = json.toJson(map);
		response.setContentType("text/html; charset = UTF-8");
		response.getWriter().println(obj);
		System.out.println("후기 리스트 요청 ");
	}

	// 상세 보기
	public void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().setAttribute("review_id", request.getParameter("review_id"));
		response.sendRedirect("reviewDetail.jsp");
	}

	// 후기 상세보기
	public void detailView(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String review_id = (String) request.getSession().getAttribute("review_id");

		Gson json = new Gson();
		HashMap<String, Object> map = new HashMap<>();

		ReviewDAO dao = new ReviewDAO();
		ReviewDTO dto = dao.detailView(review_id);

		map.put("dto", dto);
		String obj = json.toJson(map);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().println(obj);
	}

	// 글쓰기 페이지
	public void write(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 파라메터 추출
		String user_Id = request.getParameter("user_Id");
		String review_title = request.getParameter("review_title");
		String review_content = request.getParameter("review_content");
		System.out.println(user_Id + "/" + review_title + "/" + review_content);

		// 2. DAO 요청
		ReviewDAO dao = new ReviewDAO();

		// 3. 결과값 JSON 변환
		Gson json = new Gson();
		HashMap<String, Integer> map = new HashMap<>();
		int review_id = dao.write(user_Id, review_title, review_content);
		// 세션에서 review_id를 string 으로 불러 내기 때문에 넣을 때 문자 열로 형변환 해야 한다.
		request.getSession().setAttribute("review_id", Integer.toString(review_id));
		map.put("success", review_id);

		String obj = json.toJson(map);
		System.out.println(obj);
		// 4. response 로 변환
		response.getWriter().println(obj);
	}

	// 글 삭제
	public void del(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 파라메터 추출
		String review_id = request.getParameter("review_id");
		ReviewDAO dao = new ReviewDAO();
		response.sendRedirect("reviewList.jsp");
	}

	// 수정 보기
	public void updateForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String review_id = request.getParameter("review_id");
		// 상세정보 가져오기(DB)
		ReviewDAO dao = new ReviewDAO();
		ReviewDTO dto = dao.detailView(review_id);
		// 수정 보기 페이지에 뿌려 준다.
		request.setAttribute("dto", dto);
		RequestDispatcher dis = request.getRequestDispatcher("reviewUpdateForm.jsp");
		dis.forward(request, response);
	}

	// 수정 하기
	public void update(HttpServletRequest request, HttpServletResponse response) throws IOException {

		request.setCharacterEncoding("UTF-8");
		// 수정할 부분 불러오기 =>
		String review_id = request.getParameter("review_id");
		String review_title = request.getParameter("review_title");
		String review_content = request.getParameter("review_content");
		ReviewDAO dao = new ReviewDAO();
		// gson 객체 사용
		Gson json = new Gson();
		HashMap<String, Integer> map = new HashMap<>();
		map.put("success", dao.update(review_id, review_title, review_content));
		String obj = json.toJson(map);
		response.getWriter().println(obj);

	}

	// 유저 후기
	public void mypage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String loginUserId = (String) request.getSession().getAttribute("loginUserId");
		ReviewDAO dao = new ReviewDAO();
		ArrayList<ReviewDTO> list = dao.mlist(loginUserId);

		System.out.println("유저후기" + list);
		Gson json = new Gson();
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		String obj = json.toJson(map);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().println(obj);
	}
	
	//유저 후기 삭제
	public void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String[] delList = request.getParameterValues("delList[]");
		ReviewDAO dao = new ReviewDAO();
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
