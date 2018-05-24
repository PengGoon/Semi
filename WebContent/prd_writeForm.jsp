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

#writeTable table{
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}

#writeTable tr{
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}

#writeTable th {
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
	<jsp:include page="navi.jsp"></jsp:include>
	<jsp:include page="myPage_menu.jsp"></jsp:include>
	<div id="menuCenter">
		<div id="writeTable">
			<form id="writeForm" action="prd_write" method="post" enctype="multipart/form-data">
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
						<th style="width: 400px">
							<input type="hidden" name="sell_id" value="${sessionScope.loginId}"/>
							${sessionScope.loginId}
						</th>
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
							<input type="button" value="물품등록" onclick="emptyChk()"/>
							<input type="button" value="취소" onclick="location.href='myPage.jsp'"/>
						</th>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<script>
//html 문서를 로그하자마자 상세정보를 가져온다
var obj={};
var idx;
obj.type="POST";
obj.dataType="JSON";
obj.error=function(e){console.log(e)};

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

function emptyChk(){
	var file1 = $("input[name=photo1]").val();
	var file2 = $("input[name=photo2]").val();
	var file3 = $("input[name=photo3]").val();
	var fileExt1 = file1.substring(file1.lastIndexOf('.')+1); //파일 확장자
	var fileExt2 = file2.substring(file2.lastIndexOf('.')+1); //파일 확장자
	var fileExt3 = file3.substring(file3.lastIndexOf('.')+1); //파일 확장자
	console.log(fileExt1);
	
	if($("input[name=prd_name]").val() == ""){ alert("상품명을 입력해주세요"); $("input[name=prd_name]").focus();
	}else if($("input[name=prd_price]").val() == ""){ alert("판매가를 입력해주세요"); $("input[name=prd_price]").focus();
	}else if($("input[name=prd_from]").val() == ""){ alert("원산지를 입력해주세요"); $("input[name=prd_from]").focus();
	}else if($("input[name=prd_count]").val() == ""){ alert("상품수량을 입력해주세요"); $("input[name=prd_count]").focus();
	}else if(fileExt1.toUpperCase() == "JPG" || fileExt1.toUpperCase() == "PNG" && fileExt1.toUpperCase() != ""){ 
		if(fileExt2.toUpperCase() == "JPG" || fileExt2.toUpperCase() == "PNG" || fileExt2.toUpperCase() == ""){
			if(fileExt3.toUpperCase() == "JPG" || fileExt3.toUpperCase() == "PNG" || fileExt3.toUpperCase() == ""){
				$("#writeForm").submit();
			}else{
				alert("3번째 사진을 확인해주세요.\n형식은 jpg 또는 png 파일만 가능합니다.");
			}
		}else{
			alert("2번째 사진을 확인해주세요.\n형식은 jpg 또는 png 파일만 가능합니다.");
		}
	}else{
		alert("1번째 사진은 필수 등록입니다.\n사진이 없거나 형식은 jpg 또는 png 파일만 가능합니다.");
	}
}

$(document).ready(function() {
	obj.url = "./sell_YN";
	obj.data={sell_id:"${sessionScope.loginId}"};
	obj.success = function(data) {
		console.log(data);
		if (data.YN != 2) {
			alert("등급을 확인해주세요.");
			location.href = "myPage.jsp";
		}
	}
	ajaxCall(obj);
});

function ajaxCall(param) {
	//console.log(param);
	$.ajax(param);
}
</script>
</html>