<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>등록한 상품 목록</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
#reviewList table {
	border: none;
	border-collapse: collapse;
	padding: 10px 10px;
	text-align: center;
}

#reviewList th {
	border: none;
	border-collapse: collapse;
	padding: 10px 10px;
	width: 150px;
}

#reviewList td {
	border: none;
	border-collapse: collapse;
	padding: 10px 10px;
}

#reviewList hr {
	border: none;
	width: 1000px;
	border: 1px solid limegreen;
	color: limegreen; /* IE */
	border-color: limegreen; /* 사파리 */
	background-color: limegreen; /* 크롬, 모질라 등, 기타 브라우저 */
}

#reviewList {
	width: 1000px;
	margin: 0 auto;
}

#reviewList input[type='button']{
	float: right;
}
</style>
</head>
<body>
	<div id="reviewList">
		<hr />
		<table id="listTable">
			<tr>
				<th>상품번호</th>
				<th>상품명</th>
				<th>가격(원)</th>
				<th>남은수량</th>
				<th>조회수</th>
				<th>등록일</th>
				<th>비고</th>
			</tr>
		</table>
		<br />
		<hr />
		<input id="del" type="button" value="삭제"/>
		<input type="button" value="상품등록" onclick="location.href='prd_writeForm.jsp'"/>
	</div>
</body>
<script>
	//html 문서를 로그하자마자 상세정보를 가져온다
	var obj={};
	var idx;
	obj.type="POST";
	obj.dataType="JSON";
	obj.error=function(e){console.log(e)};
	
	$(document).ready(function(){
		obj.url="./sell_prdList";
		obj.data={
			sell_id:"seller01"
		};
		obj.success = function(data){
			console.log(data);
			listPrint(data.list);
			/*
			if(data.login){
				listPrint(data.list);
			}else{
				alert("로그인이 필요한 서비스 입니다.");
				location.href="index.html";
			}
			*/
		}
		ajaxCall(obj);
	});
	
	//리스트 뽑아내기
	function listPrint(list){
		console.log(list);
		var content = "";
		var flag = "";
		
		list.forEach(function(item, prd_id){
			content+="<tr>";
			content+="<td><input type='checkbox' value='"+item.prd_Id+"'/></td>";
			content+="<td><a href='./prd_sellerdetail?prd_id="+item.prd_Id+"'>"+item.prd_Name+"</a></td>";
			content+="<td>"+item.prd_Price+"</td>";
			content+="<td>"+item.prd_Count+"</td>";
			content+="<td>"+item.prd_bHit+"</td>";
			content+="<td>"+item.prd_Date+"</td>";
			if(item.prd_Count>0){
				flag = "<td style='color:green'>판매중</td>";
			}else{
				flag = "<td style='color:red'>품절</td>";
			}
			content+=flag;
			content+="</tr>";
		});
		$("#listTable").append(content);
	}
	
	//삭제
	$("#del").click(function(){
		obj.url="./sell_prdDelete";
		var checked = [];
		$("input[type='checkbox']:checked").each(function(){
			checked.push($(this).val());
		});
		console.log(checked);
		obj.data={delList:checked};
		obj.success=function(data){
			console.log(data);
			if(data.success){
				alert("삭제 성공");
			}else{
				alert("삭제 실패");
			}
			location.href="sell_prdList.jsp";
		}
		console.log(obj);
		ajaxCall(obj);
	});
	
	function ajaxCall(param){
		console.log(param);
		$.ajax(param);
	}
</script>
</html>