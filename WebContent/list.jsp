<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			#listCenter {
				width: 1000px;
				margin: 0 auto;
			}
			#prdlist th,#prdlist td,#prdlist tr{
				border: 1px solid black;
				border-collapse: collapse;
				text-align: center;
			}
			#prdlist{
				width:300px; 
				height:300px;
				border: 1px solid black;
				border-collapse: collapse;
				text-align: center;
				float: left;
				margin: 10px;
			}
			#prdlist img{
				width:290px;
				height:240px;
			}
		</style>
	</head>
	<body>
		<jsp:include page="navi.jsp"></jsp:include>
		<div id="listCenter">
		<h2>"<%=request.getParameter("cateS_id") %>" 카테고리의 내용입니다.</h2>
		<c:forEach items="${list}" var="bbs">
			<table id="prdlist">
				<tr>
					<td>
					<a href="prd_detail?prd_id=${bbs.prd_Id}">
						<c:if test="${bbs.newFileName1 ne null}">
							<img src="./upload/${bbs.newFileName1}"/>
						</c:if>
					</a>
					</td>
				</tr>
				<tr>
					<td style="height:50px;"><h3>${bbs.prd_Name}</h3></td>
				</tr>
			</table>
		</c:forEach>
		</div>
	</body>
</html>