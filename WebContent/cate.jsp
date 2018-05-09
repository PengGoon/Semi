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
      	
		.jbTitle {
			text-align: center;
		}
		
		ul {
			float: left;
		}
		
		th {
			padding: 10px 35px;
			text-align: center;
		}
		
		#flip {
			text-align: center;
			background-color: yellow;
			padding: 10px 0px;
			width: 100%;
		}
		
		.jbFixed {
        	position: fixed;
        	top: 0px;
      	}
      	
      	.panel{
                padding: 50 0;
                display: none;
            }
	</style>
	<body>
		<div class="jbTitle">
			<h1>Site Title</h1>
		</div>
		<div id="flip"><h3>카테고리</h3></div>
		<div class="panel" id="sub1">
		<table>
			<tr>
				<th><h3>육류</h3></th>
				<th><h3>생선</h3></th>
				<th><h3>채소</h3></th>
				<th><h3>과일</h3></th>
			</tr>
		</table>
		<ul>
		<li><a href="cate1.jsp">돼지고기</a></li><br/> <li><a href="#">소고기</a></li><br/> <li> <a href="#">닭고기</a></li>
		</ul>
		<ul>
		<li><a href="#">고등어/갈치</a></li><br/> <li><a href="#">오징어/낙지</a></li><br/> <li> <a href="#">조개류</a></li>
		</ul>
		<ul>
		<li><a href="#">뿌리채소</a></li><br/> <li><a href="#">열매채소</a></li><br/> <li> <a href="#">나물류</a></li>
		</ul>
		<ul>
		<li><a href="#">제철과일</a></li><br/> <li><a href="#">수입과일</a></li>
		</ul>
		</div>
		
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	</body>
	<script>
		$("#flip").click(function(){
        	$("#sub1").slideToggle("fast");
    	});
		
		$(document).ready(function() {
			var jbOffset = $('#flip').offset();
			$(window).scroll(function() {
				if ($(document).scrollTop() > jbOffset.top) {
					$('#flip').addClass('jbFixed');
				} else {
					$('#flip').removeClass('jbFixed');
				}
			});
		});
	</script>
</html>