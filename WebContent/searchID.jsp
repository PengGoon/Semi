<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매자 아이디 찾기</title>
<style type="text/css">
table, td, th {
	border-collapse: collapse;
	padding: 5px 10px;
	text-align: center;
	top: 150;
	left: 200px;
	border: 1px solid black;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<h2 style="text-align: center;">판매자 아이디 찾기</h2>
	<table>
		<tr>
			<td>이름</td>
			<td><input class="inputTxt" type="text" name="search_userName"
				placeholder="이름 입력란" style="width: 100%" /></td>
		</tr>
		<tr>
			<td>EMAIL</td>
			<td><input class="inputTxt" type="text" name="search_email"
				style="width: 150" placeholder="이메일 입력란" /> @ <input type="text"
				id="emailview" name="search_emailview" style="width: 150"
				placeholder="이메일 선택" disabled="true" /> <select id="search_email">
					<option value="0">이메일을 선택 하세요</option>
					<option value="1">직접입력</option>
					<option>naver.com</option>
					<option>hanmail.net</option>
					<option>google.com</option>
					<option>nate.com</option>
					<option>daum.net</option>
			</select></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" id="searchIDbtn"
				value="아이디 찾기" /></td>
		</tr>
	</table>
</body>
<script type="text/javascript">
	var msg = "${msg}";

	if (msg != "") {
		alert(msg);
	}

	var obj = {};//초기화   
	obj.type = "post";
	obj.dataType = "json";
	obj.data = {};
	//obj.enctype = "multipart/form-data";
	obj.error = function(e) {
		console.log(e)
	};

	$("#search_email").change(function() {
		$("#search_email option:selected").each(function() {

			if ($(this).val() == '0') {
				$("#emailview").val("이메일 입력란");
				$("#emailview").attr("disabled", true);
			}

			else if ($(this).val() == '1') { //직접입력일 경우
				$("#emailview").val(''); //값 초기화
				$("#emailview").attr("placeholder", "직접입력");
				$("#emailview").attr("disabled", false); //활성화 
			} else { //직접입력이 아닐경우 
				$("#emailview").val($(this).text()); //선택값 입력
				$("#emailview").attr("disabled", true); //비활성화
			}
		});
	});

	$("#searchIDbtn").click(
			function() {
				if ($("input[name='search_userName']").val() == "") {//이름 입력 확인
					alert("이름을 확인 해 주세요!");
					$("input[name='userName']").focus();//포커스 이동
				} else if ($("input[name='search_email']").val() == "") {//이메일 입력 확인
					alert("이메일을 확인 해 주세요!");
					$("input[name='searach_email']").focus();//포커스 이동
				} else {
					console.log("서버 전송");
					obj.url = "./searchID";
					obj.data.search_name = $("input[name='search_userName']")
							.val();
					obj.data.search_email = $("input[name='search_email']")
							.val()
							+ "@" + $("input[name=search_emailview]").val();

					obj.success = function(data) {
						console.log(data);
						if (data.success == "해당 정보가 없습니다.") {
							alert(data.success);
						} else {
							alert("찾으시는 아이디는 " + data.success + " 입니다.");
							window.open("about:blank", "_self").close();
						}
					}
					console.log(obj);
					ajaxCall(obj);
				}
			});

	function ajaxCall(obj) {
		$.ajax(obj);
	}
</script>
</html>