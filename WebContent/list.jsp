<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <a href="detail?id=${ProductImage.prd_id}"> --%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			table,th,td,tr{
			border: 1px solid black;
			border-collapse: collapse;
			padding: 5px 10px;
			}
			table{
			float: left;
			}
		</style>
	</head>
	<body>
		<table>
			<c:forEach items="${list}" var="bbs">
				<tr>
					<td>사진명</td>
					<td>${bbs.newFileName}</td>
				</tr>
			</c:forEach>
			
			<!-- 
			<c:forEach items="${list}" var="ProductImage">
				<tr>
				<td>${ProductImage.newFileName}</td>
				</tr>
			</c:forEach>
			상품 이름을 먼저 뽑기
			-->
		</table>
	</body>
</html>