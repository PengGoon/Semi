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
		h2{
			margin-left : 15px;
		}
		h4{
			margin-left : 22px;
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
    	a:visited{
      		color:black;
      		text-decoration : none;
      	}
   		li:hover{
        	background-color: gray;
   		}
   		li.on{
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
    	table{
    		width : 90%;
    		align: center;
    		border-top : 1px solid black;
    		border-collapse: collapse;
    		text-align: center;
    		margin: auto;	
    	}
    	td,th{
			padding : 10px;
			border-bottom : 1px solid black;
    	}
    	th{
    		background-color: #bbdefb;
  		}
		td{
			background-color: #e3f2fd;
		}
		#notice{
			background-color: gray;
		}
		input[type='button']{
	
		
		}

	

	
	</style>
	<body>
		<div class="title">
			<h1><a href="2-1.jsp"><img src="아이콘.gif"/>Mar-KH-et</a></h1>		
			<ul class ="menu">
			
				<li id="mem"><a href="2-1.jsp">회원관리</a></li>
				<li id="sell"><a href="2-2.jsp">판매자관리</a></li>
				<li id="review"><a href="2-3.jsp">후기 관리</a></li>
				<li id="notice"><a href="2-4.jsp">공지사항</a></li>
				<li id="regist"><a href="2-5.jsp">판매자 등록</a></li>
				
			</ul>
		</div>
		
		<br/><br/><br/><br/><br/><br/>
		<hr/>
		<br/><br/>
		
        <h2>Notice</h2>
		<h4>공지사항 게시판 입니다.</h4>
		
		<div class ="member">

			<table>
				<tr>
					<th>체크</th>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회</th>
				</tr>
				<tr>
					<td class="che">
						<input type="checkbox"/>
					</td>
					<td class="idx"></td>
					<td class="user_Id"></td>
					<td class="user_Addr"></td>
					<td class="user_Phone"></td>
					<td class="reg_Date"></td>
				</tr>
			</table>
			<br/>
			<!-- <button id="no_write">글쓰기</button><button id="no_del">삭제</button> -->
			<center>
			<input id="no_write" type="button" value="글쓰기" onclick="location.href='2-4-1.jsp'" />
			<input type="button" value="삭제" onclick="nodel()"/> 
			</center>
			</div>
			
			</body>
	<script>
	
	$(function(){
		$('a').click(function(){
			$('a').removeClass();
			$(this).addClass('on');
		});
	});
	
	
	function nodel(){
        var con = confirm("정말로 삭제 하시겠습니까?");
        //"확인" 버튼을 눌렀을 경우
        if(con ==true){
            //삭제 처리(요청)
            alert("삭제가 완료 되었습니다.");
        }
	}
	
	</script>
</html>
			
			
	