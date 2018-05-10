<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>비밀번호 찾기</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <style>
            table, td, th{
            	border: none;
            	border-collapse: collapse;
            	padding: 5px 10px;
            	text-align:left;
            	
            	width:380px;
            }   
            
            .findPwTitle{
            	margin : 30px 0px 20px 0px;
            	text-align: center;
            	color: limegreen;
            	font-size: 20;
            }
            
            h4{
            	color:black;
            }
            
            .findPwTable{
            	position : fixed;
            	top: 290px;
            	left: 39%;
            }
            
            .background{
          		position : fixed;
            	width: 100%;
            	height: 270px;
            	background-color: limegreen;
            	opacity: 0.15;
            }
            
            #inp{
            	height: 43px;
            }
            
            hr{
            	border:none;
            	border:1px solid limegreen; 
            	color: limegreen;    /* IE */
    			border-color: limegreen;  /* 사파리 */
   			    background-color: limegreen;   /* 크롬, 모질라 등, 기타 브라우저 */
            }
            
            .button{
            	font-weight: 600;
            	border-style : solid;
            	height : 50px;
            	width: 100px;
            	border-color: limegreen;
            	background-color : limegreen;
            	color: white;
            	cursor: pointer;
            }
            
        </style>
    </head>
    <body>
    	<jsp:include page="../main/navi.jsp"></jsp:include>
    	<div class = findPwTitle>
    	<h1>비밀번호 찾기</h1>
    	<h4>
    	개인 <input type="radio"  name="sel" value="user"/> <!-- userJoin.jsp(개인)로 이동  -->
    	&nbsp;&nbsp;&nbsp;
    	판매자 <input type="radio" name="sel" value="seller"/> <!--join.jsp(판매자) 로 이동 -->
    	</h4> 
    	</div>
    	<div class = background >
    	</div>
        <form action="findPw" method="post">
       
        <table class = findPwTable>
            <tr>
                <th>이름</th>
                <td>
                	<input id="inp" type="text" name="userName" />
                </td>
            </tr>
            
            <th>아이디</th>
                <td>
                	<input id="inp" type="text" name="userId"/>
                </td>
            </tr>
            
            <tr>
                <th>가입 메일주소</th>
                <td>
                	<input id="inp" type="text" name="email"/>
                </td>
            </tr>
            
            <tr>
                <td colspan="3">
                	<hr/>
                </td>
            </tr>
            
            <tr>
            	<th></th>
                <td colspan="3">
                    <input class=button onclick="findPw()" type="button" value="확인"/>
                </td>
            </tr>
        </table>
        
        </form>
      
        <h3>${msg}</h3>    
    </body>
    <script>
    	//만약 받아오는 메시지가 있다면 얼럿 생성
    	var msg = "${msg}";
    	
    	if(msg != ""){
    		alert(msg);
    	}    
    
        function findPw(){
        	location.href="#"; // 비밀번호 찾기 화면(또는 alert)으로 이동
        }
    </script>
</html>