<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	</head>
	<style>
		#cartListTable,#cartListTable td{
			border: 1px solid black;
			border-collapse: collapse;
			width: 1000px;
			text-align: center;
		}
		#cartListDiv{
			width: 1000px;
			margin: 0 auto;
		}
	</style>
	<body>
		<jsp:include page="navi.jsp"></jsp:include>
		<div id="cartListDiv">
		<br/>
        <table id="cartListTable">
          <tr>
          		<td></td>
                <td>상품명</td>
                <td>상품수량</td>
                <td>가격</td>
          </tr>
        </table>
        <button id="continue">쇼핑 계속하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
        <button id="buy">구매하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="del" type="button" value="삭제" />
        </div>
	</body>
	<script>
		var obj = {};
		var cnt = "data.list[i].prd_count";
		obj.error = function(e){console.log(e)};
		obj.type="POST";
		obj.dataType="JSON";
		
		$(document).ready(function() {
			$.ajax({
				type : "post",
				url : "./cartList",
				dataType : "json",
				data : {
					user_id: "${sessionScope.loginUserId}",
				},
				success : function(data) {
					for(var i=0; i<data.list.length; i++) {
						var str = "<tr><td><input type='checkbox' value='"+data.list[i].cart_id+"'/></td>";
							str += "<td><a href=./cartDetail?prd_id="+data.list[i].prd_id+"&&prd_count="+data.list[i].prd_count+">"+data.list[i].prd_name+"</a></td>";
							str += "<td>"+data.list[i].prd_count+"</td>";
							str += "<td>"+data.list[i].prd_price*data.list[i].prd_count+"원"+"</td></tr>";
						$("#cartListTable").append(str);
					}
				},
				error : function(err) {
					console.log(err)
				}
			});
		});
		
		$("#continue").click(function(){
   	 		location.href="index.jsp"; 
    	});
		
		$("#del").click(function(){
			obj.url="./cartDel";
			var checked = [];
			
			$("input[type='checkbox']:checked").each(function(){
				checked.push($(this).val());
			});
			console.log(checked);
			obj.data = {delList:checked};
			obj.success = function(data){
				if(data.success){
					alert("삭제에 성공했습니다.");
				}else{
					alert("삭제에 실패했습니다.");
				}
				location.href="cartList.jsp";
			}
			console.log(obj);
			ajaxCall(obj);
		});
		
		$("#buy").click(function(){
			var checked = [];
			$("input[type='checkbox']:checked").each(function(){
				checked.push($(this).val());
			});
			console.log(checked);
			location.href='./cart.jsp?checked='+checked;
		});
		
		/*
		$("#buy").click(function(){
			obj.url="./cartBuy";
			var checked = [];
			$("input[type='checkbox']:checked").each(function(){
				checked.push($(this).val());
			});
			console.log(checked);
			obj.data = {buyList:checked};
			obj.success = function(data){
				if(data.success){
					//location.href='./cartDetail?prd_id="+data.list[i].prd_id+"&&prd_count="+data.list[i].prd_count+">"+data.list[i].prd_name+"';
					location.href='./cartDetail';
				}else{
					alert("구매에 실패했습니다.");
				}
			}
			ajaxCall(obj);
		});
		*/
		
		/* $("#buy").click(function(){
			obj.url="./cartBuy";
			var checked = [];
			
			$("input[type='checkbox']:checked").each(function(){
				checked.push($(this).val());
			});
			console.log(checked);
			obj.data = {delList:checked};
			obj.success = function(data){
				if(data.success){
					alert("삭제에 성공했습니다.");
				}else{
					alert("삭제에 실패했습니다.");
				}
				location.href="cartList.jsp";
			}
			console.log(obj);
			ajaxCall(obj);
		}); */
		
		function ajaxCall(param){
			console.log(param);
			$.ajax(param);
		}
		 
	</script>
</html>