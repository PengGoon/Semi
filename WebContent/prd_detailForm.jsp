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
#detailTable table,#detailTable tr,#detailTable th {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}
#pic {
	width: 500px;
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
			<h2>${info.cateFirst_Id } > ${info.cateSecond_Id }</h2>
			<table>
				<tr>
					<th id="pic" colspan="2" rowspan="7"><img width="500" src="./upload/${list.newFileName1}"/></th>
					<th colspan="2" style="width: 500px">
						<h2>${info.prd_Name }</h2>
					</th>
				</tr>
				<tr>
					<th style="width: 100px">판매자</th>
					<th style="width: 400px">${info.sell_Id }</th>
				</tr>
				<tr>
					<th>판매가(100g)</th>
					<th>${info.prd_Price }</th>
				</tr>
				<tr>
					<th>원산지</th>
					<th>${info.prd_From }</th>
				</tr>
				<tr>
					<th>조회수</th>
					<th>${info.prd_bHit }</th>
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
						<button onclick = "location.href ='prd2_buy?prd_id=${info.prd_Id}'">바로결제</button>
						<button id="cart">장바구니 추가</button> 
						<button id="restock">재입고 알림</button>
					</th>
				</tr>
				<tr>
					<th colspan="4" width="1000px" height="300px">
						<img width="500" src="./upload/${list.newFileName2}"/>
						<img width="500" src="./upload/${list.newFileName3}"/>
					</th>
				</tr>
				<tr>
					<th width="140px"><h3>글 내용</h3></th>
					<th height="300px" colspan="3">${info.prd_Content }</th>
				</tr>
			</table>
		</div>
		<jsp:include page="reviewList.jsp"></jsp:include>
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