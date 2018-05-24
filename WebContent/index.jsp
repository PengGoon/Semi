<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>농산물 쇼핑몰 Mar-KH-et</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script src="http://malsup.github.com/jquery.cycle2.js"></script>
	</head>
	<style>
		#wrapper {
			width: 1000px;
		    margin: 10 auto 10 auto;
		}
		#mainImg{
			z-index: 1;
            width: 1000px;
            height: 250px;
        }
        .bestImg{
            width: 1000px;
            height: 300px;
        }
        .bestImg table{
            width:150px; 
			height:200px;
			border: 1px solid black;
			border-collapse: collapse;
			text-align: center;
			float: left;
			margin: 7px;
        }
        .bestImg th,.bestImg tr{
			border: 1px solid black;
			border-collapse: collapse;
			text-align: center;
		}
		.bestImg th{
			height: 50px;
		}
		.bestImg img{
			width: 180px;
			height: 180px;
		}
	</style>
	
	<body>
	<jsp:include page="navi.jsp"></jsp:include>
	<div id="wrapper">
		
		<div id="mainImg" class="cycle-slideshow" data-cycle-loader="wait" data-cycle-timeout="1000">
			<img src="image/main1.png" /> 
			<img src="image/main2.png" />
			<img src="image/main3.png" /> 
			<img src="image/main4.png" />  
		</div>
		
		<br/>
        <h2>BEST</h2>
        <div class="bestImg" id="bHitTable"></div>
        
        <br/>
        <h2>신상품</h2>
        <div class="bestImg" id="dateTable"></div>
       
        <br/>
        <h2>후기</h2> 
        <jsp:include page="reviewList.jsp"></jsp:include>
    </div>
    
	</body>
	<script>
		//리스트 호출
		var obj = {};
		obj.error = function(e){console.log(e)};
		obj.type="post";
		obj.dataType="json";
		
		$(document).ready(function(){
			obj.url="./main_list";
			obj.success = function(data){
				console.log(data);
				listPrint1(data.list1);
				listPrint2(data.list2);
			}
			ajaxCall(obj);
		});
		
		//인기순 리스트 뽑기
		function listPrint1(list){
			console.log(list);
			var content = "";
			var flag = "";

			list.forEach(function(item, prd_id){
				content+="<table>";
				content+="<tr>";
				content+="<td><a href='./prd_detail?prd_id="+item.prd_Id+"'><img src='"+item.newFileName1+"'/></a></td>";
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
			$("#bHitTable").append(content);
		}
		
		//신상순 리스트 뽑기
		function listPrint2(list){
			console.log(list);
			var content = "";
			var flag = "";

			list.forEach(function(item, prd_id){
				content+="<table>";
				content+="<tr>";
				content+="<td><a href='./prd_detail?prd_id="+item.prd_Id+"'><img src='"+item.newFileName1+"'/></a></td>";
				content+="</tr>";
				content+="<tr>";
				content+="<th>"+item.prd_Name+"<br/>";
				content+=item.prd_Price+" 원</th>";
				content+="</tr>";
				content+="<tr>";
				content+="<th>등록일 : "+item.prd_Date+"</th>";
				content+="</tr>";
				content+="</table>";
			});
			$("#dateTable").append(content);
		}
		
		function ajaxCall(param){
			console.log(param);
			$.ajax(param);
		}
	</script>
</html>