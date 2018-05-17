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
      	a:visited{
      		color:black;
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
		#mem{
			background-color: gray;
		}
		h2{
			margin-left : 15px;
		}
		h5{
			float : right;
		}


	

	
	</style>
	<body>
		<div class="title">
			<h1><a href="a_main_user.jsp" id="market"><img src="아이콘.gif"/>Mar-KH-et</a></h1>		
			
			<ul class ="menu">
			
				<li id="mem"><a href="a_main_user.jsp">회원관리</a></li>
				<li id="sell"><a href="a_seller.jsp">판매자관리</a></li>
				<li id="review"><a href="a_review.jsp">후기 관리</a></li>
				<li id="notice"><a href="a_notice.jsp">공지사항</a></li>
				<li id="regist"><a href="a_seller_re.jsp">판매자 등록</a></li>
				
			</ul>
		</div>
		
		<br/><br/><br/>
		<br/>
		<br/><br/>
		<hr/>

		<h5> <%=request.getSession().getAttribute("loginId") %>, 로그인 중 <button onclick="location.href='a_login.jsp'">로그아웃</button></h5>
		<br/><br/>
		<h2>회원 관리</h2>

		
		<div class ="member">
			<table id="listTable">
				<tr>
					<th>체크</th>
					<th>회원 아이디</th>
					<th>회원 주소</th>
					<th>회원 번호</th>
					<th>가입일</th>
				</tr>
			</table>
			<br/>
			<input id="mem_del" type="button" value="삭제" />
		</div>
	</body>
	<script>
	
	var loginId = "${sessionScope.loginId}";
	console.log(loginId);
	
	$(function(){
		$('a').click(function(){
			$('a').removeClass();
			$(this).addClass('on');
		});
	});
	
	$("#sell").click(function(){
		location.href = "seller_list.jsp";
	});
	
	$("#regist").click(function(){
		location.href = "seller_accept.jsp";
	});
	
	//리스트 호출(ajax)
	var obj = {};
	obj.error = function(e){console.log(e)};
	obj.type="post";
	obj.dataType="json";
	
	
	$(document).ready(function(){
		obj.url="./admin_main";
		obj.success = function(data){
			console.log(data);
			if(data.login){
				//리스트 보여주기
				listPrint(data.list);
			}else{
				alert("로그인이 필요한 서비스 입니다.");
				location.href="a_login.jsp";
			}
		}
		ajaxCall(obj);
	});
	function listPrint(list){
		console.log(list);
		var content ="";
		list.forEach(function(item,idx){
			content += "<tr>";
			content += "<td><input type='checkbox' value='"+item.user_Id+"'/></td>"; 
			content += "<td>"+item.user_Id+"</td>"; 
			content += "<td>" +item.user_Addr+"</td>"; 
			content += "<td>" +item.user_Phone+"</td>"; 
			content += "<td>" +item.user_Date+"</td>"; 
			content += "</tr>";
			console.log(item);
		});
		$("#listTable").append(content);
	}
	
	//회원삭제 (선택 삭제)
	 $("#mem_del").click(function(){
		obj.url="./admin_useDel";
		var checked = [];
		//$(elem).each() == elem.forEach()
		$("input[type='checkbox']:checked").each(function(){
			checked.push($(this).val());
		});
		console.log(checked);
		obj.data={delList:checked};
		console.log(obj.data);
		obj.success = function(data){
			if(data.success){
				
				confirm ("선택한 회원을 삭제 하시겠습니까?");
				if(confirm ==true){
					alert("삭제 되었습니다.")
				}
			}else{
				alert("삭제에 실패 했습니다.");
			}
			location.href = "a_main_user.jsp";
			
		}
		console.log(obj);
	    ajaxCall(obj);
	}); 

	function ajaxCall(param){
		console.log(param);
		$.ajax(param);
	}
	
	
	
	</script>
</html>