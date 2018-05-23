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
			min-width : 2750px;  
        	margin : 0 auto;
      	}
		.jbTitle {
			text-align: center;
		}
		
		.jbMenu {
			text-align: center;
			background-color: yellow;
			padding: 10px 0px;
			width: 100%;
		}
		.jbFixed {
        	position: fixed;
        	top: 0px;
      	}

           li{
                        list-style: none;
                        padding: 5px 10px;
                        text-align: left;
                        float: left;
                        width: 300px;
                        text-align: center;
                        border: 1px solid black; 

                    }
                    a{
                        text-decoration: none;
                    }

                    table {
                            width: 50%;
                            border-top: 1px solid #444444;
                            border-collapse: collapse;
                          }
                    th{
                        border-bottom: 1px solid #444444;
                        padding: 10px;
                      }
                    td{
                        padding: 10px;
                         border-bottom: 1px solid #444444;
                        border-right:  1px solid #444444;
                    }
                    .ta{
                        border-left: 1px solid #444444;
                    }
                    .tds{
                        border-right: 1px solid #ffffff;
                        border-left: 1px solid #444444;
                    }
                    .tda{
                        border-bottom: 1px solid #ffffff;
                        border-right:  1px solid #ffffff;
                    }
                    .tdb{
                        border-right:  1px solid #ffffff;
                    }
                    .tdz{
                        border-bottom: 1px solid #ffffff;
                    }
                    #totalPrice{
                    	border-bottom: 1px solid #ffffff;
                    }
	</style>
	<body>
        <table>
          <tr>
                <td colspan="2" class="ta">상품정보</td>
                <td>수량</td>
                <td>상품금액</td>
                <td>배송비</td>
          </tr>
          <tr>
                <td class="ta"><img width="100" src="./upload/${dto.newFileName}"/></td>
                <td>${dto.prd_name}</td>
                <td>${param.prd_count }개</td>
                <td>${dto.prd_price}원</td>
                <td>0원</td>
          </tr>
          <tr>
                <td rowspan="2" class="tds">총 주문금액</td>
                <td class="tda"></td>
                <td class="tda">총 상품금액</td>
                <td colspan="2" id="totalPrice"></td>
          </tr>
          <tr>
                <td class="tdb"></td>
                <td class="tdb">배송비</td>
                <td colspan="2">0원</td>
          </tr>
          <tr>
                <td colspan="2" class="tds"></td>
                <td class="tds">총 주문금액</td>
                <td colspan="2" id="totalDelieveryPrice"></td>
          </tr>
        </table>
        <button id="continue">쇼핑 계속하기</button>&nbsp;&nbsp;&nbsp;&nbsp;<button id="buy">구매하기</button>
	</body>
	<script>
		var p = "${dto.prd_price}";
		var cnt = "${param.prd_count}";
		
		$("#continue").click(function(){
   	 		location.href="index.jsp"; 
    	});
		
		// prd_id, sell_id 필요
		$("#buy").click(function(){
			$.ajax({
   	 			type : "post",
				url : "./cartBuy",
				dataType : "json",
				data : {
					prd_id: "${dto.prd_id}",
				},
				success : function(data) {
					/* console.log(data);
					console.log(data.dto.prd_id);
					console.log(data.dto.sell_Id);
					console.log(cnt); */
					location.href = "./prd2_buy?prd_id="+data.dto.prd_id+"&sell_id="+data.dto.sell_Id+"&prd_count="+cnt;
				},
				error : function(err) { console.log(err) }
   	 		});
    	});
		
		$(document).ready(function() {
			$("#totalPrice").text(p*cnt+"원");
			$("#totalDelieveryPrice").text(p*cnt+"원");
		});
	</script>
</html>