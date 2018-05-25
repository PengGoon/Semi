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
.sPrdListTitle{
            	margin : 10px 0px 55px 0px;
            	text-align: center;
            	color: black;
            	font-size: 20;
            }

#listTable {
	border: none;
	border-collapse: collapse;
	padding: 10px 10px;
	text-align: center;
}

#listTable th {
	border: none;
	border-collapse: collapse;
	padding: 10px 10px;
	width: 150px;
}

#listTable td {
	border: none;
	border-collapse: collapse;
	padding: 10px 10px;
}

#prdList hr {
	border: none;
	width: 1000px;
	border: 1px solid limegreen;
	color: limegreen; /* IE */
	border-color: limegreen; /* 사파리 */
	background-color: limegreen; /* 크롬, 모질라 등, 기타 브라우저 */
}

#prdList {
	width: 1000px;
	margin: 0 auto 100px auto;
}

#btnWrite {
	float: right;
	height: 30px;
	width: 100px;
	font-weight: 800;
	border-style: solid;
	border-color: limegreen;
	background-color: limegreen;
	color: white;
	cursor: pointer;
}

#del {
	float: left;
	height: 30px;
	width: 100px;
	font-weight: 800;
	border-style: solid;
	border-color: limegreen;
	background-color: limegreen;
	color: white;
	cursor: pointer;
}
.transBtn {
	height: 30px;
	width: 100px;
	font-weight: 800;
	border-style: solid;
	border-color: limegreen;
	background-color: limegreen;
	color: white;
	cursor: pointer;
}
</style>
</head>
<body>
	<div id="prdList">
	
		<div class = sPrdListTitle>
    		<br/><br/>
    		<h1>등록 상품 관리</h1>
    	</div> 
		<hr />
		<table id="listTable">
			<tr>
				<th>상품번호</th>
				<th>상품명</th>
				<th>가격(원)</th>
				<th>남은수량</th>
				<th>조회수</th>
				<th>등록일</th>
				<th>상태</th>
				<th>배송/재입고</th>
			</tr>
		</table>
		<br />
		<hr />
		<input id="del" type="button" value="삭제" />
		<input type="button" id="btnWrite" value="상품등록" onclick="location.href='prd_writeForm.jsp'"/>
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
			sell_id:"${sessionScope.loginId}"
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
		var stflag = "";
		
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
			content+="<td><input type='button' class=transBtn onclick='pur_st("+item.prd_Id+")' value='배송관리'/></td>";
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
			location.href="myPage.jsp";
		}
		console.log(obj);
		ajaxCall(obj);
	});
	
	function ajaxCall(param){
		console.log(param);
		$.ajax(param);
	}
	
	function pur_st(prd_id){
		obj.url="./prd_delieveryList";
		obj.data={prd_id:prd_id};
		obj.success=function(data){
			console.log(data.list);
			$("#listTable").empty();
			delieveryList(data.list);
		}
		ajaxCall(obj);
	}
	//상품별 주문내역 리스트 뽑아내기
	function delieveryList(list){
		console.log(list);
		var content = "<input type='button' onclick=location.href='myPage.jsp' value='돌아가기'/>";
		content+="";
		content+="<table id='listTable'><tr><th style='width: 100px;'>주문날짜</th><th style='width: 100px;'>이름</th>"
			+"<th style='width: 300px;'>주소</th>"
			+"<th style='width: 100px;'>전화번호</th>"
			+"<th style='width: 100px;'>주문수량</th>"
			+"<th style='width: 100px;'>상태</th>"
			+"<th style='width: 100px;'>운송장번호</th></tr>";
		list.forEach(function(item, pur_id){
			content+="<tr>";
			content+="<td>"+item.pur_date+"</td>";
			content+="<td>"+item.user_Name+"</td>";
			content+="<td style='display: inline-block; width: 200px;'>"+item.user_Addr+"</td>";
			content+="<td>"+item.user_Phone+"</td>";
			content+="<td>"+item.pur_count+"</td>";
			content+="<td id='st_"+item.pur_id+"'>"+item.pur_state+"</td>";
			content+="<td id='delie_"+item.pur_id+"'>"+item.pur_delievery+"</td>";
			if(item.pur_delievery>0){
				stflag = "<td></td>";
			}else{
				stflag = "<td><input type='button' id='btnDeli_"+item.pur_id+"'onclick='delievery("+item.pur_id+")' value='배송등록'/></td>";
			}
			content+=stflag;
			content+="</tr>";
		});
		content+="</table>";
		$("#listTable").append(content);
	}
	function delievery(pur_id){
		obj.url="./prd_delievery";
		obj.data={pur_id:pur_id};
		obj.success=function(data){
			if(data.list.length > 0){
				alert("배송등록 되었습니다.");
				console.log(data.list);
				$("#btnDeli_"+pur_id).attr("disabled","true");
				$("#delie_"+pur_id).html(data.list[0].pur_delievery);
				$("#st_"+pur_id).html(data.list[0].pur_state);
			}else{
				alert("배송등록에 실패했습니다.");
			}
		}
		ajaxCall(obj);
	}
</script>
</html>