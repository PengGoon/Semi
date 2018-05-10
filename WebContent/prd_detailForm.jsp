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
#menuCenter {
	width: 1000px;
	margin: 0 auto;
}
table, tr, th {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}
#pic {
	width: 450px;
	height: 450px;
}
.mainImg {
	background-color: aqua;
	width: 1000px;
	height: 300px;
}
</style>
<body>
	<jsp:include page="navi.jsp"></jsp:include>
	<div id="menuCenter">
		<div id="detailTable">
			<table>
				<tr>
					<th style="width: 450px; height: 450px;" rowspan="7">사진</th>
					<th colspan="2" style="width: 350px">
						<h2>상품명</h2>
					</th>
				</tr>
				<tr>
					<th style="width: 100px">판매자</th>
					<th>홍길동</th>
				</tr>
				<tr>
					<th>판매가(100g)</th>
					<th>10000</th>
				</tr>
				<tr>
					<th>원산지</th>
					<th>국내산</th>
				</tr>
				<tr>
					<th>조회수</th>
					<th>0</th>
				</tr>
				<tr>
					<th>구매수량</th>
					<th>
						<button id="dec">-</button> 
						<span id="msg"></span>
						<button id="inc">+</button>
					</th>
				</tr>
				<tr>
					<th colspan="2">
						<button id="purchase">바로결제</button> 
						<button id="cart">장바구니 추가</button> 
						<button id="restock">재입고 알림</button>
					</th>
				</tr>
			</table>
		</div>
		<br/>
		<div class="mainImg"></div>
	</div>
</body>
<script>
	var cnt=0;
	$("#inc").click(function() {
		cnt=cnt+1;
		$("#msg").text(cnt);
	});

	$("#dec").click(function() {
		cnt=cnt-1;
		if(cnt<0){
			alert("수량을 다시 입력해주세요.");
			cnt=0;
		};
		
		$("#msg").text(cnt);
	});
	
	$("#cart").click(function(){
		alert("선택하신 상품을 장바구니에 담았습니다.")
	});
</script>
</html>