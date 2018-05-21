<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매자 비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">
 			.searchPw table{
            	border: none;
            	border-collapse: collapse;
            	padding: 5px 10px;
            	text-align: left;
            }   
            
            .searchPw td{
            	border: none;
            	border-collapse: collapse;
            	padding: 5px 10px;
            	text-align: left;
            }   
            
            .searchPw th{
            	border: none;
            	border-collapse: collapse;
            	padding: 5px 10px;
            	text-align: left;
            }   
     
            
            .searchPwTitle{
            	margin : 30px 0px 60px 0px;
            	text-align: center;
            	color: limegreen;
            	font-size: 20;
            }
            
            .searchPwTable{
            	position : fixed;
            	top: 470px;
            	left: 30%;
            	width:1000px;
            }
            
            .background{
          		position : fixed;
            	width: 100%;
            	height: 290px;
            	background-color: limegreen;
            	opacity: 0.15;
            }
            
            .inp, #search_email{
            	height: 43px;
            }
            
              .searchPw hr{
            	border:none;
            	border:1px solid limegreen; 
            	color: limegreen;    /* IE */
    			border-color: limegreen;  /* 사파리 */
   			    background-color: limegreen;   /* 크롬, 모질라 등, 기타 브라우저 */
   			    width:66%;
   			    float: left;
            }
            
            #searchPWbtn{
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
	<div class = searchPw>
	<div class = searchPwTitle>
    	<h1>비밀번호 찾기 (판매자)</h1>
    </div>
    <div class = background >
    </div>
		<table class = searchPwTable>
			<tr>
				<th>아이디 </th>
				<td><input type="text" class=inp name="search_userId" placeholder="아이디 입력란"/></td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input class=inp type="text" name="search_userName" placeholder="이름 입력란"/> </td>
			</tr>
			<tr>
				<th>EMAIL</th>
				<td>
					<input class=inp type="text" name="search_email"  placeholder="이메일 입력란" /> <b>@</b> 
					<input type="text" class=inp id="emailview" name="search_emailview" placeholder="이메일 선택" disabled="true" /> 
					<select id="search_email">
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
				<td colspan="2"><input type="button" id="searchPWbtn"
					value="비밀번호 찾기" /></td>
			</tr>
		</table>
	</div>
</body>

<script type="text/javascript">
	var obj = {};//초기화   
	obj.type = "post";
	obj.dataType = "json";
	obj.data={};
	//obj.enctype = "multipart/form-data";
	obj.error = function(e) {
		console.log(e)
	};

	$("#search_email").change(function() {
		$("#search_email option:selected").each(function() {

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

	$("#searchPWbtn").click(
			function() {
				if ($("input[name='search_userId']").val() == "") {//이름 입력 확인
					alert("아이디를 확인 해 주세요!");
					$("input[name='userName']").focus();//포커스 이동
				}
				else if ($("input[name='search_userName']").val() == "") {//이름 입력 확인
					alert("이름을 확인 해 주세요!");
					$("input[name='userName']").focus();//포커스 이동
				} else if ($("input[name='search_email']").val() == "") {//이메일 입력 확인
					alert("이메일을 확인 해 주세요!");
					$("input[name='searach_email']").focus();//포커스 이동
				} else {
					console.log("서버 전송");
					obj.url = "./searchPW";
					obj.data.search_id = $("input[name=search_userId]").val();
					obj.data.search_name = $("input[name='search_userName']").val();
					obj.data.search_email = $("input[name='search_email']")
							.val()
							+ "@" + $("input[name=search_emailview]").val();

					obj.success = function(data) {
						if (data.success == true) {
							alert("찾으시는 비밀번호를 메일로 전송했습니다.");
							location.href = "index.jsp";
							window.open("about:blank", "_self").close();
						} else {
							alert("해당 정보가 없습니다.");
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