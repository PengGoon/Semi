<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    	#mem_del{
			float : right;
			margin-right: 100px;
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
		#regist{
			background-color: gray;
		}
		h2{
			margin-left : 15px;
		}
		h4{
			margin-left : 22px;
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
		<h5> <%=request.getSession().getAttribute("loginId") %> , 로그인 중 <button onclick="location.href='a_login.jsp'">로그아웃</button></h5>
		<br/><br/>
		<h2>판매자 등록</h2>
		<h4>판매자 등록을 승인 또는 거부할 수 있습니다. </h4>
		<jsp:include page="seller_accept.jsp"></jsp:include>
		
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