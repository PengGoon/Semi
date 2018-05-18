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
		</style>
	</head>
	<body>
		<jsp:include page="navi.jsp"></jsp:include>
		<div id="listCenter">
		<select id="sortSel" name="sortSel" onchange="sort(this.value)">
			<option value="상세검색" selected="selected">상세검색</option>
			<option value="조회수 순">조회수 순</option>
			<option value="높은 가격 순">높은 가격 순</option>
			<option value="낮은 가격 순">낮은 가격 순</option>
		</select>
		<h2>"<%=request.getParameter("search_name") %>" 로 검색하신 내용입니다.</h2>
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
				<td>
				<a href="prd_detail?prd_id=${bbs.prd_Id}">
					<c:if test="${bbs.newFileName1 ne null}"><img src="./upload/${bbs.newFileName1}"/></c:if>
				</a>
				</td>
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
		
		function ajaxCall(param){
			console.log(param);
			$.ajax(param);
		}
		
		function sort(val){
			switch (val) {
			case "조회수 순":
				console.log("조회수 순입니다.");
				break;
			case "높은 가격 순":
				console.log("높은 가격 순입니다.");
				break;
			case "낮은 가격 순":
				console.log("낮은 가격 순입니다.");
				break;
			}
		}
		
		
	</script>
</html>