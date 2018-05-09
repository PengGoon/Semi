<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			body{
				min-width : 3100px;  
         		margin : 0 auto;
			}
            a{
                text-decoration: none;
              }

            table {
                     width: 50%;
                     border-top: 1px solid;
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
                    .name, .address, .phone{
                    	width: 100px;
                    	padding: 10px 20px;
                    }
		</style>
	</head>
	<body>
		<h3>결제</h3>
		<div>
			<table>
				<tr>
					<th><img src="#"> 안심 외 1개의 상품을 주문합니다.</th> 
				</tr>	
			</table><hr/>
			<table>
				<tr>
					<th>배송지 정보</th>
				</tr>
			</table>
			<table>
				<tr>
					<td class="name">이름</td>
					<td></td>
				</tr>
				<tr>
					<td class="phone">연락처</td>
					<td></td>
				</tr>
				<tr>
					<td class="address">주소</td>
					<td></td>
				</tr>
			</table><hr/>
			<table>
				<tr>
                <td colspan="2" class="ta">
                    	주문정보  
                </td>
                <td>상품금액</td>
                <td>배송비</td>
          </tr>
          <tr>
                <td class="ta"><img src="#"></td>
                <td>안심</td>
                <td>10,000원</td>
                <td>2,500원</td>
          </tr>
          <tr>
                <td class="ta"><img src="#"></td>
                <td>삼겹살</td>
                <td>10,000원</td>
              <td>2,500원</td>
          </tr>
          <tr>
                <td rowspan="2" class="tds">총 주문금액</td>
                <td class="tda"></td>
                <td class="tda">총 상품금액</td>
                <td class="tdz">25,000원</td>
          </tr>
          <tr>
                <td class="tdb"></td>
                <td class="tdb">배송비</td>
                <td>5,000원</td>
          </tr>
          <tr>
                <td colspan="2" class="tds"></td>
                <td class="tds">총 주문금액</td>
                <td>30,000원</td>
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
	$("#cancle").click(function(){
		location.href="prd_detailForm.jsp"; 
	});
	$("#buy").click(function(){
		location.href="buy1.jsp"; 
	});
	</script>
</html>