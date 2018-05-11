package com.mvc.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dao.NoticeDAO;
import com.mvc.dto.NoticeDTO;

public class NoticeService {

	//공지사항 작성 메서드
	public void write(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		//DB에서 처리해야 함으로 DAO 생성해서 wirte() 요청
		NoticeDAO dao = new NoticeDAO();
		NoticeDTO dto = new NoticeDTO();
		
		String no_subject = request.getParameter("title");
		String no_content = request.getParameter("content");
		
		//제목과 내용이 써지는지 확인, 
		System.out.println(no_subject + "/" +no_content );
		
		
		
		
	}

}
