<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			#listCenter {
				width: 1000px;
				margin: 0 auto;
			}
			#searchlist th,#searchlist td,#searchlist tr{
				border: 1px solid black;
				border-collapse: collapse;
				text-align: center;
			}
			#searchlist{
				width: 100%;
				border: 1px solid black;
				border-collapse: collapse;
				text-align: center;
			}
			#searchlist img{
				width:100px;
				height:100px;
			}
			#sortSel{
				float: right;
			}
			#searchContent{
				font-size: 30;
			}
		</style>
	</head>
	<body>
		<jsp:include page="navi.jsp"></jsp:include>
		<div id="listCenter">
		<select id="sortSel" name="sortSel" onchange="sort(this.value)">
			<option value="전체 품목" selected="selected" >전체 품목</option>
			<option value="조회수 순">조회수 순</option>
			<option value="높은 가격 순">높은 가격 순</option>
			<option value="낮은 가격 순">낮은 가격 순</option>
		</select>
		<p id="searchContent"></p>
		<table id="searchlist">
			<tr>
				<th colspan="2">상품명</th>
				<th>가격</th>
				<th>남은수량</th>
				<th>조회수</th>
				<th></th>
			</tr>
		<c:forEach items="${list}" var="bbs">
			<tr>
				<td><a href="prd_detail?prd_id=${bbs.prd_Id}"><img src="./upload/${bbs.newFileName1}"/></a></td>
				<td><a href="prd_detail?prd_id=${bbs.prd_Id}">${bbs.prd_Name}</a></td>
				<td>${bbs.prd_Price}</td>
				<td>${bbs.prd_Count}</td>
				<td>${bbs.prd_bHit}</td>
				<td><input type="button" value="더보기" onclick="location.href='prd_detail?prd_id=${bbs.prd_Id}'"/></td>
			</tr>
		</c:forEach>
		</table>
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
		
		var content = "<%=request.getParameter("search_name") %>";
		$(document).ready(function(){
			if(content == ""){
				$("#searchContent").text("전체항목에 대한 검색결과 입니다.");
			}else{
				$("#searchContent").text("'"+content+"' 에 대한 검색결과 입니다.");
			}
		});
		
		function ajaxCall(param){
			console.log(param);
			$.ajax(param);
		}
		
		function sort(val){
			switch (val) {
			case "조회수 순":
				tableSort(val,content);
				break;
			case "높은 가격 순":
				tableSort(val,content);
				break;
			case "낮은 가격 순":
				tableSort(val,content);
				break;
			case "전체 품목":
				tableSort(val,content);
				break;
			}
		}
		
		//정렬
		function tableSort(val,content){
			obj.url="./prd_searchSort";
			obj.data={data:val,content:content};
			obj.success=function(data){
				console.log(data.list);
				$("#searchlist").empty();
				listPrint(data.list);
			}
			console.log(obj);
			ajaxCall(obj);
		}
		
		//리스트 뽑아내기
		function listPrint(list){
			console.log(list);
			var content = "";
			var flag = "";
			
			content+="<tr><th colspan='2'>상품명</th><th>가격</th><th>남은수량</th><th>조회수</th><th></th></tr>"
			list.forEach(function(item, prd_id){
				content+="<tr>";
				content+="<td><a href='prd_detail?prd_id="+item.prd_Id+"'><img src='./upload/"+item.newFileName1+"'/></a></td>";
				content+="<td><a href='prd_detail?prd_id="+item.prd_Id+"'>"+item.prd_Name+"</a></td>";
				content+="<td>"+item.prd_Price+"</td>";
				content+="<td>"+item.prd_Count+"</td>";
				content+="<td>"+item.prd_bHit+"</td>";
				content+="<td><input type='button' value='더보기' onclick='#'/></td>";
				content+="</tr>";
			});
			$("#searchlist").append(content);
		}
	</script>
</html>