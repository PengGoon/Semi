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
         		margin : 150px;
			}
			table{
				border: 1px solid;
				border-collapse: collapse; 
			}
			th{
				width: 450px;
				height: 450px;
				padding: 100px 200px;
			}
		</style>
	</head>
	<body>
		<table>
			<th><h1>결제 되었습니다. 감사합니다.</h1></th>
		</table><br/>
		<button id=""><h2>주문내역</h2></button>
		<button id="home"><h2>홈으로</h2></button>
	</body>
	<script>
	$("#home").click(function(){
		location.href="navi.jsp"; 
	});
	</script>
</html>