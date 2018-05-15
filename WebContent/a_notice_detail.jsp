<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	</head>
	<style>
		body {
        	margin: 0px;
        	padding: 0px;
      	}
      	a{
      		text-decoration : none;
      	}
		.title {
			min-width : 1000px;
			margin : 0 auto;
		}
		h1{
			color : black; 
			line-height:70px;
			float : left; 	
		}
		.menu {
			float : right;
		}
		.menu li{
			 float: left;
			 color: black;
		     font-weight: 600;
		     font-size: 120%;
		}
		.menu a{
		    line-height:80px;
    		color : black;
    		padding: 0 15px; 
    		display: block;
		}
    	li{
    	   	list-style-type: none;
    	}
   		a:hover{
        	background-color: gray;
   		}
   		a.on{
   			background-color:gray;
   		}
    	.bar{
	        border: 1px solid white;
	        width: 100%;
	        height: 30px;
	        background-color: white;
    	}
    	.member{
    		min-width : 800px;
    	}
		#notice{
			background-color: gray;
		}

		#write-form td {
		    border: none;
		}
		#write-form textarea {
		    width: 99%;
		}
				h5{
			float : right;
		}
				#notice_form{
			margin:0 auto;
		}
		#write-form td {
		    border: none;
		}
		#write-form textarea {
		    width: 90%;
		}
		table{
    		border-top : 1px solid black;
    		border-collapse: collapse;
    		text-align: center;
			min-width : 700px;
			margin : 0 auto;
            height:300px; 
		}
		h3{
			text-align: center;
		}
		h2{
			margin-left : 15px;
		}
		 a{
      		text-decoration : none;
      	}
      	#save{
			display:none;
		}
	
	</style>
	<body>
		<div class="title">
			<h1><a href="a_main_user.jsp"><img src="아이콘.gif"/>Mar-KH-et</a></h1>		
			<ul class ="menu">		
				<li id="mem"><a href="a_main_user.jsp">회원관리</a></li>
				<li id="sell"><a href="a_seller.jsp">판매자관리</a></li>
				<li id="review"><a href="a_review.jsp">후기 관리</a></li>
				<li id="notice"><a href="a_notice.jsp">공지사항</a></li>
				<li id="regist"><a href="a_seller_re.jsp">판매자 등록</a></li>
			</ul>
		</div>
		<br/><br/><br/><br/><br/><br/>
		<hr/>
		<h5> <%=request.getSession().getAttribute("loginId") %> , 로그인 중 <button onclick="location.href='a_login.jsp'">로그아웃</button></h5>
		<br/><br/>
		<div id="notice_form"><h2>공지사항</h2></div>
		<h3>공지사항 글쓰기 </h3>
		
		<table id="write-form" >
			<tr>
				<td>작성자</td>
				<td><input type="text" id="admin_id" readonly/></td>
			</tr>
			<tr>
			    <td>제목</td>
			    <td><input class="edit"type="text" name="title" id="title"style="width: 90%;"  readonly/></td>
			</tr>
			<tr>
				<td>내용</td>
			    <td>
			        <textarea class="edit"  name="content" id="content" rows="15" cols="120" readonly></textarea>
			    </td>
			</tr>
		</table>
		<div style="text-align: center;padding-bottom: 15px;">
			<br/><br/>
			<a href="./a_notice.jsp">리스트 가기</a>
			<button id="updateForm">수정</button>
			<button id="save">저장</button>
		</div>
		
			</body>
	<script>
	
	$(function(){
		$('a').click(function(){
			$('a').removeClass();
			$(this).addClass('on');
		});
	});
	
	//상세 정보를 가져온다. 
	var obj = {};
	var idx;
	obj.type="POST";
	obj.dataType="JSON";
	obj.error=function(e){console.log(e)};
	
	$(document).ready(function(){
		console.log("상세보기");
		obj.url="./notice_detailView";
		console.log("url 넘어감 ");
		obj.success = function(data){
			console.log(data);
			if(data.login){
				console.log(data.login);
				printInfo(data.dto);
			}else{
				alert("로그인이 필요한 서비스 입니다.");
				location.href="a_login.jsp";
			}
		};
		ajaxCall(obj);
	});
	
	function printInfo(info){
		console.log(info);
		idx = info.idx;
		$("#admin_id").val(info.admin_id);
		$("#title").val(info.notice_title);
		$("#content").val(info.notice_content);
		
	}
	
	//수정 
	$("#updateForm").click(function(){
		$("#save").css("display","inline");
		$(".edit").css("border-width","1px");
		$(".edit").attr("readonly",false);
		$("#updateForm").css("display","none");
	});
	//수정 후 저장 버튼 클릭시 
	$("#save").click(function(){
		obj.url="./notice_update";
		obj.data={
				"admin_id":idx,
				"notice_title":	$("#title").val(),
				"notice_content": $("#content").val()
				
		};
		console.log(idx + "/" + $("#title").val());
		obj.success = function(data){
			console.log(data);
			//성공: 실패: 상세보기 페이지
			//메시지
			if(data.success==1){
				alert("수정이 성공 했습니다.");
				location.href="detail.html";
			}else{
				alert("수정이 실패 했습니다.");
			}
			
		};
		ajaxCall(obj);
	});
	

		function ajaxCall(param){
		$.ajax(param);

	}
	
	</script>
</html>
			
			
	