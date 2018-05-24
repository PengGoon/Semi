<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			.buyListTable,.buyListTable td{
				border: 1px solid black;
				border-collapse: collapse;
				width: 1000px;
				text-align: center;
			}
			#buyListDiv{
				width: 1000px;
				margin: 0 auto;
			}
		</style>
	</head>
	<body>
	<jsp:include page="navi.jsp"></jsp:include>
		<div id="buyListDiv">
		<h3>결제</h3>
			<table class="buyListTable">
				<tr>
					<td>${info.prd_Name } 상품을 주문합니다.</td> 
				</tr>	
			</table><hr/>
			<table class="buyListTable">
				<tr>
					<th>배송지 정보</th>
				</tr>
			</table>
			<table class="buyListTable">
				<tr>
					<td>이름</td>
					<td id="name"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td id="phone"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td id="addr"></td>
				</tr>
			</table><hr/>
			<table class="buyListTable">
				<tr>
                <td colspan="2" class="ta">
                    	주문정보  
                </td>
                <td>상품금액</td>
                <td>상품수량</td>
                <td>배송비</td>
          </tr>
          <tr>
                <td class="ta"><img width="150" src="./upload/${list.newFileName1}"/></td>
                <td>${info.prd_Name }</td>
                <td>${info.prd_Price}원</td>
                <td>${param.prd_count }개</td>
                <td>0원</td>
          </tr>
          <!-- <tr>
                <td class="ta"><img src="#"></td>
                <td>삼겹살</td>
                <td>10,000원</td>
              <td>2,500원</td>
          </tr> -->
          <tr>
               <td rowspan="2" class="tds">총 주문금액</td>
                <td class="tda"></td>
                <td class="tda">총 상품금액</td>
                <td colspan="2" class="tt">${info.prd_Price*param.prd_count }원</td>
          </tr>
          <tr>
                <td class="tdb"></td>
                <td class="tdb">배송비</td>
                <td colspan="2">0원</td>
          </tr>
          <tr>
                <td colspan="2" class="tds"></td>
                <td class="tds">총 주문금액</td>
                <td colspan="2">${info.prd_Price*param.prd_count }원</td>
          </tr>
			</table>
			<br/>
			<table>
				<tr>
					<th>결제 수단</th>
				</tr>
			</table>
			<table>
				<tr>
					<th>결제방법 <td><input type="radio">신용카드</td></th>
				</tr>
			</table>
			<br/>
			<button id="cancle">취소</button>
			<button id="buy">결제하기</button>
		</div>
	</body>
	<script>
	var id = "${sessionScope.loginUserId}";
	var prd_id = "${param.prd_id}";
	var sell_id = "${param.sell_id}";
	var prd_count = "${param.prd_count}";
	var cart_id = "${param.cart_id}";
	 $(document).ready(function(){
		if(id == "") {
			alert("로그인이 필요한 서비스입니다.");
			history.back();
		}
		 
		$.ajax({
			type : "post",
			url : "./prd2_user",
			data : {
				id:id,
			},
			dataType : "json",
			success : function(data) {//인자 값은 서버에서 주는 메시지
				$("#name").text(data.dto3.user_Name);
				$("#phone").text(data.dto3.user_Phone);
				$("#addr").text(data.dto3.user_Addr);
				//html,text
			},
			error : function(err) {//인자 값은 서버에서 주는 에러 메시지
				console.log(err)
			}
		}); 
	});
	
		$("#cancle").click(function(){
			location.href="index.jsp"; 
		});
		
		$("#buy").click(function(){
			$.ajax({
				type : "post",
				url : "./prd2_purchase",
				dataType : "json",
				data : {
					user_id: "${sessionScope.loginUserId}", 
					prd_id: prd_id,
					sell_id: sell_id,
					cart_id: cart_id,
					// 주문상태 부분(미수정)
					pur_count: prd_count,
					pur_state: "주문중"
				},
				success : function(data) {
					alert(data.msg);
					prd_id = null;
					location.href = "index.jsp";
				},
				error : function(err) { console.log(err) }
			});
	}); 
		
	</script>
</html>