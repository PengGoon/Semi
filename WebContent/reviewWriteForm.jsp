<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>후기 작성</title>
   <style>
      table,th,td{
         border: 1px solid black;
         border-collapse: collapse;
         padding: 5px 10px;
      }
      
      th{
      	width:70px;
      }
      
      table{
      	position: absolute;
      	left:25%;
        width: 800px;
        margin: 300px 0 100px 0;
      }
      input[type='text']{
         width:100%;
      }
      textarea{
         width:100%;
         resize:none;
         height:300px;
      }
      td{
         text-align: left;
      }
      .photoAdd{
      			position:absolute;
            	left:4%;
      }
      
      .write{
            	position:absolute;
            	left:83%;
            	height : 42px;
            	width: 130px;
            	font-weight: 800;
            	border-style : solid;
            	border-color: limegreen;
            	background-color : limegreen;
            	color: white;
            	cursor: pointer;
      }
      
      .exit{
      			text-decoration:none;
            	position:absolute;
            	left:65%;
            	height : 29px;
            	width: 130px;
            	font-weight: 800;
            	font-size:14;
            	text-align:center;
        		padding: 10px 0 0 0;
            	border:2.5px solid limegreen;
            	background-color : white;
            	color: limegreen;
      }
            
     .btnRow{
     	height:80px;
     	padding: 0;
     }
   </style>
   </head>
   <body>
      <form action="update" method="post" enctype="multipart/form-data">
      <table>
      <tr>
         <th>작성자</th>
         <td>${info.user_id}</td>
      </tr>
      <tr>
         <th>제목</th>
         <td><input type="text" name="reviewTitle" /></td>
      </tr>
      <tr>
         <th>내용</th>
         <td><textarea rows="15" name="reviewContent" /></textarea></td>
      </tr>
      
      <tr>
         <td class=btnRow  colspan="2">
         	<input class=photoAdd type="file" name="reviewPhoto"/>
            <a class=exit href="reviewList.jsp">취소</a>
            &nbsp;&nbsp;
            <button class=write>작성 완료</button>
         </td>
      </tr>
      </table>
      </form>
   </body>
</html>






