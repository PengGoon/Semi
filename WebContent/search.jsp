<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
fieldset {
	text-align: center;
	top: 200;
	left: 350;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
	<fieldset>
		<legend>찾으실 정보를 클릭하세요.</legend>
		<input type="button" id="searchID" value="아이디 찾기" />
		&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" id="searchPW"
			value="비밀번호 찾기" />
	</fieldset>
</body>
<script>
	$("#searchPW").click(function(){
		location.href = "searchPW.jsp";
	});
	$("#searchID").click(function(){
		location.href = "searchID.jsp";
	});
</script>
</html>