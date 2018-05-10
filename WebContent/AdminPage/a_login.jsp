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
		.title {
			position: fixed;
			width: 100%;
		}
		.menu {
			text-align: center;
		}
		.text{
			width : 250px;
			height: 30px;
		}
		a{
      		text-decoration : none;
      	}
		a:visited{
      		color:black;
      		text-decoration : none;
      		
      	}
	</style>
	<body>
		<div class="title">
			<h1><a href="a_main_user.jsp"><img src="아이콘.gif"/>Mar-KH-et</a></h1>
			<hr/>
			<form action="../admin_login" method="post">
			<div class="menu">
				<h1>Mar-KH-et 관리자 페이지</h1>
				
				<input class="text" type="text" name="admin_id" placeholder="아이디 입력"/>
				<br/><br/>
				
				<input class="text" type="password" name="admin_pw" placeholder="비밀번호 입력"/>
				<br/><br/>
				
				<button id="admin_login">로그인</button>
			</div>
			</form>
		</div>
	</body>
	<script>
    var msg = "${msg}";
    
    if(msg != ""){
    	alert(msg);
    }
	</script>
</html>