<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>구매자 비밀번호 찾기</title>
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
            
            .findPwTable{
            	position : fixed;
            	top: 310px;
            	left: 39%;
            }
            
            .background{
          		position : absolute;
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
    	<jsp:include page="navi.jsp"></jsp:include>
    	<div class = findPwTitle>
    	<h1>비밀번호 찾기</h1>
    	<h4 style="color:black">
    	개인 <input type="radio"  name="sel" value="user"/> <!-- userJoin.jsp(개인)로 이동  -->
    	&nbsp;&nbsp;&nbsp;
    	판매자 <input type="radio" name="sel" value="seller"/> <!--join.jsp(판매자) 로 이동 -->
    	</h4> 
    	</div>
    	<div class = background >
    	</div>
        <table class = findPwTable>
            <tr>
                <th>이름</th>
                <td>
                	<input id="inp" type="text" name="userName" />
                </td>
            </tr>
            <tr>
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
    </body>
    <script>

    
    function findPw(){
   	 if ($("input[name='userName']").val() == "") {//이름 입력 확인
            alert("이름을 입력하세요");
            $("input[name='userName']").focus();//포커스 이동
     } else if ($("input[name='userId']").val() == ""){
  		 alert("아이디를 입력하세요");
  		 $("input[name='userId']").focus();//포커스 이동
   	 } else if ($("input[name='email']").val() == ""){
   		 alert("메일을 입력하세요");
   		$("input[name='email']").focus();//포커스 이동
   	 } else { // 제대로 입력시
   		 location.href = "#"; // 미구현
   	 } 
   }
    </script>
</html>