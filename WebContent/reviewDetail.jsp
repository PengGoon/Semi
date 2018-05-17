<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		table,th,td{
			border: 1px solid black;
			border-collapse: collapse;
			padding: 5px 10px;
		}
	</style>
</head>
<body>
	<table>
		<tr>
			<th>작성자</th>
			<td><input type="text" id="userId" readonly/></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input class="edit" type="text" id="review_title" readonly/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea class="edit" rows="15" id="review_content" readonly></td>
		</tr>
	<c:if test="${info.newFileName != null}"></c:if>
		<tr>
			<th>이미지</th>
			<td><img width="500" src="./upload/${info.newFileName}"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="reviewList.jsp">리스트 가기</a>
				&nbsp;&nbsp;
				<a href="./reviewUpdateForm?review_id=${info.review_id}">수정</a>
				&nbsp;&nbsp;
				<a href="./del?id=${info.review_id}">삭제</a>
			</td>
		</tr>
	</table>
</body>
</html>






