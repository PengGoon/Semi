<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 정보 수정</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
 			.updateForm table {
   		        font-weight: 600;
            	border: 1px solid black;
            	border-collapse: collapse;
            	padding: 5px 10px;
            	text-align: left;
            	border:none;
            	margin:  0 auto 70 auto;
            }   
            
            .updateForm #after
            {
   		        font-weight: 600;
            	border: 1px solid black;
            	border-collapse: collapse;
            	padding: 5px 10px;
            	text-align: left;
            	border:none;
            	margin:  0 auto 70 auto;
            }  
            
             .updateForm td{
   		        font-weight: 600;
            	border: 1px solid black;
            	border-collapse: collapse;
            	padding: 5px 10px;
            	text-align: left;
            	border:none;
            }   
            
            .updateForm th{
   		        font-weight: 600;
            	border: 1px solid black;
            	border-collapse: collapse;
            	padding: 5px 10px;
            	text-align: left;
            	border:none;
            }   
            
            .updateForm hr{
            	border:none;
            	width:1000px;
            	border:1px solid limegreen;
            	color: limegreen;    /* IE */
    			border-color: limegreen;  /* 사파리 */
   			    background-color: limegreen;   /* 크롬, 모질라 등, 기타 브라우저 */
            }
            
           	.updateForm h5{
           		position:absolute;
           		left:78%;
           	}
            
            .userUpdateTitle{
            	margin : 60px 0px 55px 0px;
            	text-align: center;
            	color: black;
            	font-size: 20;
            }
            
            .updateFormTable{
            	position:absolute;
            	left: 20%;
				margin:  0 0 120px 0;
            }
            
            .updateForm select{
            	font-weight: 600;
            	border-style : solid;
            	height : 41px;
            	width: 130px;
            }
            
            .inp{
            	height: 41px;
            }
            
            #update_start, #update_end1, #update_end2,#update_success,#path{
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
            
	 #upload {
        position: absolute;
        height : 42px;
        width: 130px;
        font-weight: 800;
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
	<jsp:include page="myPage_menu.jsp"></jsp:include>
<!-- 바디 전체를 감싸는 updateForm 클래스 -->
<div class = updateForm>
	<div class = userUpdateTitle>
    		<br/><br/>
    		<h1>회원(판매자) 정보 수정</h1>
    </div> <br/>
	<!-- 기본 정보 뷰 -->
	<table class=updateFormTable id="before" >
		<br/>
    	<tr><td colspan="3"><hr/></td></tr>
		<tr>
			<td>회원 이름</td>
			<td><input class=inp  type="text" name="userName"
				id="beforeName"  disabled="true" /></td>
		</tr>
		<tr>
			<td>회원 주소</td>
			<td><input class=inp  type="text" id="beforeAddr" disabled="true"
				style="width: 70%" /></td>
		</tr>
		<tr>
			<td>회원 EMAIL</td>
			<td><input class=inp type="text" id="beforeEmail" disabled="true"/></td>
		</tr>
		<tr>
			<td>회원 휴대폰 번호</td>
			<td><input class=inp  type="text" name="phone"
				id="beforePhone" disabled="true" /></td>
		</tr>
		<tr>
			<td>사업자 등록증</td>
			<td>
				<img width="300" id="after_filename"/>
			</td>
		</tr>
		
		<tr><td colspan="3"><hr/></td></tr>
		
		<tr>
			<td colspan="2" style="text-align: right">
				<button id="update_start">정보 수정하기</button>
				<button id="update_end2">취소</button>
			</td>
		</tr>
	</table>

	<!-- 	본인확인 완료 후 창 -->
	<table style="display: none;" id="after">
	
		<tr><td colspan="3"><hr/></td></tr>
		
		<tr>
			<td>새로운 비밀번호</td>
			<td><input class="inp" type="password" name="userPw"
				placeholder="비밀번호 입력란" /></td>
		</tr>
		<tr>
			<td>새로운 비밀번호 확인</td>
			<td><input class=inp  type="password" name="userPwCk"
				placeholder="비밀번호 확인란" /></td>
		</tr>
		<tr>
			<td>새로운 이름</td>
			<td><input class=inp  type="text" name="after_userName" id="after_userName"
				placeholder="이름 입력란" /></td>
		</tr>
		<tr>
			<td>새로운 주소</td>
			<td><input class=inp  type="text" name="addr1" id="sample4_postcode"
				placeholder="우편번호"  style="margin:4 0 4 0"> <input type="button" class=inp id="path" 
				onclick="sample4_execDaumPostcode()" value="우편번호 찾기"> <br>
				<input type="text" class=inp  name="addr2" id="sample4_roadAddress"
				placeholder="도로명주소"  style="margin:4 0 4 0"> <input type="text" class=inp  name="addr3"
				id="sample4_jibunAddress" placeholder="지번주소"  style="margin:4 0 4 0"> <span
				id="guide" style="color: #999"></span></td>
		</tr>
		<tr>

		</tr>
		<tr>
			<td>새로운 EMAIL</td>
			<td><input class=inp  type="text" name="after_email" id="after_email"
				style="margin:0 5 0 0" placeholder="이메일 입력란" /> @ <input class=inp  type="text"
				id="emailview" name="after_emailview" style="width: 150"
				placeholder="이메일 선택" disabled="true" /> <select id="email">
					<option value="0">이메일을 선택 하세요</option>
					<option value="1">직접입력</option>
					<option>naver.com</option>
					<option>hanmail.net</option>
					<option>google.com</option>
					<option>nate.com</option>
					<option>daum.net</option>
			</select></td>
		</tr>
		<tr>
			<td>새로운 휴대폰 번호</td>
			<td><input class=inp type="text" name="after_phone" id="after_phone"
				placeholder="휴대폰 번호 입력란" /></td>
		</tr>
		<tr>
			<th>사업자 등록증</th>
			<td>
				<img width="300" id="filename"/>
			</td>
		</tr>
		<tr>
			<td>새로운 사업자 등록증</td>
			<td><input type="text" class=inp id="successinfo" name="successinfo"
				style="color: green" placeholder="사업자 등록증 등록란" disabled="true" /> <input
				type="button" onclick="openChild()" id="upload" value="업로드" style="margin:0 0 0 5px"/>
		</tr>
		
		<tr><td colspan="3"><hr/></td></tr>
		
		<tr>
			<td colspan="2" style="text-align: right">
				<button id="update_success">저장</button>
				<button id="update_end1">취소</button>
			</td>
		</tr>
	</table>
</div>
</body>
<script>
	var obj = {};//초기화   
	obj.type = "post";
	obj.dataType = "json";
	obj.enctype = "multipart/form-data";
	obj.data = {};
	obj.error = function(e) {
		console.log(e)
	};

	function openChild() {
		// window.name = "부모창 이름"; 
		window.name = "parentForm";
		//window.open("open할 window", "자식창 이름", "팝업창 옵션");
		openWin = window.open("upload.jsp", "childForm",
				"width=600, height=250, resizable = no, scrollbars = no");
	}

	$(document).ready(function() {
		obj.url = "./detailView";
		obj.success = function(data) {
			console.log(data);
			console.log(data.dto.pw);
			console.log(data.dto.filename);
			$("#beforeName").val(data.dto.name);
			$("#beforeEmail").val(data.dto.email);
			$("#beforeAddr").val(data.dto.addr);
			$("#beforePhone").val(data.dto.phone);
			$("#filename").attr("src",data.dto.filename);
			$("#after_filename").attr("src",data.dto.filename);
			var addrSplit = data.dto.addr.split('/');
			console.log(addrSplit[0]);
			console.log(addrSplit[1]);
			console.log(addrSplit[2]);
			
			var emailSplit = data.dto.email.split('@');
			
			$("#after_userName").val(data.dto.name);
			$("#after_email").val(emailSplit[0]);
			$("#emailview").val(emailSplit[1]);
			$("#after_phone").val(data.dto.phone);
			$("#sample4_postcode").val(addrSplit[0]);
			$("#sample4_roadAddress").val(addrSplit[1]);
			$("#sample4_jibunAddress").val(addrSplit[2]);
			
			if (data.login) {
				alert("본인 확인 후 수정이 가능합니다.");
			} else {
				alert("로그인이 필요한 서비스 입니다.");
				location.href = "index.html";
			}
		}
		ajaxCall(obj);
	});

	$("#update_end1").click(function() {
		location.href = "updateform.jsp";
	});

	$("#update_end2").click(function() {
		location.href = "main.jsp";
	});

	$("#email").change(function() {
		$("#email option:selected").each(function() {

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

	$("#update_start")
			.click(
					function() {
						// window.name = "부모창 이름"; 
						window.name = "parentForm";
						//window.open("open할 window", "자식창 이름", "팝업창 옵션");
						openWin = window
								.open("updateChk.jsp", "childForm",
										"width=550, height=250, resizable = no, scrollbars = no");

					});

	$("#update_success").click(
			function() {
		
				
				if ($("input[name='userPw']").val() == "") {//비밀번호 입력 확인
					alert("비밀 번호를 확인 해 주세요!");
					$("input[name='userPw']").focus();//포커스 이동
				} else if ($("input[name='userPwCk']").val() == "") {//이름 입력 확인
					alert("비밀번호확인을  확인 해 주세요!");
					$("input[name='userPwCk']").focus();//포커스 이동
				} else if ($("input[name='userPw']").val() != $(
						"input[name='userPwCk']").val()) {//이름 입력 확인
					alert("비밀번호가 일치하지 않습니다.");
					$("input[name='userPw']").focus();//포커스 이동
				} else if ($("input[name='after_userName']").val() == "") {//이름 입력 확인
					alert("이름을 확인 해 주세요!");
					$("input[name='after_userName']").focus();//포커스 이동
				} else if ($("input[name='addr1']").val() == ""
						|| $("input[name='addr2']").val() == ""
						|| $("input[name='addr3']").val() == "") {//주소 입력 확인
					alert("주소를 확인 해 주세요!");
					$("input[name='addr1']").focus();//포커스 이동
				} else if ($("input[name='after_email']").val() == "") {//이메일 입력 확인
					alert("이메일을 확인 해 주세요!");
					$("input[name='after_email']").focus();//포커스 이동
				} else if ($("input[name='after_phone']").val() == "") {
					alert("핸드폰 번호를 확인 해 주세요!");
					$("input[name='after_phone']").focus();//포커스 이동
				} else if ($("input[name='successinfo']").val() == "") {
					alert("사업자 등록증을 확인 해 주세요!");
					$("input[name='successinfo']").focus();//포커스 이동
				} else {
					console.log("서버 전송");
					obj.url = "./update";
					obj.data.pw = $("input[name='userPw']").val();
					obj.data.name = $("input[name='after_userName']").val();
					obj.data.email = $("input[name='after_email']").val() + "@"
							+ $("input[name=after_emailview]").val();
					obj.data.addr1 = $("input[name='addr1']").val();
					obj.data.addr2 = $("input[name='addr2']").val();
					obj.data.addr3 = $("input[name='addr3']").val();
					obj.data.phone = $("input[name='after_phone']").val();
					obj.data.filename = $("input[name='successinfo']").val();

					obj.success = function(data) {
						if (data.success == 1) {
							alert("회원 정보 수정을 완료했습니다.");
							location.href = "myPage.jsp";
						} else {
							alert("회원 정보 수정에 실패했습니다.");
						}
					}
					console.log(obj);
					ajaxCall(obj);
				}
			});

	//전달 받은 오브젝트로 ajax 통신 실행
	function ajaxCall(obj) {
		$.ajax(obj);
	}

	//주소 찾기 
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample4_roadAddress').value = fullRoadAddr;
						document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>
</html>



