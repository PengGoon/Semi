package com.mvc.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.mvc.dao.MemberDAO;
import com.mvc.dto.MemberDTO;

public class MemberService {

   // 중복 체크
   public void overlay(HttpServletRequest request, HttpServletResponse response) throws IOException {
      String id = request.getParameter("id");
      System.out.println("param : " + id);
      MemberDAO dao = new MemberDAO();
      boolean overlay = dao.overlay(id);

      Gson json = new Gson();// Gson 객체 생성
      HashMap<String, Boolean> map = new HashMap<>();// map 생성
      map.put("overlay", overlay);// map 에 값 추가
      String obj = json.toJson(map);// json 으로 변경
      // response 로 반환(옵션1:한글깨짐, 옵션2:크로스 도메인)
      response.getWriter().println(obj);
   }

   // 회원 가입
   public void join(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

      UploadService service = new UploadService();
      request.setCharacterEncoding("UTF-8");
      MemberDTO dto = new MemberDTO();
      dto.setId(request.getParameter("id"));
      dto.setPw(request.getParameter("pw"));
      dto.setName(request.getParameter("name"));
      dto.setEmail(request.getParameter("email"));
      dto.setAddr(request.getParameter("addr1") + "/" + request.getParameter("addr2") + "/"
            + request.getParameter("addr3"));
      dto.setPhone(request.getParameter("phone"));
      dto.setFilename(request.getParameter("filename"));
      System.out.println("filename : " + dto.getFilename());

      MemberDAO dao = new MemberDAO();
      int success = dao.join(dto);

      Gson json = new Gson();// Gson 객체
      HashMap<String, Integer> map = new HashMap<String, Integer>();// map 만들어서 값 추가
      map.put("success", success);
      // json 형태로 변환
      String obj = json.toJson(map);
      // response 반환(한글깨짐 방지,크로스 도메인)
      response.setContentType("text/html; charset=UTF-8");
      response.getWriter().println(obj);
   }

   // 로그인 요청
   public void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
      String id = request.getParameter("id");
      String pw = request.getParameter("pw");

      MemberDAO dao = new MemberDAO();
      boolean success = dao.login(id, pw);

      if (success) {
         request.getSession().setAttribute("loginId", id);
      }
      // 성공 실패 여부를 response 로 반환
      Gson json = new Gson();
      HashMap<String, Boolean> map = new HashMap<>();
      map.put("success", success);
      String obj = json.toJson(map);
      response.getWriter().println(obj);
   }

   public void searchID(HttpServletRequest request, HttpServletResponse response)
         throws IOException, ServletException {

      String search_name = request.getParameter("search_name");
      String search_email = request.getParameter("search_email");

      System.out.println(search_name + "//" + search_email);

      MemberDAO dao = new MemberDAO();
      String success = dao.searchID(search_name, search_email);
      System.out.println(success);

      Gson json = new Gson();
      HashMap<String, String> map = new HashMap<>();
      map.put("success", success);
      String obj = json.toJson(map);
      response.setContentType("text/html; charset=UTF-8");
      response.getWriter().println(obj);
   }

   public void searchPW(HttpServletRequest request, HttpServletResponse response) throws IOException {

      String search_id = request.getParameter("search_id");
      String search_name = request.getParameter("search_name");
      String search_email = request.getParameter("search_email");

      MemberDAO dao = new MemberDAO();
      boolean success = dao.searchPW(search_id, search_name, search_email);
      System.out.println(success);

      Gson json = new Gson();
      HashMap<String, Boolean> map = new HashMap<>();
      map.put("success", success);
      String obj = json.toJson(map);
      response.getWriter().println(obj);

   }

   // 상세보기
   public void detailView(HttpServletRequest request, HttpServletResponse response) throws IOException {

      String loginId = (String) request.getSession().getAttribute("loginId");
      System.out.println(loginId);
      boolean login = false;

      Gson json = new Gson();
      HashMap<String, Object> map = new HashMap<>();

      if (loginId != null) {// 로그인 일 경우만 정보를 가져 온다.
         MemberDAO dao = new MemberDAO();
         MemberDTO dto = dao.detailView(loginId);
         login = true;
         map.put("dto", dto);
      }

      map.put("login", login);
      String obj = json.toJson(map);
      response.setContentType("text/html; charset=UTF-8");
      response.getWriter().println(obj);
   }

   public void update(HttpServletRequest request, HttpServletResponse response) throws IOException {

      request.setCharacterEncoding("UTF-8");
      String login_id = (String) request.getSession().getAttribute("loginId");
      String sell_pw = request.getParameter("pw");
      String sell_name = request.getParameter("name");
      String sell_addr = request.getParameter("addr1") + request.getParameter("addr2")
            + request.getParameter("addr3");
      String sell_email = request.getParameter("email");
      String sell_phone = request.getParameter("phone");
      String sell_img = request.getParameter("filename");
      MemberDAO dao = new MemberDAO();
      Gson json = new Gson();
      HashMap<String, Integer> map = new HashMap<>();
      map.put("success", dao.update(login_id, sell_pw, sell_name, sell_addr, sell_email, sell_phone, sell_img));
      String obj = json.toJson(map);
      response.getWriter().println(obj);
   }

   public void upPwCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
      String checkPw = request.getParameter("updatePwChk");
      String login_id = (String) request.getSession().getAttribute("loginId");
      int success = 0;
      MemberDAO dao = new MemberDAO();

      success = dao.chekPw(login_id, checkPw);

      System.out.println(success);
      Gson json = new Gson();
      HashMap<String, Integer> map = new HashMap<>();
      map.put("success", success);
      String obj = json.toJson(map);
      response.getWriter().println(obj);
   }

   public void request(HttpServletRequest request, HttpServletResponse response) throws IOException {
      String loginId = (String) request.getSession().getAttribute("loginId");
      System.out.println(loginId);
      boolean login = false;

      Gson json = new Gson();
      HashMap<String, Object> map = new HashMap<>();

      if (loginId != null) {// 로그인 일 경우만 정보를 가져 온다.
         MemberDAO dao = new MemberDAO();
         MemberDTO dto = dao.detailView(loginId);
         login = true;
         map.put("dto", dto);
      }

      map.put("login", login);
      String obj = json.toJson(map);
      response.setContentType("text/html; charset=UTF-8");
      response.getWriter().println(obj);
   }

   public void sell_request(HttpServletRequest request, HttpServletResponse response) throws IOException {
      String loginId = (String) request.getSession().getAttribute("loginId");
      System.out.println(loginId);
      boolean login = false;

      Gson json = new Gson();
      HashMap<String, Object> map = new HashMap<>();

      if (loginId != null) {// 로그인 일 경우만 정보를 가져 온다.
         MemberDAO dao = new MemberDAO();
         MemberDTO dto = dao.detailView(loginId);
         dao = new MemberDAO();
         int result = dao.request(loginId);
         if (dto.getSell_yn() != 0) {
            result = 0;
         }
         login = true;
         map.put("result", result);
      }

      map.put("login", login);
      String obj = json.toJson(map);
      response.setContentType("text/html; charset=UTF-8");
      response.getWriter().println(obj);
   }

   public void list(HttpServletRequest request, HttpServletResponse response) throws IOException {
      MemberDAO dao = new MemberDAO();
      // 데이터가 담긴 어레이 리스트
      ArrayList<MemberDTO> list = dao.list();// 리스트 직접 뽑아 볼 것
      // 로그인 상태
      String loginId = (String) request.getSession().getAttribute("loginId");
      // response 반환
      Gson json = new Gson();
      HashMap<String, Object> map = new HashMap<>();
      if (loginId != null) {
         map.put("login", true);
      } else {
         map.put("login", false);
      }
      map.put("list", list);
      String obj = json.toJson(map);
      response.setContentType("text/html; charset=UTF-8");
      response.getWriter().println(obj);
   }

   public void acptok(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      MemberDAO dao = new MemberDAO();
      int result = 0;
      String msg = "수락 실패";
      String seller_id = (String) request.getSession().getAttribute("seller_id");
      System.out.println("test : " + seller_id);
      result = dao.acptok(seller_id);
      if (result > 0) {
         msg = "요청수락 성공";
      }
      request.setAttribute("msg", msg);
      RequestDispatcher dis = request.getRequestDispatcher("a_seller_re.jsp");
      dis.forward(request, response);
   }

   public void acptno(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int result = 0;
      boolean success = false;
//      String msg = "실패";
      MemberDAO dao = new MemberDAO();
      String seller_id = request.getParameter("sell_id");
      String seller_mail = request.getParameter("sell_email");
      String no_msg = request.getParameter("no_msg");
      System.out.println(seller_id);
      System.out.println(seller_mail);
      System.out.println(no_msg);
      result = dao.acptno(seller_id, seller_mail, no_msg);
      System.out.println(result);
      if (result > 0) {
//         msg = "성공";
         success = true;
      }
//      System.out.println(msg);
      /*request.setAttribute("msg", msg);
      RequestDispatcher dis = request.getRequestDispatcher("acptno.jsp");
      dis.forward(request, response);*/
      
      Gson gson = new Gson();
      HashMap<String, Boolean> map = new HashMap<>();
      map.put("success",success);
      String obj = gson.toJson(map);
      response.setContentType("text/html; charset=UTF-8");
      response.getWriter().println(obj);
   }

   public void sell_delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
      String[] delList = request.getParameterValues("delList[]");
      System.out.println(delList.length);
      //복수개의 데이터를 지우기
      //1. 지울 수 만큼 쿼리를 반복
      //2. DELETE FROM bbs WHERE idx=? + OR idx=?
      MemberDAO dao = new MemberDAO();
      boolean success = false;
      
      if(dao.delete(delList) == delList.length) {
         success = true;
      }
      
      Gson json = new Gson();
      HashMap<String, Boolean> map = new HashMap<>();
      map.put("success", success);
      String obj = json.toJson(map);
      response.getWriter().println(obj);      
   }

public void sell_YN(HttpServletRequest request, HttpServletResponse response) throws IOException {
	int YN = 0;
    String seller_id = request.getParameter("sell_id");
    MemberDAO dao = new MemberDAO();
    YN = dao.sell_YN(seller_id);
    
    Gson gson = new Gson();
    HashMap<String, Integer> map = new HashMap<>();
    map.put("YN",YN);
    String obj = gson.toJson(map);
    response.setContentType("text/html; charset=UTF-8");
    response.getWriter().println(obj);
}

}