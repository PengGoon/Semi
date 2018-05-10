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

#menuCenter {
	width: 1000px;
	margin: 0 auto;
}

table, tr, th {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}

#pic {
	width: 450px;
	height: 450px;
}

#detailTable input[type='text'] {
	width: 80%;
}

.mainImg {
	background-color: aqua;
	width: 1000px;
	height: 300px;
}
</style>
<body>
	<jsp:include page="navi.jsp"></jsp:include>
	<div id="menuCenter">
		<div id="detailTable">
			<form action="write" method="post" enctype="multipart/form-data">
				<input type="hidden" name="cateFirst" value="육류" />
				<input type="hidden" name="cateSecond" value="돼지고기" />
				<h2>육류 > 돼지고기</h2>
				<table>
					<tr>
						<th id="pic" rowspan="7">
							사진<br/>
							<input type="file" name="photo"/>
						</th>
						<th colspan="2" style="width: 350px">
							<h2>상품명</h2> <input type="text" name="prd_name"
							placeholder="상품명을 입력하세요." />
						</th>
					</tr>
					<tr>
						<th style="width: 100px">판매자</th>
						<th><input type="text" name="sell_id" /></th>
					</tr>
					<tr>
						<th>판매가(100g)</th>
						<th><input type="text" name="prd_price"
							placeholder="판매가를 입력하세요." /></th>
					</tr>
					<tr>
						<th>원산지</th>
						<th><input type="text" name="prd_from"
							placeholder="원산지를 입력하세요." /></th>
					</tr>
					<tr>
						<th>조회수</th>
						<th>0</th>
					</tr>
					<tr>
						<th>물품수량</th>
						<th><input type="text" name="prd_count"
							placeholder="수량을 입력하세요." /></th>
					</tr>
					<tr>
						<th colspan="2">
							<button>물품등록</button>
							<input type="button" value="취소" onclick="location.href='index.jsp'"/>
						</th>
					</tr>
				</table>
			</form>
		</div>
		<br />
		<div class="mainImg"></div>
	</div>
</body>
<script>
	
</script>
</html>