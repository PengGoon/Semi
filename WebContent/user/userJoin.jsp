<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>회원가입 - 개인</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <style>
            table, td, th{
   		        font-weight: 600;
            	border: 1px solid black;
            	border-collapse: collapse;
            	padding: 5px 10px;
            	text-align: left;
            	border:none;
            }   
            
            hr{
            	border:none;
            	width:1000px;
            	border:1px solid limegreen;
            	color: limegreen;    /* IE */
    			border-color: limegreen;  /* 사파리 */
   			    background-color: limegreen;   /* 크롬, 모질라 등, 기타 브라우저 */
            }
            
           	h5{
           		position:absolute;
           		left:78%;
           	}
            
            .userJoinTitle{
            	margin : 60px 0px 55px 0px;
            	text-align: center;
            	color: limegreen;
            	font-size: 20;
            }
            
            .userJoinTable{
            	position:absolute;
            	left: 20%;
				margin:  0 0 120px 0;
            }
            
            select{
            	font-weight: 600;
            	border-style : solid;
            	height : 41px;
            	width: 130px;
            }
            
            .inp{
            	height: 41px;
            }
            
            #overlay, #path{
            	font-weight: 600;
            	border-style : solid;
            	height : 41px;
            	width: 130px;
            	border-color: limegreen;
            	background-color : limegreen;
            	color: white;
            	cursor: pointer;
            }
            
            #join{
            	position:absolute;
            	left:86%;
            	height : 42px;
            	width: 130px;
            	font-weight: 800;
            	border-style : solid;
            	border-color: limegreen;
            	background-color : limegreen;
            	color: white;
            	cursor: pointer;
            }
            
             .exit{
            	position:absolute;
            	left:1%;
            	height : 30px;
            	width: 130px;
            	font-weight: 800;
            	font-size:14;
            	text-align:center;
        		padding: 10px 0 0 0;
            	border:2.5px solid limegreen;
            	background-color : white;
            	color: limegreen;
            	cursor: pointer;
            }
            
        </style>
    </head>
    <body>
    	<jsp:include page="../main/navi.jsp"></jsp:include>
    	<div class = userJoinTitle>
    	<br/><br/>
    	<h1>회원 가입</h1>
    	</div> <br/>
    	<h5>* 필수입력사항</h5><br/>
    	<form action="join" method="post">
    		<table class=userJoinTable>
    			<br/>
    			<tr>
    				<td colspan="3">
    				<hr/>
    				</td>
    			</tr>
    			<tr>
    				<td>아이디 *</td>
    				<td>
    				<input class="inp" type="text" name="userId"/>
    				<button class=button id="overlay" onclick="overlay()">아이디 중복 확인</button>
    				</td>
    			</tr>
    			<tr>
    				<td>비밀번호 *</td>
    				<td><input class="inp" type="password" name="userPw"/></td>
    			</tr>
    			<tr>
    				<td>비밀번호 확인 *</td>
    				<td><input class="inp" type="password" name="userPw"/></td>
    			</tr>
    			<tr>
    				<td>이름 *</td>
    				<td><input class="inp" type="text" name="userName"/></td>
    			</tr>
    			<tr>
    				<td>주소 *</td>
    				<td>
    				<input class="inp" type="text" name="userAge"/>
    				<button class=button id="path">주소 찾기</button> <!--  명진 api로 구현  -->
    				</td>
    			</tr>
    			<tr>
    				<td>이메일 *</td>
    				<td>
    				<input class="inp" type="text" name="email"/>
    				<select>
    				<option value="naver">naver.com</option>
    				<option value="daum">daum.net</option>
    				<option value="google">google.com</option>
    				<option value="nate">nate.com</option>
    				</select>
    				</td>
    			</tr>
    			
    			<tr>
    				<td>휴대폰 *</td>
    				<td><input class="inp" type="text" name="phone"/></td>
    			</tr>
    			
    			<tr>
    				<td colspan="3">
    				<hr/>
    				</td>
    			</tr>
    			
    			<tr>
    				<td colspan="3">
    				<button class=button id="join">회원가입</button>
    				<a class=exit onclick="location.href = 'userLogin.jsp'">나가기</a>
    				</td>
    			</tr>
    		</table>
    	<br/>
    	<br/>
    	<br/>
    	</form> 
    </body>
    <script>
		//만약 받아오는 메시지가 있다면 얼럿 생성
		var msg = "${msg}";
		
		if(msg != ""){
			alert(msg);
		}
		
		 function overlay(){
			 
	        	overlay(); // 아이디 중복 확인화면(또는 alert)으로 이동
	        }

    </script>
</html>