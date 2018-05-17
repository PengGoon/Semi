<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<style>
table, td, th {
	border: 1px solid black;
}
</style>
<body>
	<table id="listTable">
		<tr>
			<th>선택</th>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>핸드폰번호</th>
			<th>주소</th>
			<th>가입일</th>
		</tr>

		<!-- JSON 내용을 테이블로 출력 -->
	</table>
	<input id="sell_del" type="button" value="삭제" />
</body>
<script>
	var msg = "${msg}";

	var sell_id;
	if (msg != "") {
		alert(msg);
	}
	var obj = {};
	obj.error = function(e) {
		console.log(e)
	};
	obj.type = "POST";
	obj.dataType = "JSON";

	$(document).ready(function() {
		obj.url = "./seller_accept_list";
		obj.success = function(data) {
			listPrint(data.list);
		}
		ajaxCall(obj);
	});

	$("#sell_del").click(function() {
		obj.url = "./sell_delete";
		var checked = [];
		//$(elem).each() == elem.forEach()
		$("input[type='checkbox']:checked").each(function() {
			checked.push($(this).val());
		});
		console.log(checked);
		obj.data = {
			delList : checked
		};
		obj.success = function(data) {
			if (data.success) {
				alert("삭제에 성공 했습니다.");
			} else {
				alert("삭제에 실패 했습니다.");
			}
			location.href = "./admin";
		}
		console.log(obj);
		ajaxCall(obj);
	});
	
	function listPrint(list) {
		console.log(list);
		var i = 1;
		var content = "";
		list
				.forEach(function(item, idx) {
					if (item.sell_yn == 2) {
						var date_split = item.reg_date.split(' ');
						content += "<tr>";
						content += "<td><input type='checkbox' value='"+item.id+"'/></td>";
						content += "<td>" + i + "</td>";
						content += "<td>" + item.id + "</td>";
						content += "<td>" + item.name + "</td>";
						content += "<td>" + item.phone + "</td>";
						content += "<td>" + item.addr + "</td>";
						content += "<td>" + date_split[0] + "</td>";
						content += "</tr>";
						i++;
					}
				});
		$("#listTable").append(content);
	}

	var openWin;
	function accept_no(idx) {
		// window.name = "부모창 이름"; 
		window.name = "parentForm";
		//window.open("open할 window", "자식창 이름", "팝업창 옵션");
		openWin = window.open("acptno.jsp", "childForm",
				"width=500, height=300, resizable = no, scrollbars = no");
		document.getElementById(idx).submit();
	}

	function ajaxCall(param) {
		//console.log(param);
		$.ajax(param);
	}
</script>
</html>