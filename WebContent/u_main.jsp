<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html> 
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
		<style>
<<<<<<< HEAD
			.muen li{
                        
                        list-style: none;
                        padding: 5px 10px;
                        text-align: left;
                        float: left;
                        width: 300px;
                        text-align: center;
                        border: 1px solid black; 

                    }
                    a{
                        text-decoration: none;
                    }

                    table,td,th {
                            border: 1px solid black; 
                            width: 0%;
                            padding: 10px;
                            border-top: 1px solid #444444;
                            border-collapse: collapse;
                          }
		</style>
	</head>
	<body>
	<jsp:include page="user_navi.jsp"></jsp:include>
	
		<br>
        <br>
        <ul class="muen">
            <li>
                <a href="u_Order.jsp">주문내역</a>
            </li>
            <li>
                <a href="cart.jsp">장바구니</a>
            </li>
            <li>
                <a href="#">작성한후기</a>
            </li>
            <li>
                <a href="u_updateform.jsp">개인정보수정</a>
            </li>
            
        </ul>
        <br><br><br><br>
=======
			#myPage{
				margin-left: 150px;
				border: 1px solid black;
				border-collapse: collapse;
				text-align: center;
				width: 200px;
				height: 300px;
				font-size: 25px;
	        }
			#myPage tr{
				
	        }
		</style>
	</head>
	<body>
		<table id="myPage">
			<tr>
				<td><a href="u_Order.jsp">주문내역</a></td>
			</tr>
			<tr>
				<td><a href="#">장바구니</a></td>
			</tr>
			<tr>
				<td><a href="#">작성한후기</a></td>
			</tr>
			<tr>
				<td><a href="u_updateform.jsp">개인정보수정</a></td>
			</tr>
		</table>
>>>>>>> e4b478ff2fd5f87b61adf267b0cf1463e74c606f
	</body>
	<script>
	
	</script>
</html>