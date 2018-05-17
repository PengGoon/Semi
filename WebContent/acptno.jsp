<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("UTF-8");%>
<%-- <%@ pagepageEncoding="UTF-8" contentType="text/html; charset-"UTF-8" %> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
	#send_no{
		width: 400;
		height: 200;
	}
</style>
</head>

<body>
	<fieldset style="width: 100">
		<legend>판매자 승인요청 거절</legend>
		판매자 : <span><%=request.getParameter("sell_name")%> (<%=request.getParameter("sell_id")%>)</span><br />
		e-mail : <span><%=request.getParameter("sell_email")%></span><br/> <textarea id="send_no"
				placeholder="거절 사유를 적어주세요. 거절사유는 이메일로 전송 됩니다."></textarea>
	</fieldset>
	<button id="send_nobtn" style="text-align: center">확인</button>

</body>
<script>
	
	/* if(msg=="성공"){
		alert(msg);
		window.open("about:blank", "_self").close();
	}else if(msg=="실패"){
		alert(msg);
	} */
	var sell_id = "<%=request.getParameter("sell_id")%>";
	var sell_email = "<%=request.getParameter("sell_email")%>";
	console.log(sell_email);
	
	var obj = {};
	obj.error = function(e) {
		console.log(e)
	};
	obj.type = "POST";
	obj.dataType = "JSON";
	obj.data={};
	
	$("#send_nobtn").click(function(){
		
		
		obj.url = "./acptno";
		obj.data.sell_id = sell_id;
		obj.data.sell_email = sell_email;
		obj.data.no_msg =  $("#send_no").val();
		
		obj.success = function(data){
			console.log(data);
			console.log(data.success);
			if(data.success){
				alert("성공");
				window.open("about:blank", "_self").close();
			}else{
				alert("실패");
			}
		}
		ajaxCall(obj);
	});
	
	function ajaxCall(param) {
		//console.log(param);
		$.ajax(param);
	}
</script>
</html>