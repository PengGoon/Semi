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
		min-width: 900px;
	}
	
	.jbTitle {
		left: 40%;
	}
	
	.jbFixed {
		position: fixed;
		top: 0px;
	}
	
	.menuCenter {
		width: 1000px;
		margin: 0 auto;
	}
	
	.menu {
		text-align: center;
		background-color: yellow;
		width: 100%;
		height: 45px;
	}
	
	.menu ul {
		margin: 0px;
		list-style-type: none;
	}
	
	.menu li {
		float: left;
		background-color: yellowgreen;
		width: 180px;
		height: 40px;
		text-align: center;
		color: white;
		font-weight: 600;
		font-size: 140%;
		padding-top: 5px;
	}
	
	.menu li:hover {
		background-color: orange;
	}
	
	.rightMenu {
		float: right;
		width: 280px;
		margin-top: 20px;
	}
	
	.rightMenu ul {
		margin: 0 auto;
		list-style-type: none;
	}
	
	.rightMenu ul li {
		float: left;
		border-left: 1px solid black;
	}
	
	div#category {
		width: 1000px;
		margin: 0 auto;
		display: none;
		position: absolute;
	}
	
	div#category ul {
		float: left;
	}
	
	div#category th {
		padding: 0px 35px;
		text-align: center;
	}

</style>
<body>
	<div class="menuCenter">
		<div class="rightMenu">
			<ul>
				<li style="border-left: none;">옥지훈 님</li>
				<a href="#"><li>로그아웃</li></a>
				<a href="#"><li>공지사항</li></a>
			</ul>
		</div>

		<div class="jbTitle">
			<h1>마켓</h1>
		</div>
	</div>
	<hr />
	<div class="menu">
		<div class="menuCenter">
			<ul>
				<a href="#"><li>등록물품보기</li></a>
				<a href="#"><li>주문내역보기</li></a>
				<a href="#"><li>회원정보수정</li></a>
				<a href="#"><li>판매권한신청</li></a>
			</ul>
		</div>
	</div>
	<div class="menuCenter">

	</div>
</body>
<script>
	$(document).ready(function() {
		var jbOffset = $('.menu').offset();
		$(window).scroll(function() {
			if ($(document).scrollTop() > jbOffset.top) {
				$('.menu').addClass('jbFixed');
			} else {
				$('.menu').removeClass('jbFixed');
			}
		});
	});

	$("#flip").click(function() {
		$("#category").slideToggle("fast");
	});
	$(window).scroll(function() {

		var sct = $(this).scrollTop();

		$('.fly').stop().animate({
			'top' : sct

		}, 500)

	});
</script>
</html>