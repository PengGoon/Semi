<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style></style>
	</head>
	<body>
		<div>
			<img src="" id="bigP" style="width: 600; height: 700"/>
		</div>
		
	</body>
	<script>
		var big = opener.bigP;
		$("#bigP").attr("src",big);
	</script>
</html>