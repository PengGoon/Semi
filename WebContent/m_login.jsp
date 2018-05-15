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
            
            .dia{
                margin:0 auto;
                width: 250px;
            }
            .dib{
                margin:0 auto;
                width: 150px;
            }
            .dic{
            	margin: 0 auto;
            	width: 700px;
            }
       
      
	</style>
	<body>
		<div id="wrapper">
			<div class="jbTitle">
				<h1>Site Title</h1>
			</div>
			<div class="jbMenu">
				<p>First Menu Second Menu Third Menu Fourth Menu</p>
			</div>
			<ul class="muen">
	            <li>
	                <a  href="m_order.jsp">주문내역</a>
	            </li>
	            <li>
	                <a href="#">장바구니</a>
	            </li>
	            <li>
	                <a href="#">작성한후기</a>
	            </li>
	            <li>
	                <a href="m_login.jsp">개인정보수정</a>
	            </li>
	        </ul>
	        <br><br><br><br>
	        <div class="dia">
	            <h1>비밀번호 재확인</h1>
	        </div>
	        <div class="dic">
	        	<h3>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시한번 입력해주세요. </h3>
	        </div>
	        <div class="dib">
	            <input type="password" id="userPw" placeholder="비밀번호" size="15"/>
	            
	        </div>
	        <br>
	        <div class="dib">
	             <input id="loginBtn" type="button" value="비밀번호재확인"/>
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
		
		$("#loginBtn").click(function(){
			location.href="m_update.jsp";
			//키와 값으로 복수개가 들어간다.
			//type: [post|get], url: 어디로 보낼 것인가? 
			//data: 어떤 파라메터와 값?, dataType: [json|xml|text|html|jsonp]
			//success: 성공시 할 일, error: 실패시 할 일
			/* $.ajax({
				type:"post",
				url:"./login",
				data:{
					pw:$("#userPw").val()
				},
				dataType:"json",
				success:function(data){//인자 값은 서버에서 주는 메시지
					console.log(data);
					if(data.success){
						alert("로그인에 성공 했습니다.");	
						location.href="8.jsp";
					}else{
						alert("로그인에 실패 했습니다.");
					}
				},
				error:function(err){//인자 값은 서버에서 주는 에러 메시지
					console.log(err)
				}
			});
		});	 */
		
		
	</script>
</html>