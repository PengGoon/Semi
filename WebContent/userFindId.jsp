<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>아이디 찾기</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <style>
            table, td, th{
            	border: none;
            	border-collapse: collapse;
            	padding: 5px 10px;
            	text-align: left;
            	
            	width:350px;
            }   
            
            .findIdTitle{
            	margin : 150px 0px 75px 0px;
            	text-align: center;
            	color: limegreen;
            	font-size: 20;
            }
            
            .findIdTable{
            	position : fixed;
            	top: 290px;
            	left: 39%;
            }
            
            .background{
          		position : fixed;
            	width: 100%;
            	height: 230px;
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
            	text-align: center;
            	font-weight: 600;
            	border-style : solid;
            	height : 50px;
            	width: 100px;
            	border-color: limegreen;
            	background-color : limegreen;
            	color: white;
            }
            
        </style>
    </head>
    <body>
    	<div class = findIdTitle>
    	<h1>아이디 찾기</h1>
    	</div>
    	<div class = background >
    	</div>
        <form action="findId" method="post">
       
        <table class = findIdTable>
            <tr>
                <th>이름</th>
                <td>
                	<input id="inp" type="text" name="userName" />
                </td>
            </tr>
            <tr>
                <th>이메일</th>
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
                    <input class=button onclick="findId()" type="button" value="확인"/>
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
    
        function findId(){
        	location.href="#"; // 아이디찾기 화면(또는 alert)으로 이동
        }
    </script>
</html>