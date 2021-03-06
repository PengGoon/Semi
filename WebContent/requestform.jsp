<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 등록 요청</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style>
.reqeustForm table {
	font-weight: 600;
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
	text-align: left;
	border: none;
	margin: 0 auto 70 auto;
}

.reqeustForm td {
	font-weight: 600;
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
	text-align: left;
	border: none;
}

.reqeustForm th {
	font-weight: 600;
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
	text-align: left;
	border: none;
}

.reqeustForm hr {
	border: none;
	width: 1000px;
	border: 1px solid limegreen;
	color: limegreen; /* IE */
	border-color: limegreen; /* 사파리 */
	background-color: limegreen; /* 크롬, 모질라 등, 기타 브라우저 */
}

.reqeustTitle {
	margin: 60px 0px 55px 0px;
	text-align: center;
	color: black;
	font-size: 20;
}

.reqeustFormTable {
	position: absolute;
	left: 20%;
	margin: 0 0 120px 0;
}

.reqeustForm select {
	font-weight: 600;
	border-style: solid;
	height: 41px;
	width: 130px;
}

.inp {
	height: 41px;
}

#request_start {
	font-weight: 600;
	border-style: solid;
	height: 41px;
	width: 220px;
	border-color: limegreen;
	background-color: limegreen;
	color: white;
	cursor: pointer;
}

#request_end {
	font-weight: 600;
	border-style: solid;
	height: 41px;
	width: 130px;
	border-color: limegreen;
	background-color: limegreen;
	color: white;
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="navi.jsp"></jsp:include>
	<jsp:include page="myPage_menu.jsp"></jsp:include>
	<!-- 기본 정보 뷰 -->
	<div class=reqeustForm>
		<div class=reqeustTitle>
			<br />
			<br />
			<h1>회원(판매자) 등록 요청</h1>
		</div>
		<br />
		<table class=reqeustFormTable>
			<br />
			<tr>
				<td colspan="3"><hr /></td>
			</tr>

			<tr>
				<td>회원 이름</td>
				<td><input class="inp" type="text" name="userName"
					id="beforeName" disabled="true" /></td>
			</tr>
			<tr>
				<td>회원 주소</td>
				<td><input class="inp" type="text" id="beforeAddr"
					disabled="true" style="width: 70%" /></td>
			</tr>
			<tr>
				<td>회원 EMAIL</td>
				<td><input class="inp" type="text" id="beforeEmail"
					disabled="true" /></td>
			</tr>
			<tr>
				<td>회원 휴대폰 번호</td>
				<td><input class="inp" type="text" name="phone"
					id="beforePhone" disabled="true" /></td>
			</tr>
			<tr>
				<td>사업자 등록증</td>
				<td><img width="300" id="after_filename" /></td>
			</tr>

			<tr>
				<td colspan="3"><hr /></td>
			</tr>

			<tr>
				<td colspan="2" style="text-align: right">
					<button id="request_start">판매자 등록 요청하기</button>
					<button id="request_end">취소</button>
				</td>
			</tr>
		</table>
	</div>
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
		location.href = "myPage.jsp";
	});

	$("#request_start").click(function() {
		obj.url = "./sell_request";
		obj.success = function(data) {
			console.log(data.result);
			if (data.result == 1) {
				alert("판매자 등록 요청을 완료했습니다.");
				location.href = "myPage.jsp";
			} else if (data.result == 0) {
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