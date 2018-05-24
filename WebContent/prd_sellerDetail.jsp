<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
#detailTable table, tr, th {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}
#pic {
	width: 500px;
	height: 450px;
}

.mainImg {
	background-color: aqua;
	width: 1000px;
	height: 300px;
}

#updateBtn, #save{
	float: right;
}

#detailTable input[type='text']{
	font-size: 20;
	text-align: center;
	width: 80%;
	border-width: 0;
}

#detailTable #prd_Name{
	font-size: 40;
	text-align: center;
	border-width: 0;
}

#detailTable textarea{
	font-size: 20;
	width: 100%;
	height: 300px;
	resize: none;
	border-width: 0;
}
</style>
<body>
	<jsp:include page="navi.jsp"></jsp:include>
	<div id="menuCenter">
		<form id="updateForm" action="./prd_update" method="post" enctype="multipart/form-data">
		<input type="button" id="updateBtn" value="수정"/>
		<input type="button" id="save" value="저장" onclick="emptyChk()" style="display:none"/>
		<div id="detailTable">
			<input type="hidden" name="cateFirst" value="${info.cateFirst_Id }" />
			<input type="hidden" name="cateSecond" value="${info.cateSecond_Id }" />
			<h2>${info.cateFirst_Id } > ${info.cateSecond_Id }</h2>
			<table>
				<tr>
					<th id="pic" colspan="2" rowspan="7">
						<c:if test="${list.newFileName1 ne null}">
							<img width="500" src="${list.newFileName1}"/>
						</c:if>
						<input type="file" name="photo1" style="display:none"/>
					</th>
					<th colspan="2" style="width: 500px">
						<input type="hidden" name="prd_id" value="${info.prd_Id }" />
						<c:if test="${info.prd_Count eq 0}">
							<h2 style="color:red">[품절]</h2>
						</c:if>
						<h2>상품명</h2>
						<input type="text" class="edit" name="prd_name" value="${info.prd_Name }" readonly/>
					</th>
				</tr>
				<tr>
					<th style="width: 100px">판매자</th>
					<th style="width: 400px"><input type="text" name="sell_id" value="${info.sell_Id }" readonly/></th>
				</tr>
				<tr>
					<th>판매가(100g)</th>
					<th><input type="text" class="edit" name="prd_price" value="${info.prd_Price }" readonly/></th>
				</tr>
				<tr>
					<th>원산지</th>
					<th><input type="text" class="edit" name="prd_from" value="${info.prd_From }" readonly/></th>
				</tr>
				<tr>
					<th>조회수</th>
					<th><input type="text" name="prd_bHit" value="${info.prd_bHit }" readonly/></th>
				</tr>
				<tr>
					<th>물품수량</th>
					<th><input type="text" class="edit" name="prd_count" value="${info.prd_Count }" readonly/></th>
				</tr>
				<tr>
					<th colspan="2">
						<button id="purchase">바로결제</button> 
						<button id="cart">장바구니 추가</button> 
						<button id="restock">재입고 알림</button>
					</th>
				</tr>
				<tr>
					<th colspan="4" width="1000px" height="300px">
						<c:if test="${list.newFileName2 ne 'upload/null'}">
							<img width="500" src="${list.newFileName2}"/>
						</c:if>
						<input type="file" name="photo2" style="display:none"/>
						<c:if test="${list.newFileName3 ne 'upload/null'}">
							<img width="500" src="${list.newFileName3}"/>
						</c:if>
						<input type="file" name="photo3" style="display:none"/>
					</th>
				</tr>
				<tr>
					<th width="140px"><h3>글 내용</h3></th>
					<th height="300px" colspan="3"><textarea class="edit" name="prd_content" readonly>${info.prd_Content }</textarea></th>
				</tr>
			</table>
		</div>
		</form>
	</div>
</body>
<script>
	//html 문서를 로드하자 마자 상세 정보를 가져 온다.
	var obj = {};
	var idx;
	obj.type="POST";
	obj.dataType="JSON";
	obj.error=function(e){console.log(e)};
	console.log(obj);
	/*
	$(document).ready(function(){
		obj.url="./detailView";
		obj.success = function(data){
			console.log(data);
			if(data.login){
				printInfo(data.dto);
			}else{
				alert("로그인이 필요한 서비스 입니다.");
				location.href="index.html";
			}
		};
		ajaxCall(obj);
	});
	*/
	
	$("#updateBtn").click(function(){
		$("#save").css("display","inline");
		$(".edit").css("border-width","2px");
		$(".edit").attr("readonly",false);
		$("input[type='file']").css("display","inline");
		$("#updateBtn").css("display","none");
	});
	
	function emptyChk(){
		var file1 = $("input[name=photo1]").val();
		var file2 = $("input[name=photo2]").val();
		var file3 = $("input[name=photo3]").val();
		var fileExt1 = file1.substring(file1.lastIndexOf('.')+1); //파일 확장자
		var fileExt2 = file2.substring(file2.lastIndexOf('.')+1); //파일 확장자
		var fileExt3 = file3.substring(file3.lastIndexOf('.')+1); //파일 확장자
		var fileflag1 = false;
		var fileflag2 = false;
		var fileflag3 = false;
		
		if($("input[name=prd_name]").val() == ""){ alert("상품명을 입력해주세요"); $("input[name=prd_name]").focus();
		}else if($("input[name=prd_price]").val() == ""){ alert("판매가를 입력해주세요"); $("input[name=prd_price]").focus();
		}else if($("input[name=prd_from]").val() == ""){ alert("원산지를 입력해주세요"); $("input[name=prd_from]").focus();
		}else if($("input[name=prd_count]").val() == ""){ alert("상품수량을 입력해주세요"); $("input[name=prd_count]").focus();
		}else if(fileExt1.toUpperCase() == "JPG" || fileExt1.toUpperCase() == "PNG" && fileExt1.toUpperCase() != ""){ 
			if(fileExt2.toUpperCase() == "JPG" || fileExt2.toUpperCase() == "PNG" || fileExt2.toUpperCase() == ""){
				if(fileExt3.toUpperCase() == "JPG" || fileExt3.toUpperCase() == "PNG" || fileExt3.toUpperCase() == ""){
					alert("수정이 완료되었습니다.");
					$("#updateForm").submit();
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
	
	function ajaxCall(param){
		console.log(param);
		$.ajax(param);
	}
</script>
</html>