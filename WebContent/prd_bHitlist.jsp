<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			#bHitlist {
				width: 1000px;
				margin: 0 auto;
			}
			#bHitlist table{
	            width:150px; 
				height:200px;
				border: 1px solid black;
				border-collapse: collapse;
				text-align: center;
				float: left;
				margin: 7px;
	        }
	        #bHitlist th,#bHitlist tr{
				border: 1px solid black;
				border-collapse: collapse;
				text-align: center;
			}
			#bHitlist th{
				height: 50px;
			}
			#bHitlist img{
				width: 300px;
				height: 300px;
			}
		</style>
	</head>
	<body>
		<jsp:include page="navi.jsp"></jsp:include>
		<div id="bHitlist">
			<h2>인기 순</h2>
		</div>
	</body>
	<script>
		//리스트 호출
		var obj = {};
		obj.error = function(e){console.log(e)};
		obj.type="post";
		obj.dataType="json";
		
		$(document).ready(function(){
			obj.url="./prd_bHitlist";
			obj.success = function(data){
				console.log(data);
				listPrint(data.list);
			}
			ajaxCall(obj);
		});
		
		//인기순 리스트 뽑기
		function listPrint(list){
			console.log(list);
			var content = "";
			var flag = "";

			list.forEach(function(item, prd_id){
				content+="<table>";
				content+="<tr>";
				content+="<td><a href='./prd_detail?prd_id="+item.prd_Id+"'><img src='./upload/"+item.newFileName1+"'/></a></td>";
				content+="</tr>";
				content+="<tr>";
				content+="<th>"+item.prd_Name+"<br/>";
				content+=item.prd_Price+" 원</th>";
				content+="</tr>";
				content+="<tr>";
				content+="<th>조회수 : "+item.prd_bHit+"</th>";
				content+="</tr>";
				content+="</table>";
			});
			$("#bHitlist").append(content);
		}
		
		function ajaxCall(param){
			console.log(param);
			$.ajax(param);
		}
	</script>
</html>