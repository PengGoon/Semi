<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>로그인</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <style>
            table, td, th{
            	border: none;
            	border-collapse: collapse;
            	padding: 5px 10px;
            	text-align: center;
            }   
            
            .loginTitle{
            	margin : 150px 0px 75px 0px;
            	text-align: center;
            	color: limegreen;
            	font-size: 20;
            }
            
            .loginTable{
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
            	font-weight: 600;
            	border-style : solid;
            	height : 50px;
            	width: 125px;
            	border-color: limegreen;
            	background-color : white;
            	color: limegreen;
            }
            
            #login{
            font-weight: 800;
            	border-style : solid;
            	height : 100px;
            	width: 100px;
            	border-color: limegreen;
            	background-color : limegreen;
            	color: white;
            }
            
        </style>
    </head>
    <body>
    	<div class = loginTitle>
    	<h1>로그인</h1>
    	</div>
    	<div class = background >
    	</div>
        <form action="login" method="post">
        <table class = loginTable>
            <tr>
                <th>아이디</th>
                <td>
                	<input id="inp" type="text" name="userId" />
                </td>
                <td rowspan="2">
                    <input id="login" type="submit" value="회원 로그인"
                    	height="80px"/>
                </td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>
                	<input id="inp" type="password" name="userPw"/>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                	<br/>
                	<hr/>
                	<input class=button onclick="findId()" type="button" value="아이디 찾기" />
                	<input class=button onclick="findPw()" type="button" value="비밀번호 찾기"/>
                    <input class=button onclick="join()" type="button" value="회원가입"/>
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
    
        function join(){
        	location.href="userJoinSelect.jsp";
        }
        
        function findId(){
        	location.href="userFindId.jsp";
        }
        
        function findPw(){
        	location.href="userFindPw.jsp";
        }
    </script>
</html>