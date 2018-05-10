package com.mvc.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.PhotoDAO;
import com.mvc.dto.PhotoDTO;

public class PhotoService {
	
	HttpServletRequest request = null;
	HttpServletResponse response = null;

	public PhotoService(HttpServletRequest request, 
			HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}

	//리스트 호출 하기
	public void list() throws ServletException, IOException {
		//DB 이용 해서 데이터 가져오기
		PhotoDAO dao = new PhotoDAO();
		ArrayList<PhotoDTO> list = dao.list();
		//가져온 데이터를 request에 담기
		request.setAttribute("list", list);
		//특정한 페이지로 이동		
		RequestDispatcher dis = request.getRequestDispatcher("/main/list.jsp");
		dis.forward(request, response);
	}
}