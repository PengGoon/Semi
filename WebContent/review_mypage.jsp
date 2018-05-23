<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<title>유저리뷰 목록</title>
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
	.td{
		text-align: center;
	}
	#del{
		float: right;
	}
</style>
<body>
	<jsp:include page="navi.jsp"></jsp:include>
	<jsp:include page="myPage_menu.jsp"></jsp:include>
	<div id="reviewList">
		<h3 class=msg>PRODUCT REVIEW</h3>
		<h5>상품 사용 후기를 남기는 공간입니다.해당 게시판의 성격과 다른 글은 사전 동의 없이 삭제 될 수 있습니다.</h5>
		<hr />
		<table id="listTable">
			<tr>
				<th style="width: 100px"><input type="checkbox" id="allcheck">글번호</th>
				<th style="width: 300px">제목</th>
				<th style="width: 250px">상품명</th>
				<th style="width: 150px">작성자</th>
				<th style="width: 150px">작성일</th>
				<th style="width: 100px">조회수</th>
			</tr>
		</table>
		<br />
		<hr />
		<input id="del" type="button" value="삭제" />
	</div>
</body>
<script>
	//리스트 호출
	var obj = {};
		obj.error = function(e) {
			console.log(e)
		};
		obj.type = "POST";
		obj.dataType = "JSON";
	
		$(document).ready(function() {
			obj.url = "./review_mypage";
			obj.success = function(data) {
				//console.log(data);
				if (data.list) {
					//리스트 보여주기
					listPrint(data.list);
				} else {
					alert("로그인이 필요한 서비스 입니다.");
					location.href = "index.jsp";
				}
			}
			ajaxCall(obj);
		});
	
		function listPrint(list) {
			//console.log(list);
			var content = "";
		list.forEach(function(item,review_id){
			//번호, 제목, 상품명, 작성자 , 작성일, 조회수 
			content += "<tr>";
			content += "<td style='text-align:center'><input class='checkcheck' type='checkbox' value='"+item.review_id+"' />" +item.review_id+"</td>"; 
			content += "<td class='td'><a href='./review_detail?review_id=" +item.review_id+"'>"+item.review_title+"</a></td>";
			content += "<td style='text-align:center'>" +item.prd_Name+"</td>"; 
			content += "<td style='text-align:center'>" +item.user_id+"</td>"; 
			content += "<td style='text-align:center'>" +item.review_date+"</td>"; 
			content += "<td class='td' style='text-align:right'>" +item.bHit+"</td>"; 
			content += "</tr>";
		});
		$("#listTable").append(content);
	 }
		
		//체크박스
		$("#allcheck").click(function() {
			//만약 전체 선택 체크박스가체크된 상태일경우
			if ($("#allcheck").prop("checked")) {
				//해당화면 에전체 checkbox들을 체크해준다
				$("input[type='checkbox']").prop('checked', true);
			} else {
				//해당화면 에전체 checkbox들을 체크해제시켜준다
				$("input[type='checkbox']").prop('checked', false);
			}
	
		});
		//삭제
		$("#del").click(function() {
			obj.url = "./m_delete";
			var checked = [];
			//$("input[type='checkbox']:checked").each(function() {
			$(".checkcheck:checked").each(function() {
				checked.push($(this).val());
			});
			obj.data = {
				delList : checked
			};
			console.log(checked);
			obj.success = function(data) {
				if (data.success) {
					alert("삭제에 성공 했습니다.");
					location.href = "review_mypage.jsp";
				} else {
					alert("삭제에 실패 했습니다.");
				}
				location.href = "review_mypage.jsp";
			}
			console.log(obj);
			ajaxCall(obj);
		});	
		

	function ajaxCall(param){
		//console.log(param);
		$.ajax(param);
	}
	
	/* $(function(){
		$('a').click(function(){
			$('a').removeClass();
			$(this).addClass('on');
		});
	}); */
	</script>
</html>