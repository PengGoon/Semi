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
            min-width: 900px;
      	}
		.jbTitle {
			left: 40%;
        }
		.jbFixed {
        	position: fixed;
        	top: 0px;
      	}
      	.menuCenter{
      		width: 1000px;
		    margin: 0 auto;
      	}
        .menu {
			text-align: center;
			background-color: yellow;
			width: 100%;
			height: 45px;
		}
		.menu ul{
            margin: 0px;
	        list-style-type: none;
	    }
	    .menu li{
	        float: left;
	        background-color: yellowgreen;
	        width: 140px;
	        height : 40px;
	        text-align: center;
	        color: white;
	        font-weight: 600;
	        font-size: 140%;
	        padding-top: 5px;
	    }
	    .menu li:hover{
	        background-color: orange;
	    }
	    .rightMenu{
            float: right;
            width: 280px;
            margin-top: 20px;
	    }
	    .rightMenu ul {
	    	margin: 0 auto;
			list-style-type:none;
		}
		.rightMenu ul li {
            float: left;
			border-left: 1px solid black;
		}
        .searchBar{
            float: right;
            border: 1px solid black;
        }
        .searchBar input{
            font-size: 18;
            border: 0;
            float: left;
            padding: 12px;
            width: 200px;
        }
        .searchBar img{
            margin: 5px 2px;
            width: 30px;
            height: 30px;
        }
        div#category{
       		width: 1000px;
       		margin: 0 auto;
            display: none;
            position: absolute;
        }
        div#category ul {
			float: left;
		}
		div#category th {
			padding: 0px 35px;
			text-align: center;
		}
		.rightMenu ul li{padding:0 10px;}
		.search{width: 176px; height: 28px;}
		.btn{width: 50px; height: 28px;}
		.content{margin:0 auto;position:relative;margin-top:50px;display:inline-blcok;}
			.fly{display:block; right:-90px; top:100px;  position:absolute; z-index:9999; width:80px; background-color:#ffffff;height: 200px;border:1px #ccc solid;
					text-align: center;
			}
			.fly li{list-style: none;}
			.fly img{border:none;list-style:none;height: 70px; display:block    
                float:left;width:75px;border:1px #ccc solid;text-align:center}
		#cateS{
			position: 
		}
	</style>
	<body>
	<div class="menuCenter">
		<div class="rightMenu">
			<ul>
				<a href="./user/userLogin.jsp"><li id=flip">로그인</li></a>
				<a href="./user/userJoinSelect.jsp"><li>회원가입</li></a>
				<a href="#"><li>공지사항</li></a>
			</ul>
		</div>
		
		<div class="jbTitle"><h1>마켓</h1></div>
	</div>
	<hr/>
		<div class="menu">
			<div class="menuCenter">
				<ul>
			        <a href="#"><li id="flip">카테고리</li></a>
			        <a href="#"><li>신상품</li></a>
			        <a href="#"><li>인기상품</li></a>
			    </ul>
			    <div class="searchBar">
			    	<input type="text" name="search" />
	            	<button class="btn" id="btn" onclick="go">
	                	<img class="btn-img" src="../image/search.png">
	            	</button>
			    </div>
		    </div>
		</div>
		<div class="menuCenter">
			<div id="category">
				<table>
					<tr>
						<th><h3>정육/달걀</h3></th>
						<th><h3>생선</h3></th>
						<th><h3>채소</h3></th>
						<th><h3>과일</h3></th>
					</tr>
					<tr>
						<th><a href="/SemiProject/prd_list?cateS_id=돼지고기">돼지고기</a></th>
						<th><a href="#">고등어/갈치</a></th>
						<th><a href="#">뿌리채소</a></th>
						<th><a href="#">제철과일</a></th>
					</tr>
					<tr>
						<th><a href="#">소고기</a></th>
						<th><a href="#">오징어/낙지</a></th>
						<th><a href="#">열매채소</a></th>
						<th><a href="#">수입과일</a></th>
					</tr>
					<tr>
						<th><a href="#">닭고기</a></th>
						<th><a href="#">조개류</a></th>
						<th> <a href="#">나물류</a></th>
					</tr>
				</table>
			</div>
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
	$(document).ready(function() {
		var jbOffset = $('.menu').offset();
		$(window).scroll(function() {
			if ($(document).scrollTop() > jbOffset.top) {
				$('.menu').addClass('jbFixed');
			} else {
				$('.menu').removeClass('jbFixed');
			}
		});
	});
	
	$("#flip").click(function(){
    	$("#category").slideToggle("fast");
	});
	 $(window).scroll(function(){
           
           
            var sct = $(this).scrollTop();
            
            $('.fly').stop().animate({
             'top':sct
             
            },500)
           
           }); 
		
	</script>
</html>