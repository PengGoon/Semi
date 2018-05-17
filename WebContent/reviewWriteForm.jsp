<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>후기 작성</title>
   <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
   <style>
   
   	.ReviewWriteTitle{
            	margin : 30px 0px 20px 0px;
            	text-align: center;
            	color: limegreen;
            	font-size: 20;
            }

      .Review td{
      	border: 1px solid black;
        border-collapse: collapse;
        padding: 5px 10px;
      }
      
      .Review th{
      	border: 1px solid black;
        border-collapse: collapse;
        padding: 5px 10px;
      	width:70px;
      }
      
      .Review table{
      	position: absolute;
      	left:25%;
        width: 800px;
        border: 1px solid black;
        border-collapse: collapse;
        padding: 5px 10px;
        margin: 100px 0 100px 0;
      }
      .Review input[type='text']{
         width:100%;
      }
      .Review textarea{
         width:100%;
         resize:none;
         height:300px;
      }
      .Review td{
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
   	  <jsp:include page="navi.jsp"></jsp:include>
   	  <div class = Review>
   	  <div class = ReviewWriteTitle>
    	<h1>후기 작성</h1>
    	</div>
      <table>
      <tr>
         <th>작성자</th>
         <td><input type="text" id="userId" value=<%=request.getSession().getAttribute("loginUserId") %> readonly/></td>
      </tr>
      <tr>
         <th>제목</th>
         <td><input type="text" id="reviewTitle" /></td>
      </tr>
      <tr>
         <th>내용</th>
         <td><textarea rows="15" id="reviewContent" /></textarea></td>
      </tr>
      
      <tr>
         <td class=btnRow  colspan="2">
         	<input class=photoAdd type="file" name="reviewPhoto"/>
            <a class=exit href="reviewList.jsp">취소</a>
            &nbsp;&nbsp;
            <button class=write id="writeBtn">작성 완료</button>
         </td>
      </tr>
      </table>
      </div>
   </body>
   	<script>
	
	/* 
	$(function(){
		$('a').click(function(){
			$('a').removeClass();
			$(this).addClass('on');
		});
	}); 
	*/
	
	
	var obj = {};
	obj.type = "POST";
	obj.dataType ="JSON";
	obj.error = function(e){console.log(e)};
	
	/* 	
	//로그인체크 메서드
	$(document).ready(function(){
		obj.url="./admin_loginCheck";
		obj.success = function(data){
			if(data.login){
				$("#admin_id").val(data.loginId);
			}else{
				alert("로그인이 필요한 서비스 입니다.");
				location.href ="a_login.jsp";	
			}
	}
		ajaxCall(obj);
	}); 
	*/
	
	// 글쓴 후 저장 버튼 클릭시 
	$("#writeBtn").click(function(){
		
		console.log($("input[name='reviewTitle']").val());
		console.log($("textArea[name='reviewContent']").val());
		
		obj.url="./review_write";
		obj.data ={};
		//제목, 내용만 작성 
		obj.data.user_Id = $("#userId").val();
		obj.data.review_title = $("#reviewTitle").val();
		obj.data.review_content = $("#reviewContent").val();
		obj.success = function(data){
			console.log(data);
			if(data.success>0){
				alert("글쓰기에 성공 했습니다.");
				//글쓰기 성공시 경로 설정 
				location.href = "reviewList.jsp";
			}else{
				alert("글쓰기에 실패 했습니다.");
			}
		}
		ajaxCall(obj);
	})
	
		function ajaxCall(param){
		$.ajax(param);
	}

	</script>
</html>

