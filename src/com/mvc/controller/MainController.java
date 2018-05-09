package com.mvc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.service.ProductService;
import com.mvc.service.UserService;

@WebServlet({ "/login", "/logout", "/join", "/list", "/detail", "/update", "prd_write",
	"/updateView", "/delete", "/findId", "/findPw","/payList","/restock" })
public class MainController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		dual(request,response);
	}
	
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		dual(request,response);
	}

	private void dual(HttpServletRequest request, 
			HttpServletResponse response) throws IOException {
				//subAddr 추출
				//subAddr 에 따른  처리
				String uri = request.getRequestURI();
				String ctx = request.getContextPath();
				String subAddr = uri.substring(ctx.length());
				
				//Service 생성
				UserService user = null;
				ProductService product = null;
				
				// "/login", "/logout", "/join", 
				// "/list","/detail", "/update", "/updateView", 
				// "/write", "/delete", "/findId", "/findPw","/payList","/restock"
				switch(subAddr) {
				
					// 로그인
					case "/login":
					System.out.println("구매자 로그인 요청");
					user = new UserService();
					user.login(request, response);
					break;
					
					// 로그아웃
					case "/logout":
					user = new UserService();
					user.logout(request,response);
					System.out.println("구매자 로그아웃 요청");
					break;
					
					// 회원가입
					case "/join":
						System.out.println("구매자 회원가입 요청");
						user = new UserService();
						user.join(request, response);
						break;
					
					// 상품 리스트	
					case "/list":
						System.out.println("상품 리스트 호출 요청");
						product = new ProductService();
						product.list(request, response);
						break;
						
					// 상품 상세보기 화면 
					case "/detail":
						System.out.println("상품 상세보기 화면 요청");
						//받아온 파라메터를 세션에 저장
						request.getSession().setAttribute("idx", request.getParameter("idx"));
						//html 간 이동시 값을 공유 할 수 없어 세션에 저장 한다.
						response.sendRedirect("detail.html");
						break;
					
					// 상품 수정 
					case "/update":
						System.out.println("상품 수정 요청");
						product = new ProductService();
						product.update(request, response);
						break;
					
					// 상품 수정 상세
					case "/updateView":
						System.out.println("상품 수정 상세 요청");
						product = new ProductService();
						product.updateView(request,response);
						break;
					
					// 상품 등록
					case "/prd_write":
						System.out.println("상품 등록 요청");
						product = new ProductService();
						product.write(request, response);
						break;
						
					// 상품 삭제
					case "/delete":
						System.out.println("상품 삭제 요청");
						product = new  ProductService();
						product.delete(request, response);
						break;
						
					// Id 찾기
					case "/findId":
						System.out.println("ID찾기 요청");
						user = new UserService();
						user.findId(request,response);
						break;
						
					// Pw찾기
					case "/finPw":
						System.out.println("PW찾기 요청");
						user = new UserService();
						user.findPw(request,response);
						break;
				
					// 중복 확인
					case "/overlay":
						System.out.println("회원가입 아이디 중복 체크");
						user = new UserService();
						user.overlay(request, response);
						break;

					// 상품 상세보기
					case "/detailView":
						System.out.println("상품 상세보기 요청");
						product = new ProductService();
						product.detailView(request, response);
						break;
						
					
						
					
						

				}
		
	}

}
