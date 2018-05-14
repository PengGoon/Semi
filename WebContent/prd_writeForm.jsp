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

#writeTable table, tr, th {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}

#pic {
	width: 500px;
	height: 450px;
}

#writeTable input[type='text'] {
	width: 80%;
}

#writeTable textarea{
	width: 100%;
	height: 300px;
	resize: none;
}

</style>
<body>
	<jsp:include page="seller_navi.jsp"></jsp:include>
	<div id="menuCenter">
		<div id="writeTable">
			<form action="../prd_write" method="post" enctype="multipart/form-data">
				<select id="cateF" name="cateFirst" onchange="showCateS(this.value)">
					<option value="정육/달걀" selected="selected">정육/달걀</option>
					<option value="생선">생선</option>
					<option value="채소">채소</option>
					<option value="과일">과일</option>
				</select>
				<select id="cateS" name="cateSecond">
					<option value="돼지고기" selected="selected">돼지고기</option>
					<option value="소고기">소고기</option>
					<option value="닭고기">닭고기</option>
					<option value="달걀">달걀</option>
				</select>
				<input type="button" value="보기" onclick="showVal()"/>
				<table>
					<tr>
						<th id="pic" colspan="2" rowspan="6">
							메인 상품 사진(썸네일)<br/>
							<input type="file" name="photo1"/>
						</th>
						<th colspan="2" style="width: 500px">
							<h2>상품명</h2><input type="text" name="prd_name" placeholder="상품명을 입력하세요." />
						</th>
					</tr>
					<tr>
						<th style="width: 100px">판매자</th>
						<th style="width: 400px"><input type="text" name="sell_id" /></th>
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
						<th width="140px"><h3>사진 등록 부분 (2장 제한)</h3></th>
						<th colspan="3" width="1000px" height="300px">
							<input type="file" name="photo2"/>
							<input type="file" name="photo3"/>
						</th>
					</tr>
					<tr>
						<th width="140px"><h3>글 내용</h3></th>
						<th colspan="3"><textarea name="prd_content"></textarea></th>
					</tr>
					<tr>
						<th colspan="4" height="100px">
							<button>물품등록</button>
							<input type="button" value="취소" onclick="location.href='index.jsp'"/>
						</th>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<script>
function showCateS(val){
	console.log(val);
	if(val == "정육/달걀") {
		$("#cateS").html("<option value='돼지고기' selected='selected'>돼지고기</option><option value='소고기'>소고기</option><option value='닭고기'>닭고기</option><option value='달걀'>달걀</option>");
	}
	if(val == "생선") {
		$("#cateS").html("<option value='고등어/갈치' selected='selected'>고등어/갈치</option><option value='오징어/낙지'>오징어/낙지</option><option value='조개류'>조개류</option>");
	}
	if(val == "채소") {
		$("#cateS").html("<option value='뿌리채소' selected='selected'>뿌리채소</option><option value='열매채소'>열매채소</option><option value='나물류'>나물류</option>");
	}
	if(val == "과일") {
		$("#cateS").html("<option value='제철과일' selected='selected'>제철과일</option><option value='수입과일'>수입과일</option>");
	}
}
</script>
</html>