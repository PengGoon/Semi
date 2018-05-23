<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<style>
.userJoinTitle {
	margin: 60px 0px 55px 0px;
	text-align: center;
	color: limegreen;
	font-size: 20;
}

#write-form,#write-form td{
	border: 1px solid black;
	border-collapse: collapse;
	width: 100%;
}

#write-form input,#write-form textarea{
	border:0;
}

#m_notice_detail {
	width: 1000px;
	margin: 0 auto;
}
</style>
<body>
	<jsp:include page="navi.jsp"></jsp:include>
	<br />
	<div class=userJoinTitle>
		<h1>공지 사항</h1>
	</div>
	<div id="m_notice_detail">
	<table id="write-form">
		<tr>
			<td style="text-align: center; height: 50px;">제목</td>
			<td><input class="edit" type="text" name="notice_title" id="notice_title" readonly /></td>
		</tr>
		<tr>
			<td style="text-align: center; height: 50px;">작성자</td>
			<td><input type="text" id="admin_id" readonly /></td>
		</tr>
		<tr>
			<td style="text-align: center">내용</td>
			<td><textarea class="edit" name="notice_content" id="notice_content" rows="15" cols="120" readonly></textarea></td>
		</tr>
	</table>
	</div>
</body>
<script>
	$(function() {
		$('a').click(function() {
			$('a').removeClass();
			$(this).addClass('on');
		});
	});

	//상세 정보를 가져온다. 
	var obj = {};
	var idx;
	obj.type = "POST";
	obj.dataType = "JSON";
	obj.error = function(e) {
		console.log(e)
	};
	console.log(obj);

	$(document).ready(function() {
		console.log("상세보기");
		obj.url = "./main_notice_detailView";
		obj.success = function(data) {

			console.log(data);
			printInfo(data.dto);
		}
		ajaxCall(obj);
	});
	function printInfo(info) {
		console.log(info);
		notice_id = info.notice_id;
		console.log(notice_id);
		$("#admin_id").val(info.admin_id);
		$("#notice_title").val(info.notice_title);
		$("#notice_content").val(info.notice_content);
		$("#notice_date").val(info.notice_date);
	}
	function ajaxCall(param) {
		$.ajax(param);
	}
</script>
</html>