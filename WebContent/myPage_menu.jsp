<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html> 
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
			#myPage_menu {
				width: 1000px;
			    margin: 0 auto;
			}
			#myPage{
				border: 1px solid black;
				border-collapse: collapse;
				text-align: center;
				width: 1000px;
				height: 100px;
				font-size: 25px;
	        }
	
		     .myPageTr a{
	      	  text-decoration: none;
	        }
	        
	        .myPageTr a:visited{
	        	color: black;
	        	text-decoration: none;
	        }
	        
	      #myPage_menu a:hover{
	          color:limegreen;
	      	  text-decoration: underline;
	        }
	        
	      a .on{
	          color:limegreen;
	        }
	        
	        
		</style>
	</head>
	<body>
		<div id="myPage_menu">
		<table id="myPage">
			<c:if test="${sessionScope.loginUserId ne null}">
				<tr>
					<td><a href="u_Order.jsp">주문내역</a></td>
					<td><a href="#">작성한후기</a></td>
					<td><a href="u_updateform.jsp">개인정보수정</a></td>
				</tr>
			</c:if>
			<c:if test="${sessionScope.loginId ne null}">
				<tr class=myPageTr>
					<td><a class=myPageAtag href="myPage.jsp">등록상품관리</a></td>
					<td><a class=myPageAtag href="prd_writeForm.jsp">상품등록</a></td>
					<td><a class=myPageAtag href="#">개인정보수정</a></td>
					<td><a class=myPageAtag href="#">판매권한신청</a></td>
				</tr>
			</c:if>
		</table>
		</div>
	</body>
	<script>
			$('a').click(function(){
				$('a').removeClass('.on');
				$(this).addClass('.on');
			});
	</script>
</html>