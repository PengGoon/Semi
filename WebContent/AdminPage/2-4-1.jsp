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
		table,th,td{
			border: 1px solid black;
			border-collapse: collapse;
			padding: 5px 10px;
		}
		table{
			width : 80%;
			align: center;
		}
		input[type='text']{
			width : 100%;
		}
		textarea{
			width : 100%
			resize : none;
		}
		td{
		 	text-align: center;
		}
		#notice{
			background-color: gray;
		}
		input[type='button']{
	
		
		}
		#write-form td {
		    border: none;
		}
		#write-form textarea {
		    width: 99%;
		}

	

	
	</style>
	<body>
		<div class="title">
			<h1><img src="아이콘.gif"/>Mar-KH-et</h1>		
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
		<jsp:include page ="NoticeWrite.jsp"/>
			</body>
	<script>
	
	$(function(){
		$('a').click(function(){
			$('a').removeClass();
			$(this).addClass('on');
		});
	});
	</script>
</html>
			
			
	