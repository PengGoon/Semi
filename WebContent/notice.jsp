<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>공지사항 </title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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
		position:absolute;
		left:73%;
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
	
	 .userJoinTitle{
            	margin : 60px 0px 55px 0px;
            	text-align: center;
            	color: limegreen;
            	font-size: 20;
            }
	</style>
	<body>
        <jsp:include page="navi.jsp"></jsp:include>
        <div class = userJoinTitle>
    		<br/><br/>
    		<h1>공지 사항</h1>
    	</div> <br/>
    	
        <div id="reviewList">
		<h3 class=msg >공지사항 게시판 입니다.</h3>
		<hr/>
	<table id = "listTable">
		<tr>
			<th style="width:100px">글 번호</th>
			<th style="width:300px">제목</th>
			<th style="width:150px">작성자</th>
			<th style="width:150px">작성일</th>
			<th style="width:100px">조회수</th>
		</tr>
	</table>
	<br/>
	<hr/>
	</div>
        
        </body>
        <script >
	
	//리스트 호출
	var obj = {};
	obj.error = function(e){console.log(e)};
	obj.type="post";
	obj.dataType="json";
	console.log("리스트 호출");
	
	$(document).ready(function(){
		obj.url="./notice_main";
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
			content += "<td style='text-align:center'>" +item.notice_id+"</td>"; 
			content += "<td><a href='./main_notice_detail?notice_id=" +item.notice_id+"'>"+item.notice_title+"</a></td>";
			content += "<td style='text-align:center'>" +item.admin_id+"</td>"; 
			content += "<td style='text-align:center'>" +item.notice_date+"</td>"; 
			content += "<td style='text-align:center'>" +item.bHit+"</td>"; 
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
        