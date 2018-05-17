<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
table, td, th {
	border: none;
	border-collapse: collapse;
	padding: 5px 10px;
	text-align: center;
}

.loginTitle {
	font-size: 20;
	margin: 30px 0px 10px 0px;
	text-align: center;
	color: limegreen;
}

.loginTable {
	position: fixed;
	top: 310px;
	left: 39%;
}

.background {
	position: fixed;
	width: 100%;
	height: 230px;
	background-color: limegreen;
	opacity: 0.15;
}

hr {
	border: none;
	border: 1px solid limegreen;
	color: limegreen; /* IE */
	border-color: limegreen; /* 사파리 */
	background-color: limegreen; /* 크롬, 모질라 등, 기타 브라우저 */
}

.button {
	font-weight: 600;
	border-style: solid;
	height: 50px;
	width: 125px;
	border-color: limegreen;
	background-color: white;
	color: limegreen;
	cursor: pointer;
}

#login {
	font-weight: 800;
	border-style: solid;
	height: 100px;
	width: 100px;
	border-color: limegreen;
	background-color: limegreen;
	color: white;
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="navi.jsp"></jsp:include>
	<div class=loginTitle>
		<h1>로그인</h1>
		<h4 style="color: black">
			개인 <input type="radio" name="sel" value="user" checked="checked"/>
			<!-- userJoin.jsp(개인)로 이동  -->
			&nbsp;&nbsp;&nbsp; 판매자 <input type="radio" name="sel" value="seller" />
			<!--join.jsp(판매자) 로 이동 -->
		</h4>
	</div>
	<div class=background></div>
	<table class=loginTable>
		<tr>
			<th>아이디</th>
			<td><input type="text" id="user_Id" name="user_Id" style="height: 43px" /></td>
			<td rowspan="2"><input id="login" type="button" value="회원 로그인"
				height="80px" /></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" id="user_Pw" name="user_Pw" style="height: 43px" />
			</td>
		</tr>
		<tr>
			<td colspan="3"><br />
				<hr /> <input class=button onclick="findId()" type="button"
				value="아이디 찾기" /> <input class=button onclick="findPw()"
				type="button" value="비밀번호 찾기" /> <input class=button
				onclick="join()" type="button" value="회원가입" /></td>
		</tr>
	</table>

</body>
<script>
	$("#login").click(function() { // 로그인 버튼 클릭 시 
		
		// 아이디, 비밀번호 입력여부를 확인
		if ($("input[name='user_Id']").val() == "") {//이름 입력 확인
			alert("아이디를 입력하세요");
			$("input[name='user_Id']").focus();//포커스 이동
		} else if ($("input[name='user_Pw']").val() == "") { // 비밀번호 입력 확인
			alert("비밀번호를 입력하세요");
			$("input[name='user_Pw']").focus();//포커스 이동
		} else { // 아이디, 비밀번호 모두 입력시

			// 판매자 라디오 버튼 선택시 - 판매자 로그인 (미구현)
			if ($('input[name="sel"]:checked').val() == "seller") {
				location.href = "#"
				alert("판매자 로그인은 아직 구현되지 않았습니다");

				// 구매자 라디오 버튼 선택시 - 구매자 로그인
			} else if ($('input[name="sel"]:checked').val() == "user") { 
				
				
				// 구매자 로그인 영역
				//키와 값으로 복수개가 들어간다.
				//type: [post|get], url: 어디로 보낼 것인가? 
				//data: 어떤 파라메터와 값?, dataType: [json|xml|text|html|jsonp]
				//success: 성공시 할 일, error: 실패시 할 일
				$.ajax({
					type : "post",
					url : "./login",
					data : {
						user_Id : $("#user_Id").val(),
						user_Pw : $("#user_Pw").val()
					},
					dataType : "json",
					success : function(data) {//인자 값은 서버에서 주는 메시지
						console.log(data);
						if (data.success) { // 안되면 if(data.success == 1) 
							alert("로그인에 성공 했습니다.");
							location.href = "index.jsp";
						} else {
							alert("아이디 또는 비밀번호가 일치하지 않습니다.");
						}
					},
					error : function(err) {//인자 값은 서버에서 주는 에러 메시지
						console.log(err)
					}
				}); // 구매자 로그인 영역

			
			} else { // 라디오버튼 미선택시
				alert("로그인 할 회원 종류를 선택해 주세요");
			}// 구매자, 판매자 라디오버튼 확인 영역

		} //아이디, 비밀번호 입력여부 확인 영역 
		
	});

	function join() {
		location.href = "userJoinSelect.jsp";
	}

	function findId() {
		location.href = "userFindId.jsp";
	}

	function findPw() {
		location.href = "userFindPw.jsp";
	}
</script>
</html>