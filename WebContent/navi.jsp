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
/* 메인 페이지  */
 body {
	resize:none;
	margin: auto 0px;
	padding: 0px;
	width: 100%;
}
/* 마켓 타이틀 공간 */
.jbTitle {
	position: relative;
	left: 40%;
	margin: 20 0 140 0;
}
/* 마켓 타이틀 폰트 색상 */
#market {
	color: #000000;
}
/* 추가 메뉴(카테고리, 인기상품, 신상품)를 위한 공간 속성 */
.jbFixed {
	position: fixed;
	top: 0px;
}
/* 메뉴바 중앙 정렬 설정을 위한  클래스 */
.menuCenter {
	width: 1000px;
	margin: 0 auto;
}
/* 상단 메뉴바 몸체 속성 */
.menuBody {
	text-align: center;
	background-color: white;
	border-bottom: 1px solid gray;
	width: 100%;
<<<<<<< HEAD
	height: 45px;
	margin: 150px 0 20px 0;
=======
	height: 70px;
	margin: 0;
	padding: 0;
	z-index: 1;
>>>>>>> c10a885a4ea24b17e932e517cdfce2ca4b4103b0
}
/* 메뉴바 몸체 ul 속성 */
.menuBody ul {
	margin: 0px;
	list-style-type: none;
}
/* 메뉴바 몸체 li 속성(카테고리, 신상품, 인기상품, +@ 부분) */
.menuBody li {
	float: left;
	width: 140px;
	height: 40px;
	text-align: center;
	color: black;
	font-weight: 600;
	font-size: 140%;
	padding-top: 5px;
}
/* li 중 카테고리 속성 설정 */
.menuBody #flip {
	background-color: limegreen;
<<<<<<< HEAD
=======
	height:48px;
>>>>>>> c10a885a4ea24b17e932e517cdfce2ca4b4103b0
	color: white;
}
/* li중 신상품 테두리 설정 */
.menuBody #new{
	border-right: 1px solid black;
}
/* li중 신상품 마우스오버시 속성 */
.menuBody #new:hover {
	color: limegreen;
	text-decoration: underline;
}
/* li중 인기상품 테두리 설정 */
.menuBody #fav{
	border-right: 1px solid black;
}
/* li중 인기상품 마우스 오버시 속성 */
.menuBody #fav:hover {
	color: limegreen;
	text-decoration: underline;
}
/* 우측 상단 로그인 관리 바 속성 */
.rightMenu {
	position: absolute;
	float: right;
	top:10px;
	right:50px;
	width : 700px;
	margin: auto;
}
/* 우측 상단 로그인 관리 바 ul 속성 */
.rightMenu ul {
	margin: 5 10;
	list-style-type: none;
}
/* 우측 상단 로그인 관리 바 li 속성 */
.rightMenu li {
	float:left;
	border-right: 1px solid black;
	padding: 0 30px 0 10px ;
	margin:0 0 0 15px;
	text-align: center;
}
/* 우측 상단 로그인 관리 바 a태그 속성 */
.rightMenu a{
	text-decoration: none;
	color: black;
}

.rightMenu h3{
	position:absolute;
	float: right;
	right: 150px;
}


/* 장바구니 아이콘 */
.cart {
	float: left;
	width: 40px;
	height: 40px;
	margin-left: 200px;
}
/* 검색바 */
.searchBar {
	float: right;
	border: 1px solid black;
	margin-right: 40px;
}
/* 검색바 입력창 */
.searchBar input {
	font-size: 18;
	border: 0;
	float: left;
	padding:0;
	width: 200px;
	height: 33px;
}
/* 검색바 돋보기아이콘 */
.searchBar img {
	margin: 5px 2px;
	width: 20px;
	height: 20px;
}
/* 카테고리 테이블 */
#catTable{
	border : 1px solid limegreen;
	margin: 0 0 0 40;
	background-color: white;
	padding: 10px 10px 10px 10px;
	color: black;
}
/* 테이블 내부 텍스트 좌측정렬 및 패딩 설정 */
#catTable th {
	padding: 10px 45px 10px 0px  ;
	text-align: left;
}
#catTable a{
	text-decoration: none;
	color: black;
}
/* 하위카테고리(소분류) 마우스오버시 */
#catTable a:hover {
	text-decoration: underline;
	color:limegreen;
	cursor: pointer;
}
/* 하위카테고리(소분류) 동작중일시 */
#catTable a:active{
	text-decoration: none;
	color: limegreen;
	cursor: pointer;
}
/* 카테고리  */
div#category {
	z-index: 2;
	width: 1000px;
	margin: 0 auto;
	display: none;
	position: absolute;
}

div#category ul {
	float: left;
}

.content {
	margin: 0 auto;
	position: relative;
	margin-top: 20px;
	display: inline-blcok;
}

.fly {
	display: block;
	right: 150px;
	top: 100px;
	position: absolute;
	z-index: 9999;
	width: 80px;
	background-color: #ffffff;
	height: 200px;
	border: 1px #ccc solid;
	text-align: center;
}

.fly li {
	list-style: none;
}

.fly img {
	border: none;
	list-style: none;
	height: 70px;
	display: block float:left;
	width: 75px;
	border: 1px #ccc solid;
	text-align: center
}

</style>

<body>
<!-- 바디 전체를 감싸는 Navi 클래스  -->	
<div class="Navi"> 

	<!--  메인페이지 타이틀  -->
	<div class="jbTitle">
		<h1>
			<a href="index.jsp" id="market" style="text-decoration: none"><img
				src="아이콘.gif" />Mar-KH-et</a>
		</h1>
	</div>

	<!--  우측상단 로그인 바  -->
		<div class="rightMenu">
			<ul>
				<a id="myPage2"><li id="myPage1"></li></a>
				<a id="loginst2"><li style="border-left: none" id="loginst1">로그인</li></a>
				<a href="userJoinSelect.jsp"><li>회원가입</li></a>
				<a href="notice.jsp"><li>공지사항</li></a>
			</ul>
			<br/>
			<h3 style="text-align: center;"></h3>
		</div>


	<!--  상단 메뉴바  -->
	<div class="menuBody">
		<hr/>
		<div class="menuCenter">
			<ul>
				<a href="#"><li id="flip">카테고리</li></a>
				<a href="./prd_bHitlist.jsp"><li id="fav">인기상품</li></a>
				<a href="./prd_datelist.jsp"><li id="new">신상품</li></a>
			</ul>
			<div><a href="./cartList.jsp"><img class="cart" src="image/cart.png"/></a></div>
			<div class="searchBar">
				<input type="text" id="search" />
				<button onclick="search()">
					<img src="image/search.png">
				</button>
			</div>
		</div>
	</div>
	<!--  카테고리(대분류)  -->
	<div class="menuCenter">
		<div id="category">
			<table id="catTable">
				<tr>
					<th><h3>정육/달걀</h3></th>
					<th><h3>생선</h3></th>
					<th><h3>채소</h3></th>
					<th><h3>과일</h3></th>
				</tr>
				<tr>
					<th><a href="prd_list?cateS_id=돼지고기">돼지고기</a></th>
					<th><a href="prd_list?cateS_id=고등어/갈치">고등어/갈치</a></th>
					<th><a href="prd_list?cateS_id=뿌리채소">뿌리채소</a></th>
					<th><a href="prd_list?cateS_id=제철과일">제철과일</a></th>
				</tr>
				<tr>
					<th><a href="prd_list?cateS_id=소고기">소고기</a></th>
					<th><a href="prd_list?cateS_id=오징어/낙지">오징어/낙지</a></th>
					<th><a href="prd_list?cateS_id=열매채소">열매채소</a></th>
					<th><a href="prd_list?cateS_id=수입과일">수입과일</a></th>
				</tr>
				<tr>
					<th><a href="prd_list?cateS_id=닭고기">닭고기</a></th>
					<th><a href="prd_list?cateS_id=조개류">조개류</a></th>
					<th><a href="prd_list?cateS_id=나물류">나물류</a></th>
				</tr>
			</table>
		</div>
	</div>
	<!--  우측 최근 본 상품   -->
	<div class="content">
		<div class="fly">
			<ul style="padding-left: 0px;">
				<span style="font-size: 10px">최근본상품</span>
				<li><a href="#"><img src=""></a></li>
				<li><a href="#"><img src=""></a></li>
			</ul>
		</div>
	</div>
	
</div>
<!-- 바디 전체를 감싸는 Navi 클래스  --> 	
</body>
<script>
	var loginUserId = "${sessionScope.loginUserId}";
	var loginSellerId = "${sessionScope.loginId}";

	$(document).ready(function() {
		if (loginUserId == "" && loginSellerId == "") {
			$("#loginst1").html("로그인");
			$("#loginst2").attr("href", "userLogin.jsp");
		}else{
			$("#loginst1").html("로그아웃");
			$("#loginst2").attr("href", "logout");
			$("#myPage1").html("마이페이지");
			$("#myPage2").attr("href", "myPage.jsp");
			if(loginUserId != ""){
				$(".rightMenu h3").html("안녕하세요, "+loginUserId+"님");
			}else if(loginSellerId != ""){
				$(".rightMenu h3").html("안녕하세요, [판매자]"+loginSellerId+"님");
			}
		}

		var jbOffset = $('.menuBody').offset();
		$(window).scroll(function() {
			if ($(document).scrollTop() > jbOffset.top) {
				$('.menuBody').addClass('jbFixed');
			} else {
				$('.menuBody').removeClass('jbFixed');
			}
		});
	});

	// 검색바 기능
	function search() {
		location.href = "./prd_search?search_name=" + $("#search").val();
	}
	
	// 카테고리 슬라이드 기능 
	$("#flip").click(function() {
		$("#category").slideToggle("fast");
	});
	$(window).scroll(function() {
		var sct = $(this).scrollTop();
		$('.fly').stop().animate({
			'top' : sct
		}, 500)
	});

	// 로그아웃 버튼 클릭시
	$("#logout").click(function logout() {
		$.ajax({
			type : "post",
			url : "./logout", //경로 이동 
			dataType : "json",
			success : function(data) {
				console.log(data);
				if (data.success) {
					alert("로그아웃에 성공 했습니다.");
					location.href = "index.jsp";
				} else {
					alert("로그아웃에 실패  했습니다.");
				}
			},
			error : function(err) {
				console.log(err)
			}
		});
	});
</script>
</html>