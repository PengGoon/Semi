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
#detailTable table, tr, th {
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

#updateForm, #save{
	float: right;
}

#detailTable input[type='text']{
	font-size: 20;
	text-align: center;
	width: 80%;
	border-width: 0;
}

#detailTable #prd_Name{
	font-size: 40;
	text-align: center;
	border-width: 0;
}

#detailTable textarea{
	font-size: 20;
	width: 100%;
	height: 300px;
	resize: none;
	border-width: 0;
}
</style>
<body>
	<jsp:include page="seller_navi.jsp"></jsp:include>
	<div id="menuCenter">
		<button id="updateForm">수정</button>
		<button id="save" style="display:none">저장</button>
		<button id="del">삭제</button>
		<div id="detailTable">
			<h2>${info.cateFirst_Id } > ${info.cateSecond_Id }</h2>
			<table>
				<tr>
					<th id="pic" colspan="2" rowspan="7"><img width="500" src="./upload/${list.newFileName1}"/></th>
					<th colspan="2" style="width: 500px">
						<input type="hidden" id="prd_Id" value="${info.prd_Id }" />
						<input type="text" class="edit" id="prd_Name" value="${info.prd_Name }" readonly/>
					</th>
				</tr>
				<tr>
					<th style="width: 100px">판매자</th>
					<th style="width: 400px"><input type="text" id="sell_Id" value="${info.sell_Id }" readonly/></th>
				</tr>
				<tr>
					<th>판매가(100g)</th>
					<th><input type="text" class="edit" id="prd_Price" value="${info.prd_Price }" readonly/></th>
				</tr>
				<tr>
					<th>원산지</th>
					<th><input type="text" class="edit" id="prd_From" value="${info.prd_From }" readonly/></th>
				</tr>
				<tr>
					<th>조회수</th>
					<th><input type="text" id="prd_bHit" value="${info.prd_bHit }" readonly/></th>
				</tr>
				<tr>
					<th>물품수량</th>
					<th><input type="text" class="edit" id="prd_Count" value="${info.prd_Count }" readonly/></th>
				</tr>
				<tr>
					<th colspan="2">
						<button id="purchase">바로결제</button> 
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
					<th height="300px" colspan="3"><textarea class="edit" id="prd_Content" readonly>${info.prd_Content }</textarea></th>
				</tr>
			</table>
		</div>
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
	
	//html 문서를 로드하자 마자 상세 정보를 가져 온다.
	var obj = {};
	var idx;
	obj.type="POST";
	obj.dataType="JSON";
	obj.error=function(e){console.log(e)};
	/*
	$(document).ready(function(){
		obj.url="./detailView";
		obj.success = function(data){
			console.log(data);
			if(data.login){
				printInfo(data.dto);
			}else{
				alert("로그인이 필요한 서비스 입니다.");
				location.href="index.html";
			}
		};
		ajaxCall(obj);
	});
	*/
	
	$("#updateForm").click(function(){
		$("#save").css("display","inline");
		$(".edit").css("border-width","2px");
		$(".edit").attr("readonly",false);
		$("#updateForm").css("display","none");
	});
	
	//수정 요청
	$("#save").click(function(){
		obj.url="./prd_update";
		obj.data={
			"prd_Id":$("#prd_Id").val(),
			"prd_Name":$("#prd_Name").val(),
			"prd_Price":$("#prd_Price").val(),
			"prd_From":$("#prd_From").val(),
			"prd_Count":$("#prd_Count").val(),
			"prd_Content":$("#prd_Content").val()
		};
		obj.success=function(data){
			console.log(data);
			//성공,실패: 상세보기 페이지
			if(data.success == 1){
				alert("수정이 성공 했습니다.");
				location.href="prd_sellerdetail?prd_id="+$("#prd_Id").val();
			}else{
				alert("수정이 실패 했습니다.");
			}
		};
		ajaxCall(obj);
	});
	
	function ajaxCall(param){
		console.log(param);
		$.ajax(param);
	}
</script>
</html>