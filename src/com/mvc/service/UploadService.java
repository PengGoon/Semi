package com.mvc.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.dto.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UploadService {

   HttpServletRequest request = null;
   HttpServletResponse response = null;
   //파일 업로드 실행
   public String upload(HttpServletRequest request, HttpServletResponse response) throws ServletException {
      
      String filename = request.getParameter("filename");
      String photoPath="seller_upload/";//사진 위치 url
      MemberService member = null;
      //1. 용량 제한 10MB(1b 단위)
      int maxSize = 10*1024*1024;
      //2. 저장경로 설정(서버메인/upload)
      //servletContext : 프로젝트 명
      //realPath : 프로젝트가 실행되는 실제 주소
      String root = request.getSession().getServletContext().getRealPath("/");
      //프로젝트의 실제 띄워진 주소
      System.out.println(root);
      
      //3. 없으면 폴더 생성
      String uploadPath = root+"seller_upload";//우리가 원하는 파일 저장 위치
      File dir = new File(uploadPath);
      
      if(!dir.exists()) {//해당 폴더가 존재하는지 확인
         System.out.println("폴더 없음, upload 폴더 생성");
         dir.mkdir();//폴더 생성
      }
      //4. request 에서 파일 추출(cos.jar 를 사용)
      //MultipartRequest(request, 저장경로, 제한용량,인코딩, 정책)
      //정책 : 중복되는 파일이 있을 경우 어떻게 처리할 것인가?
      //new DefaultFileRenamePolicy() : 중복 파일 생성시 (1) 등의 숫자 부여      
      try {
         System.out.println("uploadpath : "+   uploadPath);
         MultipartRequest multi
            = new MultipartRequest(request, uploadPath, maxSize, "UTF-8",
                  new DefaultFileRenamePolicy());
         
         //MultipartRequest 에서는 일반 파라메터도 추출 가능
               
         //원래 파일명 가져오기      
         String oriFileName = multi.getFilesystemName("filename");
         System.out.println("원래 파일명 : "+oriFileName);
         //확장자만 가져오기(split | indexOf 와 subString)
         String ext = oriFileName.substring(oriFileName.indexOf("."));
         System.out.println("확장자 : "+ext);
         
         String msg = "";
         
         

//         
         //System.currentMilis... 로 새 파일명 생성 후 확장자 붙이기
         String newFileName=System.currentTimeMillis()+ext;
         System.out.println("새 파일명 : "+newFileName);
         //원래파일명을 새파일명으로 변경   
         File oldName = new File(uploadPath+"/"+oriFileName);
         File newName = new File(uploadPath+"/"+newFileName);
         oldName.renameTo(newName);   
         photoPath +=newFileName;
         
         
         MemberDTO dto = new MemberDTO();
         dto.setFilename(root+photoPath);
         System.out.println(dto.getFilename());
         
         if(ext.equals(".jpg")||ext.equals(".png")) {
            msg = "정상 업로드";
            request.setAttribute("filename",photoPath);
         }else {
            msg = "jpg 또는 png 파일만 가능합니다.";   
         }
         System.out.println(msg);
         System.out.println(photoPath);
         request.setAttribute("msg", msg);
         request.getRequestDispatcher("upload.jsp").forward(request, response);
/*         filename = newFileName;
         Gson json = new Gson();
         HashMap<String, String> map = new HashMap<>();
         map.put("filename", filename);
         String obj = json.toJson(map);*/
//         response.getWriter().println(obj);
         
      } catch (IOException e) {
         e.printStackTrace();
      }
      
      return photoPath;
   }

}