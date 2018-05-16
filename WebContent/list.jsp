<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			table,th,td,tr{
			border: 1px solid black;
			border-collapse: collapse;
			text-align: center;
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
					<td><a href="prd_detail?prd_id=${bbs.prd_Id}"><img width="500" src="./upload/${bbs.newFileName1}"/></a></td>
				</tr>
				<tr>
					<td><h3>${bbs.prd_Name}</h3></td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>