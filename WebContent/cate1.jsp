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
            
        table{
            border: 1px solid; /* color 생략 시 기본값은 black */
            border-collapse: collapse;
            float: left;
        }
        
        th{
            border: 1px solid; 
            padding: 50px 100px; 
        }
        
        td{
        	text-align: center;
        	border: 0px solid;
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
      	
	</style>
	<body>
		<h3>육류</h3>
		<table>
			<tr>
				<th>사진</th>
			</tr>
			<tr>
				<td>안심</td>
			</tr>
			<tr>
				<th>사진</th>
			</tr>
			<tr>
				<td>목살</td>
			</tr>
		</table>
		<table>
			<tr>
				<th>사진</th>
			</tr>
			<tr>
				<td>삼겹살</td>
			</tr>
			<tr>
				<th>사진</th>
			</tr>
			<tr>
				<td>앞다리</td>
			</tr>
		</table>
		<table>
			<tr>
				<th>사진</th>
			</tr>
			<tr>
				<td>뒷다리</td>
			</tr>
			<tr>
				<th>사진</th>
			</tr>
			<tr>
				<td>갈비</td>
			</tr>
		</table>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<button id="more">더 보기</button>
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