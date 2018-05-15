<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	</head>
	<style>
		#wrapper {
			width: 1000px;
		    margin: 0 auto;
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
                width: 200px;
                text-align: center;
                border: 1px solid black; 
                
            }
            a{
                text-decoration: none;
            }
              table,td,th {
                            border: 1px solid black; 
                            width: 0%;
                            padding: 10px;
                            border-top: 1px solid #444444;
                            border-collapse: collapse;
                            margin: 0 auto;
                          }
           .menuCenter{
           		width: 1000px;
           		margin: 0 auto;
           }
           .dbtn{
           		width: 100px;
           		margin: 10 730;
           }
	</style>
	<body>
		<div id="wrapper">
			<div class="jbTitle">
				<h1>Site Title</h1>
			</div>
			
			<div class="jbMenu">
				<p>주문내역</p>
			</div>
			<div class="menuCenter">
			<ul class="myPage">
	            <li>
	                <a  href="4.jsp">주문내역</a>
	            </li>
	            <li>
	                <a href="5.jsp">장바구니</a>
	            </li>
	            <li>
	                <a href="#">작성한후기</a>
	            </li>
	            <li>
	                <a href="6.jsp">개인정보수정</a>
	            </li>
	        </ul>
	        <br><br><br><br>
	      <table>
	          <tr>
	            <td>
	                <input type="checkbox">주문번호  
	            </td>
	            <td colspan="3">상품정보</td>
	            <td>수량</td>
	            <td>구매일</td>
	            <td>배송상태</td>
	            <td>관리</td>  
	          </tr>
	          <tr>
	                <td><input type="checkbox" value="">100</td>
	                <td ><img src="#"></td>
	                <td>안심</td>
	                <td>10,000원</td>
	                <td>1</td>
	                <td>2018.04.09</td>
	                <td>배송완료</td>
	                <td><button onclick="">후기작성</button></td>
	          </tr>
	          <tr>
	                <td><input type="checkbox" value="">95</td>
	                <td><img src="#"></td>
	                <td>삼겹살</td>
	                <td>15,000원</td>
	                <td>1</td>
	                <td>2018.04.09</td>  
	                <td>배송완료</td>
	                <td><button onclick="">후기작성</button></td> 
	          </tr>
	        </table>
	        
	        <div class="dbtn">
	        	<button class="btn" onclick="">내역삭제</button>
	        </div>
	        </div>
        </div>
	</body>
	<script>
		$(document).ready(function() {
			var jbOffset = $('.jbMenu').offset();
			$(window).scroll(function() {
				if ($(document).scrollTop() > jbOffset.top) {
					$('.jbMenu').addClass('jbFixed');
				} else {
					$('.jbMenu').removeClass('jbFixed');
				}
			});
		});
		
	</script>
</html>