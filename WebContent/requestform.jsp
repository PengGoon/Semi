<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style>
table, td, th {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
	text-align: center;
	margin: 100 350;
}

input.inputTxt {
	width: 100%;
}
</style>
</head>
<body>

	<!-- 기본 정보 뷰 -->
	<table id="before" style="width: 600">
		<h2>판매자 등록 요청</h2>
		<tr>
			<td>회원 이름</td>
			<td><input class="inputTxt" type="text" name="userName"
				id="beforeName" disabled="true" /></td>
		</tr>
		<tr>
			<td>회원 주소</td>
			<td><input type="text" id="beforeAddr" disabled="true"
				style="width: 100%" /></td>
		</tr>
		<tr>
			<td>회원 EMAIL</td>
			<td><input type="text" id="beforeEmail" disabled="true"
				style="width: 100%" /></td>
		</tr>
		<tr>
			<td>회원 휴대폰 번호</td>
			<td><input class="inputTxt" type="text" name="phone"
				id="beforePhone" disabled="true" /></td>
		</tr>
		<tr>
			<td>사업자 등록증</td>
			<td><img width="300" id="after_filename" /></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: left;">
				<button id="request_start">판매자 등록 요청하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="update_end2">취소</button>&nbsp;&nbsp;
			</td>
		</tr>
	</table>
</body>
<script>
	var obj = {};//초기화   
	obj.type = "post";
	obj.dataType = "json";
	obj.enctype = "multipart/form-data";
	obj.data = {};
	obj.error = function(e) {
		console.log(e)
	};

	$(document).ready(function() {
		obj.url = "./detailView";
		obj.success = function(data) {
			console.log(data);
			console.log(data.dto.pw);
			console.log(data.dto.filename);
			$("#beforeName").val(data.dto.name);
			$("#beforeEmail").val(data.dto.email);
			$("#beforeAddr").val(data.dto.addr);
			$("#beforePhone").val(data.dto.phone);
			$("#after_filename").attr("src", data.dto.filename);
			if (data.login) {
				alert("본인 정보를 한번 더 확인해주세요.");
			} else {
				alert("로그인이 필요한 서비스 입니다.");
				location.href = "index.html";
			}
		}
		ajaxCall(obj);
	});


	$("#update_end2").click(function() {
		location.href = "main.jsp";
	});
	
	 $("#request_start").click(function(){
		obj.url = "./sell_request";
		obj.success = function(data) {
			console.log(data.result);
			if (data.result == 1) {
				alert("판매자 등록 요청을 완료했습니다.");
				location.href = "main.jsp";
			} else if(data.result == 0){
				alert("이미 등록요청을 하였거나 등록된 사용자 입니다..");
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