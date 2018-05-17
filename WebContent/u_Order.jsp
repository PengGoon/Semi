<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html> 
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			table,td{
                            border: 1px solid black; 
                            width: 0%;
                            padding: 10px;
                            border-top: 1px solid #444444;
                            border-collapse: collapse;
                            text-align: center;
                           
                          }
                          
          			.ta{
          				border-left: 1px solid #FFF;
          			}
          			.tb{
          				border-right: 1px solid #FFF;
          			}           
		</style>
	</head>
	<body>
		<h3>리스트 페이지</h3>
			

		<table id="listTable">
			<tr>
				<td colspan="2"> <input type="checkbox" id="allcheck">주문번호  </td>
				<td  colspan="2">상품정보</td>
				<td>수량</td>
				<td>구매일</td>
				<td>배송상태</td>
				<td>관리</td>
<!-- 			<td>이메일</td>
				<td>핸드폰</td> -->
			</tr>
			<!-- JSON 내용을 테이블로 출력 -->
		</table>
		<input id="del" type="button" value="삭제"/>
		<input type="button" value="로그인" onclick="location.href='login.jsp'"/>
	</body>
	<script>
	//리스트 호출(ajax)
	var obj = {};
	obj.error=function(e){console.log(e)};
	obj.type="POST";
	obj.dataType = "JSON";
	
	$(document).ready(function(){
		obj.url="./u_list";
		obj.success = function(data){
			/* //console.log(data);
			if(data.login){
				//리스트 보여주기
				listPrint(data.list);
			}else{
				alert("로그인이 필요한 서비스 입니다.");
				location.href="index.html";
			} */
		}
		ajaxCall(obj);
	});
	
	function listPrint(list){
		console.log(list);
		var content ="";
		
		list.forEach(function(list, prd_Id){
			content += "<tr>";
			content +="<td class='tb'><input class='checkcheck' type='checkbox' value='"+list.prd_Id+"'/></td>";
			content +="<td class='ta'>"+list.prd_Id+"</td>";
			content +="<td class='tb'><a href='./detail?user_id="+list.prd_Id+"'>"+list.prd_Name+"</a></td>";
			content +="<td>"+list.prd_Price+"</td>";
			content +="<td>"+list.prd_Count+"</td>"; 
			content +="<td>"+list.newFileName1+"</td>";
			content +="<td>"+"<input type='button' value='후기작성' onclick=location.href='delete.html' /></td>";
			content += "</tr>";
		});		
		$("#listTable").append(content);
	}
	
	//체크박스
	$("#allcheck").click(function () {
		//만약 전체 선택 체크박스가체크된 상태일경우
		if($("#allcheck").prop("checked")){
			//해당화면 에전체 checkbox들을 체크해준다
			$("input[type='checkbox']").prop('checked', true) ;
		}else{
			//해당화면 에전체 checkbox들을 체크해제시켜준다
			$("input[type='checkbox']").prop('checked', false) ;
		}
		
	});
	//삭제
	$("#del").click(function(){
		obj.url="./delete";
		var checked = [];
		//$(elem).each() == elem.forEach()
		$(".checkcheck:checked").each(function(){
			checked.push($(this).val());			
		});
		console.log(checked);		
		obj.data = {delList:checked};
		obj.success = function(data){
			if(data.success){
				alert("삭제에 성공 했습니다.");
			}else{
				alert("삭제에 실패 했습니다.");
			}		
			location.href="main.html";
		}
		console.log(obj);
		ajaxCall(obj);
	});
	
	function ajaxCall(param){
		//console.log(param);
		$.ajax(param);
	}
	</script>
</html>