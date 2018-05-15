<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 목록</title>
<style>
	#reviewList table,th,td{
		border:none;
		border-collapse: collapse;
		padding: 10px 10px;
		font-size: 10;
	}
	
	#reviewList hr{
            border:none;
            width:1000px;
            border:1px solid limegreen;
            color: limegreen;    /* IE */
    		border-color: limegreen;  /* 사파리 */
   			background-color: limegreen;   /* 크롬, 모질라 등, 기타 브라우저 */
    }
	
	.msg{
		position:relative;
		left:20%;
	}
	
	#reviewList{
		width: 1000px;
		margin: 0 auto;
	}
	
	.writeBtn{
			position:absolute;
            left:70%;
            height : 42px;
            width: 130px;
            font-weight: 800;
           	border-style : solid;
           	border-color: limegreen;
           	background-color : limegreen;
           	color: white;
           	cursor: pointer;
	}
	
	.reviewTitle{
		width:500px;
	}
	.userId{
		width:150px;
	}

	
	
</style>
</head>
<body>
	<div id="reviewList">
	<table>
		<tr>
		<h5 class=msg style="left:0%">PRODUCT REVIEW</br>
		상품 사용 후기를 남기는 공간입니다.해당 게시판의 성격과 다른 글은 사전 동의 없이 삭제 될 수 있습니다.</h5><hr/>
		</tr>
		<tr></tr>
		<tr>
			<th class=reviewId>글 번호</th>
			<th class=reviewTitle>제목</th>
			<th class=userId>작성자</th>
			<th class=reviewdate>작성일</th>
			<th class=bHit>조회수</th>
			<!-- <th>삭제</th>  내 후기 보기 에서만 표시--> 
		</tr>
		<c:forEach items ="${reviewList}" var="review">
			<tr>
				<td class=reviewId>${review.review_id}</td>
				<td class=reviewTitle><a href="detail?id=${review.review_id}">${review.review_title}</a></td>
				<td class=userId>${review.user_id}</td>
				<td class=reviewdate>${review.review_date}</td>
				<td class=bHit>${review.bHit}</td>
				<%-- <td><a href="del?id=${review.review_id }">삭제</a></td>  내 후기 보기 에서만 표시--%>
			</tr>
		</c:forEach>
	</table>
	<br/>
	<hr/>
	<button class=writeBtn onclick="location.href='reviewWriteForm.jsp'">후기 작성</button>
	</div>
</body>
</html>