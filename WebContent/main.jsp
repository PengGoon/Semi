<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<h3>리스트 페이지</h3>

	<input type="button" id="update" value="판매자 정보 수정" />&nbsp;&nbsp;&nbsp;
	<input type="button" id="request" value="관리자에게 판매자 등록 요청" />
	<input type="button" id="gomain" value="메인페이지 이동"/>
	<table id="listTable">
		<tr>
			<th>선택</th>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<!-- JSON 내용을 테이블로 출력 -->
	</table>
	<input id="del" type="button" value="삭제" />
	<input type="button" value="글쓰기"
		onclick="location.href='writeForm.html'" />
</body>
<script>
	//리스트 호출(ajax)
	var obj = {};
	obj.error = function(e) {
		console.log(e)
	};
	obj.type = "POST";
	obj.dataType = "JSON";

	$(document).ready(function() {
		obj.url = "./list";
		obj.success = function(data) {
			//console.log(data);
			if (data.login) {
				//리스트 보여주기
				listPrint(data.list);
			} else {
				alert("로그인이 필요한 서비스 입니다.");
				location.href = "index.html";
			}
		}
		ajaxCall(obj);
	});

	function listPrint(list) {
		console.log(list);
		var content = "";
		//idx, user_name, subject, reg_date, bHit
		list
				.forEach(function(item, idx) {
					content += "<tr>";
					content += "<td><input type='checkbox' value='"+item.idx+"'/></td>";
					content += "<td>" + item.idx + "</td>";
					content += "<td><a href='./detail?idx=" + item.idx + "'>"
							+ item.subject + "</a></td>";
					content += "<td>" + item.user_name + "</td>";
					content += "<td>" + item.reg_date + "</td>";
					content += "<td>" + item.bHit + "</td>";
					content += "</tr>";
				});
		$("#listTable").append(content);
	}

	//삭제
	$("#del").click(function() {
		obj.url = "./delete";
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
			location.href = "main.html";
		}
		console.log(obj);qq
		ajaxCall(obj);
	});

	$("#update").click(function() {
		location.href = "updateform.jsp";
	});

	$("#request").click(function(){
		location.href="requestform.jsp";
	});
	
	$("#gomain").click(function(){
		location.href="user_main.jsp";
	});
	
	function ajaxCall(param) {
		//console.log(param);
		$.ajax(param);
	}
</script>
</html>