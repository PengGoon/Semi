<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Insert title here</title>
   <style>
      table,th,td{
         border: 1px solid black;
         border-collapse: collapse;
         padding: 5px 10px;
      }
      table{
         width: 500px;
      }
      input[type='text']{
         width:100%;
      }
      textarea{
         width:100%;
         resize:none;
      }
      td{
         text-align: center;
      }
   </style>
   </head>
   <body>
      <form action="write" method="post" enctype="multipart/form-data">
      <table>
      <tr>
         <th>작성자</th>
         <td><input type="text" name="userId" value="${dto.user_id }"/>
         </td>
      </tr>
      <tr>
         <th>제목</th>
         <td><input type="text" name="revewTitle"  value="${dto.review_title}"/></td>
      </tr>
      <tr>
         <th>내용</th>
         <td><textarea rows="15" name="reivewContent"  value="${dto.review_content}"/></textarea></td>
      </tr>
      <tr>
         <th>사진</th>
         <td>
         	<c:if test="${dto.newFileName !=null }">
         		<img src="./upload/${dto.newFileName }"/>
         	</c:if>
         <input type="file" name="reviewPhoto"/>
         </td>
      </tr>
      <tr>
         <td colspan="2">
            <a href="reviewDetail.jsp">취소</a>
            &nbsp;&nbsp;
            <button>저장</button>
         </td>
      </tr>
      </table>
      </form>
   </body>
</html>






