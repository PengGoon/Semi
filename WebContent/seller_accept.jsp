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
			<th>번호</th>
			<th>판매자(아이디)</th>
			<th>가입일</th>
			<th>이미지</th>
			<th>승인 / 거절</th>
		</tr>

		<!-- JSON 내용을 테이블로 출력 -->
	</table>
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
			//console.log(data);
			/* if (data.login) {
				//리스트 보여주기
				listPrint(data.list);
			} else {
				alert("로그인이 필요한 서비스 입니다.");
				location.href = "index.html";
			}*/
		}
		ajaxCall(obj);
	});

	function listPrint(list) {
		console.log(list);
		var i = 1;
		var content = "";
		list
				.forEach(function(item, idx) {
					if (item.sell_yn == 1) {
						var date_split = item.reg_date.split(' ');
						content += "<tr>";
						content += "<td>" + i + "</td>";
						content += "<td>" + item.name + "(" + item.id + ")"
								+ "</td>";
						content += "<td>" + date_split[0] + "</td>";
						content += "<td><img width='200' src="+item.filename+"></td>";
						content += "<td>" + "<button class='no' onclick="
								+ "location.href='acptok?sell_id=" + item.id
								+ "'>" + "승인" + "</button>"
								+ "<button onclick='accept_no("+i+")'" + ">" + "거절"
								+ "</button>";
						content += "<form id="+i+" method='post' action='acptno.jsp' target='childForm'>";
						content += "<input type='hidden' name='sell_id' value="+item.id+">";
						content += "<input type='hidden' name='sell_name' value="+item.name+">";
						content += "<input type='hidden' name='sell_email' value="+item.email+">";
						content += "</form></td>";
						content += "</tr>";
						i++;
						/* "</button>" + "<button onclick="
						+ "location.href='./acptno.jsp?sell_id=" + item.id
						+ "'>" + "거절" + "</button>" */
						/* 				
						
						 <input type=”hidden” name=”something” value=”something” />
						 <input type=”hidden” name=”more” value=”something” />
						 <input type=”hidden” name=”other” value=”something” />
						 </form> */
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