<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
</head>
<style>
#wrapper {
	width: 1000px;
	margin: 0 auto;
}

#mainImg {
	background-color: aqua;
	width: 1000px;
	height: 300px;
}

.bestImg {
	background-color: aqua;
	width: 1000px;
	height: 200px;
}

.best {
	background-color: brown;
	float: left;
	width: 200px;
	height: 200px;
	border: 1px solid black;
}
</style>

<body>
	<jsp:include page="user_navi.jsp"></jsp:include>
	<div id="wrapper">

		<div id="mainImg" style="height: 200" class="cycle-slideshow"
			data-cycle-loader="wait" 
			data-cycle-timeout="1000">

			<img src="IMG/img1.jpg" /> 
			<img src="IMG/img2.png" />

		</div>
		<br />
		<h2>BEST</h2>
		<div class="bestImg">
			<div class="best"></div>
			<div class="best"></div>
			<div class="best"></div>
			<div class="best"></div>
		</div>
		<br />
		<h2>신상품</h2>
		<div class="bestImg">
			<div class="best"></div>
			<div class="best"></div>
			<div class="best"></div>
			<div class="best"></div>
		</div>
		<br />
		<h2>후기</h2>
		<div class="bestImg">
			<div class="best">1</div>
			<div class="best">2</div>
			<div class="best">3</div>
			<div class="best">4</div>
		</div>
	</div>
</body>
<script>
	
</script>
</html>