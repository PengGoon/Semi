<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>회원가입 선택</title> <!-- 구매자: userJoinForm.jsp ,  판매자: join.jsp -->
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <style>
            table, td, th{
            	border: none;
            	width:300px;
            	border-collapse: collapse;
            	padding: 5px 10px;
            	text-align: center;
            }  
            
            hr{
          		border:none;
          		border:1px solid limegreen;
            	color: limegreen;    /* IE */
    			border-color: limegreen;  /* 사파리 */
   			    background-color: limegreen;   /* 크롬, 모질라 등, 기타 브라우저 */
            } 
            
            .joinTitle{
            	margin : 50px 0px 45px 0px;
            	text-align: center;
            	color: limegreen;
            	font-size: 20;
            }
            
            .radioTable{
           		 font-weight: 600;
            	position : fixed;
            	top: 320px;
            	left: 41%;
            }
            
            .background{
          		position : fixed;
            	width: 100%;
            	height: 230px;
            	background-color: limegreen;
            	opacity: 0.15;
            }
            
            .button{
            	font-weight: 600;
            	border-style : solid;
            	height : 50px;
            	width: 200px;
            	border-style : solid;
            	border-color: limegreen;
            	background-color : limegreen;
            	color: white;
            	cursor: pointer;
            }
            
            
        </style>
    </head>
    <body>
    	<jsp:include page="navi.jsp"></jsp:include>
    	<!-- 구매자: userJoinForm.jsp ,  판매자: join.jsp -->
    	<div class = joinTitle>
    	<h1>회원 가입</h1>
    	</div>
    	<div class = background >
    	</div>
        <form action="join" method="post">
        <table class = radioTable>
            <tr>
    			<td>
    				개인  <input type="radio"  name="sel" value="user"/> <!-- userJoin.jsp(개인)로 이동  -->
    				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    				판매자  <input type="radio" name="sel" value="seller"/> <!--join.jsp(판매자) 로 이동 -->
    			</td>
    		</tr>
            <tr>
                <td colspan="3">
                	<br/>
                	<hr/>
                    <input class=button onclick="toJoin()" type="button" value="회원 정보 입력"/>
                </td>
            </tr>
        </table>
        </form>
    </body>
    <script>
        function toJoin(){
        	if($('input[name="sel"]:checked').val() == "seller"){
        		location.href="join.jsp"
        	} else if ($('input[name="sel"]:checked').val() == "user"){
        		location.href="userJoin.jsp"
        	} else{
        		alert("가입할 회원 종류를 선택해 주세요");
        	}
        } 
    </script>
</html>