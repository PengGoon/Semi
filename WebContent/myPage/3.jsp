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
		    display:inline-block;
		}

            .myPage li{
                list-style: none;
                padding: 5px 10px;
                text-align: left;
                float: left;
                width: 200px;
                text-align: center;
                border: 1px solid black; 
                
            }
            .myPage a{
                text-decoration: none;
            }
          	.content{width:1000px;height:2000px;
          	margin:0 auto;position:relative;
          	margin-top:50px;display:inline-blcok;}
			.fly{display:block; right:-90px; top:100px; position:absolute; z-index:9999; width:80px; background-color:#ffffff;height: 200px;border:1px #ccc solid;}
	</style>
	<body>
	<jsp:include page="../main/navi.jsp"></jsp:include>
		<div id="wrapper">
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
		</div>
		<div class="content">
    		<div class="fly">
    		<ul style="padding-left: 0px;">
    		<span style="font-size: 10px">최근본상품</span>
    		<li><a href="#"><img src="#"></a></li>
    		<li><a href="#"><img src="#"></a></li>
    		</ul>
    		</div>
		</div>
		
	</body>
    <script>
      $(window).scroll(function(){
           
           
            var sct = $(this).scrollTop();
            
            $('.fly').stop().animate({
             'top':sct
             
            },500)
           
           }); 
   </script>
</html>