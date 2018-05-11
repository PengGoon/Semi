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
				h5{
			float : right;
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
		<h5> <%=request.getSession().getAttribute("loginId") %> , 로그인 중 <button onclick="location.href='a_main_user.jsp'">로그아웃</button></h5>
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
			
			
	