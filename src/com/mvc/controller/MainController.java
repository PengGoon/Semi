package com.mvc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.service.AdminService;
import com.mvc.service.NoticeService;
import com.mvc.service.ProductService;
import com.mvc.service.UserService;

@WebServlet({ "/login", "/logout", "/join", "/list", "/detail", "/update", 
	"/updateView", "/delete", "/findId", "/findPw","/payList","/restock",
	"/admin_login" , "/admin_logout" , "/review_view", "/user_view", "/seller_view",
	"/notice_list", "/notice_write", "/notice_delete", "/notice_detail","/notice_update" , "/notice_updateView" })
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
				AdminService admin = null;
				NoticeService notice = null;
				
				// "/login", "/logout", "/join", 
				// "/list","/detail", "/update", "/updateView", 
				// "/write", "/delete", "/findId", "/findPw","/payList","/restock"
				
			   // ㅡㅡㅡㅡ관리자 
				// "/admin_login" , /"admin_logout" , 
				// "/review_view"(리뷰 리스트), "/user_view"(회원리스트), "/seller_view"(판매자 리스트),
				// ㅡㅡㅡㅡ공지사항 
				// "/notice_list"(공지사항리스트), "/notice_write"(공지사항 작성), "/notice_delete", "/notice_detail"
				// "/notice_update" , "/notice_updateView"
			 
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
					case "/write":
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
						
						
					// ㅡㅡㅡㅡㅡ관리자 	
					case "/admin_login":
						System.out.println("관리자 로그인");
						admin = new AdminService();
						break;
						
					case "/admin_logout":
						System.out.println("관리자 로그아웃");
						admin = new AdminService();
						break;
						
					case "/review_view":
						System.out.println("리뷰 확인");
						
						break;
						
					case "/user_view":
						System.out.println("회원 확인");
				
						break;
						
					case "/seller_view":
						System.out.println("판매자 확인");
					
						break;
						
					case "/notice_list":
						System.out.println("공지사항 리스트");
						notice = new NoticeService();
						break;
						
					case "/notice_write":
						System.out.println("공지사항 작성");
						notice = new NoticeService();
						break;
						
					case "/notice_delete":
						System.out.println("공지사항 삭제");
						notice = new NoticeService();
						break;
						
					case "/notice_detail":
						System.out.println("공지사항 상세보기");
						notice = new NoticeService();
						break;
						
					case "/notice_update":
						System.out.println("공지사항 수정하기");
						notice = new NoticeService();
						break;
						
					case "/notice_updateView":
						System.out.println("공지사항 수정 상제 요청");
						notice = new NoticeService();
						break;
						


				}
		
	}

}
