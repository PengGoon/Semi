<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>구매자 아이디 찾기</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <style type="text/css">
            .findId table{
            	border: none;
            	border-collapse: collapse;
            	padding: 5px 10px;
            	text-align: left;
            }   
            
            .findId td{
            	border: none;
            	border-collapse: collapse;
            	padding: 5px 10px;
            	text-align: left;
            }   
            
            .findId th{
            	border: none;
            	border-collapse: collapse;
            	padding: 5px 10px;
            	text-align: left;
            }   
     
            
            .findIdTitle{
            	margin : 30px 0px 60px 0px;
            	text-align: center;
            	color: limegreen;
            	font-size: 20;
            }
            
            .findIdTable{
            	position : fixed;
            	top: 320px;
            	left: 30%;
            	width:1000px;
            }
            
            .background{
          		position : fixed;
            	width: 100%;
            	height: 230px;
            	background-color: limegreen;
            	opacity: 0.15;
            }
            
            .inp, #find_email{
            	height: 43px;
            }
            
             .findId hr{
            	border:none;
            	border:1px solid limegreen; 
            	color: limegreen;    /* IE */
    			border-color: limegreen;  /* 사파리 */
   			    background-color: limegreen;   /* 크롬, 모질라 등, 기타 브라우저 */
   			    width:66%;
   			    float: left;
            }
            
            #findIDbtn{
            	position:absolute;
            	left:24%;
            	text-align: center;
            	font-weight: 600;
            	border-style : solid;
            	height : 50px;
            	width: 150px;
            	border-color: limegreen;
            	background-color : limegreen;
            	color: white;
            	cursor: pointer;
            }
            
        </style>
    </head>
    <body>
    	<jsp:include page="navi.jsp"></jsp:include>
    	<div class = findId>
    	<div class = findIdTitle>
    	<h1>아이디 찾기 (개인)</h1>
    	</div>
    	<div class = background >
    	</div>
        <table class = findIdTable>
            <tr>
			<th>이름</th>
			<td><input class=inp type="text" name="find_userName"
				placeholder="이름 입력란"/></td>
		</tr>
		<tr>
			<th>EMAIL</th>
			<td>
				<input class=inp type="text" name="find_email" placeholder="이메일 입력란" /> <b>@</b>
				<input type="text" class=inp id="emailview" name="find_emailview" placeholder="이메일 선택" disabled="true" />
				<select id="find_email" >
					<option value="0">이메일을 선택 하세요</option>
					<option value="1">직접입력</option>
					<option>naver.com</option>
					<option>hanmail.net</option>
					<option>google.com</option>
					<option>nate.com</option>
					<option>daum.net</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<hr/>
			</td>
        </tr>
		<tr>
			<td colspan="2">
				<input type="button" id="findIDbtn" value="아이디 찾기" />
			</td>
		</tr>
        </table>
        </div>
    </body>
    <script type="text/javascript">
    var msg = "${msg}";

	if (msg != "") {
		alert(msg);
	}

	var obj = {};//초기화   
	obj.type = "post";
	obj.dataType = "json";
	obj.data = {};
	//obj.enctype = "multipart/form-data";
	obj.error = function(e) {
		console.log(e)
	};

	$("#find_email").change(function() {
		$("#find_email option:selected").each(function() {

			if ($(this).val() == '0') {
				$("#emailview").val("이메일 입력란");
				$("#emailview").attr("disabled", true);
			}

			else if ($(this).val() == '1') { //직접입력일 경우
				$("#emailview").val(''); //값 초기화
				$("#emailview").attr("placeholder", "직접입력");
				$("#emailview").attr("disabled", false); //활성화 
			} else { //직접입력이 아닐경우 
				$("#emailview").val($(this).text()); //선택값 입력
				$("#emailview").attr("disabled", true); //비활성화
			}
		});
	});

	$("#findIDbtn").click(
			function() {
				if ($("input[name='find_userName']").val() == "") {//이름 입력 확인
					alert("이름을 확인 해 주세요!");
					$("input[name='find_userName']").focus();//포커스 이동
				} else if ($("input[name='find_email']").val() == "") {//이메일 입력 확인
					alert("이메일을 확인 해 주세요!");
					$("input[name='find_email']").focus();//포커스 이동
				} else {
					console.log("서버 전송");
					obj.url = "./findId";
					obj.data.find_name = $("input[name='find_userName']")
							.val();
					obj.data.find_email = $("input[name='find_email']")
							.val()
							+ "@" + $("input[name=find_emailview]").val();

					obj.success = function(data) {
						console.log(data);
						if (data.success == "해당 정보가 없습니다.") {
							alert(data.success);
						} else {
							alert("찾으시는 아이디는 " + data.success + " 입니다.");
							location.href = "userLogin.jsp";
						}
					}
					console.log(obj);
					ajaxCall(obj);
				}
			});

	function ajaxCall(obj) {
		$.ajax(obj);
	}
    </script>
</html>