<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
    pageEncoding="UTF-8"%>
<html> 
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			.muen li{
                        
                        list-style: none;
                        padding: 5px 10px;
                        text-align: left;
                        float: left;
                        width: 300px;
                        text-align: center;
                       	 border: 1px solid black; 

                    }
		
			table,td{

                            /* border: 1px solid black; */ 
                            width: 0%;
                            padding: 10px;
                            border-top: 1px solid #444444;
                            border-collapse: collapse;
                            text-align: center;
							margin: 0 auto;
							border-bottom: 1px solid #444444;                            
                          }
                          
          			 .ta{
          				border-left: 1px solid  #444444;
          				border-right: 1px solid #FFFFFF;
          			}
          			.tb{
          			
          				border-left: 1px solid #FFFFFF;
          			}
          			.tc{
          				border-left: 1px solid  #FFFFFF;
          				border-right: 1px solid #FFFFFF;
          			}
          			.td{
          				/* border-left: 1px solid #FFFFFF; */
          				border-left: 1px solid #FFFFFF;
          				text-align: center;
          			
          			}
          			.te{
          				border-left: 1px solid  #FFFFFF;
          				border-right: 1px solid #444444;
          			}           
		</style>
	</head>
	<body>
		<jsp:include page="user_navi.jsp"></jsp:include>
		<br>
        <br>
        <ul class="muen">
            <li>
                <a href="u_Order.jsp">주문내역</a>
            </li>
            <li>
                <a href="cart.jsp">장바구니</a>
            </li>
            <li>
                <a href="reviewList.jsp">작성한후기</a>
            </li>
            <li>
                <a href="u_updateform.jsp">개인정보수정</a>
            </li>
        </ul>
        <br><br><br><br>	
		<table id="listTable">
			<tr>
				<td colspan="2"> <input type="checkbox" id="allcheck">주문번호  </td>
				<td  colspan="3">상품정보</td>
				<td>수량</td>
				<td>구매일</td>
				<td>배송상태</td>
				<td>관리</td>
			</tr>
			<!-- JSON 내용을 테이블로 출력 -->
		</table>
		<input id="del" type="button" value="삭제"/>
	</body>
	<script>
=======
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
table, td {
	border: 1px solid black;
	width: 0%;
	padding: 10px;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	text-align: center;
}

.ta {
	border-left: 1px solid #FFF;
}

.tb {
	border-right: 1px solid #FFF;
}
</style>
</head>
<body>
	<h3>리스트 페이지</h3>


	<table id="listTable">
		<tr>
			<td colspan="2"><input type="checkbox" id="allcheck">주문번호
			</td>
			<td colspan="2">상품정보</td>
			<td>수량</td>
			<td>구매일</td>
			<td>배송상태</td>
			<td>관리</td>
			<!-- 			<td>이메일</td>
				<td>핸드폰</td> -->
		</tr>
		<!-- JSON 내용을 테이블로 출력 -->
	</table>
	<input id="del" type="button" value="삭제" />
	<input type="button" value="로그인" onclick="location.href='login.jsp'" />
</body>
<script>
>>>>>>> e4b478ff2fd5f87b61adf267b0cf1463e74c606f
	//리스트 호출(ajax)
	var obj = {};
	obj.error = function(e) {
		console.log(e)
	};
	obj.type = "POST";
	obj.dataType = "JSON";
<<<<<<< HEAD
	
	$(document).ready(function(){
		obj.url="./u_list";
		obj.success = function(data){
			 //console.log(data);
			if(data.list){
=======

	$(document).ready(function() {
		obj.url = "./u_list";
		obj.success = function(data) {
			/* //console.log(data);
			if(data.login){
>>>>>>> e4b478ff2fd5f87b61adf267b0cf1463e74c606f
				//리스트 보여주기
				listPrint(data.list);
			}else{
				alert("로그인이 필요한 서비스 입니다.");
				location.href="index.jsp";
			} 
		}
		ajaxCall(obj);
	});

	function listPrint(list) {
		console.log(list);
<<<<<<< HEAD
		//console.log(list.pur_count);
		
		
		var content ="";
		
		list.forEach(function(list, pur_id){
			content += "<tr>";
			content +="<td class='tb'><input class='checkcheck' type='checkbox' value='"+list.pur_id+"'/></td>";
			//content +="<td class='td'><a href='./list?prd_Id="+list.prd_Id+"'>"+list.prd_id+"</a></td>";
			content +="<td class='td'>"+list.prd_id+"</td>";
			content +="<td class='ta'><img width='100' src='./upload/"+list.newFileName1+"'/></td>";//상품이름
			content +="<td class='tc'>"+list.prd_name+"</td>";//상품이름
			content +="<td class='te'>가격:"+list.prd_price+"원</td>"; //가격
			content +="<td>"+list.pur_count+"</td>";//수량
			content +="<td>"+list.pur_date+"</td>"; //날짜
			content +="<td>"+list.pur_state+"</td>";//배송
			content +="<td>"+"<input type='button' value='후기작성' onclick=location.href='reviewWriteForm.jsp' /></td>";//ok
=======
		var content = "";

		list.forEach(function(list, prd_Id) {
			content += "<tr>";
			content += "<td class='tb'><input class='checkcheck' type='checkbox' value='"+list.prd_Id+"'/></td>";
			content += "<td class='ta'>" + list.prd_Id + "</td>";
			content += "<td class='tb'><a href='./detail?user_id="
					+ list.prd_Id + "'>" + list.prd_Name + "</a></td>";
			content += "<td>" + list.prd_Price + "</td>";
			content += "<td>" + list.prd_Count + "</td>";
			content += "<td>" + list.newFileName1 + "</td>";
			content += "<td>"
					+ "<input type='button' value='후기작성' onclick=location.href='delete.html' /></td>";
>>>>>>> e4b478ff2fd5f87b61adf267b0cf1463e74c606f
			content += "</tr>";
		});
		$("#listTable").append(content);
	}
<<<<<<< HEAD
	
	 
=======

>>>>>>> e4b478ff2fd5f87b61adf267b0cf1463e74c606f
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
<<<<<<< HEAD
	$("#del").click(function(){
		obj.url="./u_delete";
=======
	$("#del").click(function() {
		obj.url = "./delete";
>>>>>>> e4b478ff2fd5f87b61adf267b0cf1463e74c606f
		var checked = [];
		//$(elem).each() == elem.forEach()
		$(".checkcheck:checked").each(function() {
			checked.push($(this).val());
		});
		console.log(checked);
		obj.data = {
			delList : checked
		};
		obj.success = function(data) {
			if (data.success) {
				alert("삭제에 성공 했습니다.");
<<<<<<< HEAD
				location.href="u_Order.jsp";
			}else{
				alert("삭제에 실패 했습니다.");
			}		
=======
			} else {
				alert("삭제에 실패 했습니다.");
			}
			location.href = "main.html";
>>>>>>> e4b478ff2fd5f87b61adf267b0cf1463e74c606f
		}
		console.log(obj);
		ajaxCall(obj);
	});

	function ajaxCall(param) {
		//console.log(param);
		$.ajax(param);
	}
</script>
</html>