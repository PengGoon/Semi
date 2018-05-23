<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>리뷰 목록</title>
	</head>
<style>
	#reviewList table{
		border:none;
		border-collapse: collapse;
		padding: 10px 10px;
	}
	
	#reviewList th{
		border:none;
		border-collapse: collapse;
		padding: 10px 10px;
	}
	
	#reviewList td{
		border:none;
		border-collapse: collapse;
		padding: 10px 10px;
	}
	
	#reviewList hr{
            border:none;
            width:1000px;
            border:1px solid limegreen;
            color: limegreen;    /* IE */
    		border-color: limegreen;  /* 사파리 */
   			background-color: limegreen;   /* 크롬, 모질라 등, 기타 브라우저 */
    }
	
	.msg{
		position:relative;
		left:0%;
		
	}
	
	#reviewList{
		width: 1000px;
		margin: 0 auto;
	}
	
	#writeBtn{
		float: right;
		height : 42px;
		width: 130px;
		font-weight: 800;
		border-style : solid;
		border-color: limegreen;
		background-color : limegreen;
		color: white;
		cursor: pointer;
	}
	
	#reviewTitle{
		width:500px;
	}
	#userId{
		width:150px;
	}
</style>
<body>
	<div id="reviewList">
		<h3 class=msg>PRODUCT REVIEW</h3>
		<h5>상품 사용 후기를 남기는 공간입니다.해당 게시판의 성격과 다른 글은 사전 동의 없이 삭제 될 수 있습니다.</h5><hr/>
	<table id = "listTable">
		<tr>
			<th style="width:100px">글 번호</th>
			<th style="width:300px">제목</th>
			<th style="width:250px">상품명</th>
			<th style="width:150px">작성자</th>
			<th style="width:150px">작성일</th>
			<th style="width:100px">조회수</th>
		</tr>
	</table>
	<br/>
	<hr/>
<!-- 	<button id=writeBtn onclick="location.href='reviewWriteForm.jsp'">후기 작성</button> -->
	</div>
	</body>
	<script>
	
	//리스트 호출
	var obj = {};
	obj.error = function(e){console.log(e)};
	obj.type="post";
	obj.dataType="json";
	console.log("리스트 호출");
	
	$(document).ready(function(){
		obj.url="./review_list";
		console.log("url로 들어감")
		obj.success = function(data){
			console.log(data);
			listPrint(data.list);
		}
		ajaxCall(obj);
	});
	
	 function listPrint(list){
		console.log(list);
		var content ="";
		list.forEach(function(item,idx){
			//번호, 제목, 상품명, 작성자 , 작성일, 조회수 
			content += "<tr>";
			content += "<td style='text-align:center'>" +item.review_id+"</td>"; 
			content += "<td><a href='./review_detail?review_id=" +item.review_id+"'>"+item.review_title+"</a></td>";
			content += "<td style='text-align:center'>" +item.prd_Name+"</td>"; 
			content += "<td style='text-align:center'>" +item.user_id+"</td>"; 
			content += "<td style='text-align:center'>" +item.review_date+"</td>"; 
			content += "<td style='text-align:right'>" +item.bHit+"</td>"; 
			content += "</tr>";
			console.log(item);
		});
		$("#listTable").append(content);
	 }

	function ajaxCall(param){
		console.log(param);
		$.ajax(param);
	}
	
	$(function(){
		$('a').click(function(){
			$('a').removeClass();
			$(this).addClass('on');
		});
	});
	</script>
</html>