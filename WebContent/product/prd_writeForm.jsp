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
	<jsp:include page="../main/navi.jsp"></jsp:include>
	<div id="menuCenter">
		<div id="detailTable">
			<form action="../prd_write" method="post" enctype="multipart/form-data">
				<select id="cateF" name="cateFirst" onchange="showCateS(this.value)">
					<option value="정육/달걀" selected="selected">정육/달걀</option>
					<option value="생선">생선</option>
					<option value="채소">채소</option>
					<option value="과일">과일</option>
				</select>
				<select id="cateS1" name="cateSecond">
					<option value="돼지고기" selected="selected">돼지고기</option>
					<option value="소고기">소고기</option>
					<option value="닭고기">닭고기</option>
					<option value="달걀">달걀</option>
				</select>
				<select id="cateS2" name="cateSecond"  style="display:none">
					<option value="고등어/갈치">고등어/갈치</option>
					<option value="오징어/낙지">오징어/낙지</option>
					<option value="조개류">조개류</option>
				</select>
				<select id="cateS3" name="cateSecond"  style="display:none">
					<option value="뿌리채소">뿌리채소</option>
					<option value="열매채소">열매채소</option>
					<option value="나물류">나물류</option>
				</select>
				<select id="cateS4" name="cateSecond"  style="display:none">
					<option value="제철과일">제철과일</option>
					<option value="수입과일">수입과일</option>
				</select>
				<h2>육류 > 돼지고기</h2>
				<table>
					<tr>
						<th id="pic" rowspan="7">
							사진<br/>
							<input type="file" name="photo"/>
						</th>
						<th colspan="2" style="width: 350px">
							<h2>상품명</h2> <input type="text" name="prd_name" placeholder="상품명을 입력하세요." />
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
function showCateS(val){
	console.log(val);
	if(val == "정육/달걀") {
		document.getElementById("cateS1").style.display = "";
		document.getElementById("cateS2").style.display = "none";
		document.getElementById("cateS3").style.display = "none";
		document.getElementById("cateS4").style.display = "none";
		document.getElementById("cateS1").disabled = false;
		document.getElementById("cateS2").disabled = true;
		document.getElementById("cateS3").disabled = true;
		document.getElementById("cateS4").disabled = true;
	}
	if(val == "생선") {
		document.getElementById("cateS1").style.display = "none";
		document.getElementById("cateS2").style.display = "";
		document.getElementById("cateS3").style.display = "none";
		document.getElementById("cateS4").style.display = "none";
		document.getElementById("cateS1").disabled = true;
		document.getElementById("cateS2").disabled = false;
		document.getElementById("cateS3").disabled = true;
		document.getElementById("cateS4").disabled = true;
	}
	if(val == "채소") {
		document.getElementById("cateS1").style.display = "none";
		document.getElementById("cateS2").style.display = "none";
		document.getElementById("cateS3").style.display = "";
		document.getElementById("cateS4").style.display = "none";
		document.getElementById("cateS1").disabled = true;
		document.getElementById("cateS2").disabled = true;
		document.getElementById("cateS3").disabled = false;
		document.getElementById("cateS4").disabled = true;
	}
	if(val == "과일") {
		document.getElementById("cateS1").style.display = "none";
		document.getElementById("cateS2").style.display = "none";
		document.getElementById("cateS3").style.display = "none";
		document.getElementById("cateS4").style.display = "";
		document.getElementById("cateS1").disabled = true;
		document.getElementById("cateS2").disabled = true;
		document.getElementById("cateS3").disabled = true;
		document.getElementById("cateS4").disabled = false;
	}
}
</script>
</html>