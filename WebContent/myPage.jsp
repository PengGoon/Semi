<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html> 
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			
		</style>
	</head>
	<body>
		<jsp:include page="navi.jsp"></jsp:include>
		<jsp:include page="myPage_menu.jsp"></jsp:include>
		<c:if test="${sessionScope.loginUserId ne null}">
			
		</c:if>
		<c:if test="${sessionScope.loginId ne null}">
			<jsp:include page="sell_prdList.jsp"></jsp:include>
		</c:if>
	</body>
	<script>
	
	</script>
</html>