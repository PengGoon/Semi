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
            width: 250px;
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
            width: 250px;
            border: 1px solid black;
        }
        .searchBar input{
            font-size: 18;
            border: 0;
            float: left;
            padding: 10px;
            width: 200px;
        }
        .searchBar img{
            margin: 3px 2px;
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
	</style>
	<body>
	<div class="menuCenter">
		<div class="rightMenu">
			<ul>
				<a href="user/userLogin.jsp"><li id=flip">로그인</li></a>
				<a href="user/userJoinSelect.jsp"><li>회원가입</li></a>
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
			    	<input type="text" name="search"/>
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
				</table>
				<ul>
					<li><a href="list.jsp">돼지고기</a></li><br/>
					<li><a href="#">소고기</a></li><br/>
					<li><a href="#">닭고기</a></li><br/>
					<li><a href="#">달걀</a></li>
				</ul>
				<ul>
					<li><a href="#">고등어/갈치</a></li><br/>
					<li><a href="#">오징어/낙지</a></li><br/>
					<li><a href="#">조개류</a></li>
				</ul>
				<ul>
					<li><a href="#">뿌리채소</a></li><br/>
					<li><a href="#">열매채소</a></li><br/>
					<li> <a href="#">나물류</a></li>
				</ul>
				<ul>
					<li><a href="#">제철과일</a></li><br/>
					<li><a href="#">수입과일</a></li>
				</ul>
			</div>
		</div>
	</body>
	<script>
	
	$("#flip").click(function(){
    	$("#category").slideToggle("fast");
	});
	
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
		
	</script>
</html>