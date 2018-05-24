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
	margin: 0px;
	padding: 0px;
	min-width: 100%;
	overflow-x: hidden; 
	overflow-y: scroll;
}
/* 마켓 타이틀 공간 */
.jbTitle {
	position: relative;
	left: 40%;
	margin: 20 0 0 0;
}
/* 마켓 타이틀 폰트 색상 */
#market {
	color: #000000;
}

/* 스크롤에 따라 움직이는 메뉴바 구현을 위한 속성 */
.jbFixed {
	position: fixed;
	top: 0px;
}

/* 스크롤에 따라 움직이는 카테고리 구현을 위한 속성 */
.jcFixed {
	position: fixed;
	top: 70px;
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
	height: 70px;
	margin: 0;
	padding: 0;
	z-index: 1;
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
	height:48px;
	color: white;
}
/* li중 신상품 테두리 설정 */
.menuBody .new{
	border-right: 1px solid gray;
}
/* li중 신상품 기본 상태 속성 */
.menuBody #new{
	color: black;
	text-decoration: none;
}
/* li중 신상품 마우스오버시 속성 */
.menuBody #new:hover {
	color: limegreen;
	text-decoration: underline;
}
/* 신상품 미선택, 선택 시 텍스트 색상 변경 */
.new.on{
	color:limegreen;
	font-weight: 800;
}
/* li중 인기상품 기본 상태 속성 */
.menuBody #fav{
	color: black;
	text-decoration: none;
}
/* 선택시 색상 변경 */
.menuBody #fav.on{
	color: limegreen;
	text-decoration: none;
}
/* li중 인기상품 테두리 설정 */
.menuBody .fav{
	border-right: 1px solid gray;
}
/* li중 인기상품 마우스 오버시 속성 */
.menuBody #fav:hover {
	color: limegreen;
	text-decoration: underline;
}
/* 선택시 색상 변경 */
.menuBody #new.on{
	color: limegreen;
	text-decoration: none;
}
/* 우측 상단 로그인 관리 바 속성 */
.rightMenu {
	position: absolute;
	float: right;
	top:10px;
	right:0px;
	width : 700px;
	margin: auto;
}
/* 우측 상단 로그인 관리 바 ul 속성 */
.rightMenu ul {
	margin: 5px 10px;
	padding: 0 5 0 5;
	list-style-type: none;
}
/* 우측 상단 로그인 관리 바 li 속성 */
.rightMenu li {
	float:left;
	border-right: 1px solid gray;
	padding: 0 20px 0 0px ;
	margin:0 0 0 15px;
	text-align: center;
}
/* 우측 상단 로그인 관리 바 a태그 속성 */
.rightMenu a{
	text-decoration: none;
	font-weight: 600;
	color: gray;
}
/* 로그인 상태(안녕하세요, id 님) 타이틀 */
.rightMenu h3{
	position:absolute;
	float: right;
	right: 300px;
}
/* 장바구니 아이콘 */
.cart {
	float: left;
	width: 40px;
	height: 40px;
	margin-left: 200px;
}
/* 장바구니 마우스오버시 말풍선 위치*/
.arrow_box {
  margin-left:565px;
  margin-top:0px;
  display: none;
  position: absolute;
  padding: 16px;
  -webkit-border-radius: 8px;
  -moz-border-radius: 8px;  
  border-radius: 8px;
  background: #333;
  color: #fff;
}
/* 생성된 말풍선 속성 */
.arrow_box:after {
  position: absolute;
  left: 100%;
  top: 50%;
  width: 0;
  height: 0;
  float:right;
  margin-top: -10px;
  border: solid transparent;
  border-color: rgba(51, 51, 51, 0);
  border-left-color: #333;
  pointer-events: none;
  content: " ";
}
/* 장바구니 영역 마우스 오버시 말풍선 생성 */
.cart:hover + p.arrow_box {
  display: block;
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
	margin: -10 0 0 40;
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
	z-index: 2;
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
	display: block; 
	float:left;
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
				<a href="userJoinSelect.jsp"><li id="navi_join"></li></a>
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
				<li class=fav><a id="fav" href="./prd_bHitlist.jsp">인기상품</a></li>
				<li class=new><a id="new" href="./prd_datelist.jsp">신상품</a></li>
			</ul>
			<div><a href="./cartList.jsp"><img class="cart" src="image/cart.png"/>
			<p class="arrow_box">장바구니</p>
			</a></div>
			<div class="searchBar">
				<input type="text" id="search" />
				<button onclick="search()">
					<img src="image/search.png">
				</button>
			</div>
		</div>
	</div> <!-- menuBody  -->
	
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
	
	
<!--  우측 최근 본 상품  
	<div class="content">
		<div class="fly">
			<ul style="padding-left: 0px;">
				<span style="font-size: 10px">최근본상품</span>
				<li><a href="#"><img src=""></a></li>
				<li><a href="#"><img src=""></a></li>
			</ul>
		</div>
	</div>
	 -->
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
			$("#navi_join").html("회원가입");
		}else{
			$("#loginst1").html("로그아웃");
			$("#loginst2").attr("href", "logout");
			$("#navi_join").html("");
			$("#myPage1").html("마이페이지");
			$("#myPage2").attr("href", "myPage.jsp");
			if(loginUserId != ""){
				$(".rightMenu h3").html("안녕하세요, "+loginUserId+"님");
			}else if(loginSellerId != ""){
				$(".rightMenu h3").html("안녕하세요, [판매자]"+loginSellerId+"님");
			}
		}
		
	});
	
	// 검색바 기능
	function search() {
		location.href = "./prd_search?search_name=" + $("#search").val();
	}
	
	// 카테고리 슬라이드 기능 
	$("#flip").click(function() {
		$("#category").slideToggle("fast");
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
	
	$(".cart").click(function(){
		$.ajax({
			type : "post",
			url : "./cartList", //경로 이동 
			dataType : "json",
			success : function(data) {
				console.log(data);
				if(loginUserId != ""){
					location.href = "cartList.jsp";
				}else if(loginSellerId == ""){
					alert("로그인이 필요한 서비스입니다.");
					location.href = "index.jsp";
				}else if(loginUserId == ""){
					alert("개인 회원만 이용 가능한 서비스입니다.");
					location.href = "index.jsp";
				}
			},
			error : function(err) {
				console.log(err)
			}
		});
	}); 

</script>
</html>