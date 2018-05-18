<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style></style>
	</head>
	<body>
	<jsp:include page="noticeList.jsp"></jsp:include>
	</body>
	<script>
	$(function(){
		$('a').click(function(){
			$('a').removeClass();
			$(this).addClass('on');
		});
	});
	
	//상세 정보를 가져온다. 
	var obj = {};
	var idx;
	obj.type="POST";
	obj.dataType="JSON";
	obj.error=function(e){console.log(e)};
	console.log(obj);
	
	$(document).ready(function(){
		console.log("상세보기");
		obj.url="./notice_detailView";
		obj.success = function(data){
			console.log(data);
			printInfo(data.dto);
		};
	});
	
	function printInfo(info){
		console.log(info);
		idx = info.notice_id;
		console.log(idx);
		$("#admin_id").val(info.admin_id);
		$("#notice_title").val(info.notice_title);
		$("#notice_content").val(info.notice_content);
		
	}
	</script>
</html>