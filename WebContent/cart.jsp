<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<style>
#cartTable,#cartTable td{
	border: 1px solid black;
	border-collapse: collapse;
	width: 1000px;
	text-align: center;
}
#cartDiv{
	width: 1000px;
	margin: 0 auto;
}
</style>
<body>
	<jsp:include page="navi.jsp"></jsp:include>
	<div id="cartDiv">
	<table id="cartTable">
		<tr>
			<td colspan="2" class="ta">상품정보</td>
			<td>수량</td>
			<td>상품금액</td>
			<td>배송비</td>
		</tr>
		<tr>
			<td class="ta"><img width="100" src="${dto.newFileName}" /></td>
			<td>${dto.prd_name}</td>
			<td>${param.prd_count }개</td>
			<td>${dto.prd_price}원</td>
			<td>0원</td>
		</tr>
		<tr>
			<td rowspan="3" colspan="2" class="tds"></td>
			<td class="tda">총 상품금액</td>
			<td colspan="2" id="totalPrice"></td>
		</tr>
		<tr>
			<td class="tdb">배송비</td>
			<td colspan="2">0원</td>
		</tr>
		<tr>
			<td class="tds">총 주문금액</td>
			<td colspan="2" id="totalDelieveryPrice"></td>
		</tr>
	</table>
	<button id="continue">쇼핑 계속하기</button>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<button id="buy">구매하기</button>
	</div>
</body>
<script>
	$(document).ready(function() {
		$("#totalPrice").text(p * cnt + "원");
		$("#totalDelieveryPrice").text(p * cnt + "원");
	});

	$.ajax({
		type : "post",
		url : "./cartList",
		dataType : "json",
		data : {
			user_id : "${sessionScope.loginUserId}",
		},
		success : function(data) {
			console.log(data.list[0]);
		},
		error : function(err) {
			console.log(err)
		}
	});

	var p = "${dto.prd_price}";
	var cnt = "${param.prd_count}";

	$("#continue").click(function() {
		location.href = "index.jsp";
	});

	// prd_id, sell_id 필요
	$("#buy").click(
			function() {
				$.ajax({
					type : "post",
					url : "./cartBuy",
					dataType : "json",
					data : {
						prd_id : "${dto.prd_id}",
						cart_id : "${cart_id}"
					},
					success : function(data) {
						/* console.log(data);
						console.log(data.dto.prd_id);
						console.log(data.dto.sell_Id);
						console.log(cnt); */
						location.href = "./prd2_buy?prd_id=" + data.dto.prd_id
								+ "&sell_id=" + data.dto.sell_Id
								+ "&prd_count=" + cnt+"&cart_id="+data.dto.cart_id;
					},
					error : function(err) {
						console.log(err)
					}
				});
			});
</script>
</html>