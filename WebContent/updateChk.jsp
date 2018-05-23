<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 재확인</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
.updateChkTitle {
	margin: 10px auto 25px auto;
	text-align: center;
	font-size: 20;
}
 .updateChkTable{
            	position:relative;
				margin:  0 auto;
            }
#upPw {
    height : 42px;
	width: 130px;
	font-weight: 800;
	border-style: solid;
	border-color: limegreen;
	background-color: limegreen;
	color: white;
	cursor: pointer;
	margin:  auto;
}
 .updateChkTable hr{
            	border:none;
            	width:100%;
            	border:1px solid limegreen;
            	color: limegreen;    /* IE */
    			border-color: limegreen;  /* 사파리 */
   			    background-color: limegreen;   /* 크롬, 모질라 등, 기타 브라우저 */
            }

.inp {
	height: 41px;
}
</style>
</head>
<body>
		<div class=updateChkTitle><h2>본인확인을 위해 비밀번호를 입력해 주세요.</h2></div>
		<table class=updateChkTable >
			<tr><td colspan="3"><hr/></td></tr>
			<tr>
				<th>비밀번호 확인 :</th> 
				<td><input type="password" class=inp name="updatePwChk" placeholder="비밀번호 확인 요청" /></td>
			</tr>
			<tr><td colspan="3" ><hr/></td></tr>
			<tr><td><button id="upPw">확인</button></td></tr>
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
	obj.error = function(e) {
		consoles.log(e)
	};

	
	
	$("#upPw").click(
			function() {
				if ($("input[name='updatePwChk']").val() == "") {//이름 입력 확인
					alert("비밀번호를 확인 해 주세요!");
					$("input[name='updatePwChk']").focus();//포커스 이동
				} else {
					console.log("업데이트 비밀번호 서버 전송");
					obj.url = "./pwCheck";
					obj.data.updatePwChk = $("input[name='updatePwChk']")
							.val();
					obj.success = function(data) {
						if (data.success != 1) {
							alert("비밀번호가 틀렸습니다. 다시 확인해 주세요");
						} else {
							alert("본인확인이 완료되었습니다.");
							opener.$("#before").css("display","none"); 
							opener.$("#after").css("display","");
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