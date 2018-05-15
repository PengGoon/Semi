<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	</head>
	<style>
		#wrapper {
			width: 1000px;
		    margin: 0 auto;
		}
		.jbTitle {
			text-align: center;
		}
		
		.jbMenu {
			text-align: center;
			background-color: yellow;
			padding: 10px 0px;
			width: 100%;
		}
		.jbFixed {
        	position: fixed;
        	top: 0px;
      	}

            li{
                list-style: none;
                padding: 5px 10px;
                text-align: left;
                float: left;
                width: 200px;
                text-align: center;
                border: 1px solid black; 
                
            }
            a{
                text-decoration: none;
            }
            table, td, th{
            	border: 1px solid black;
            	border-collapse: collapse;
            	padding: 5px 10px;
            	
            }
            .butt{
                text-align: center;
            }
            .tab{
            	width: 0px;
            	margin: 0 auto;
            }
          
      
	</style>
	<body>
		<div id="wrapper">
			<div class="jbTitle">
				<h1>Site Title</h1>
			</div>
			<div class="jbMenu">
				<p>First Menu Second Menu Third Menu Fourth Menu</p>
			</div>
			<ul class="muen">
	            <li>
	                <a  href="4.jsp">주문내역</a>
	            </li>
	            <li>
	                <a href="5.jsp">장바구니</a>
	            </li>
	            <li>
	                <a href="#">작성한후기</a>
	            </li>
	            <li>
	                <a href="6.jsp">개인정보수정</a>
	            </li>
	        </ul>
	        <br><br><br><br>
			<table class="tab">
			<tr>
				<td>아이디 </td>
				<td>
					<input type="text" name="userId" /> 
	            </td>
			</tr>
			<tr>
				<td>비밀번호 *</td>
				<td>
	                <input class="inputTxt" type="password" name="userPw" />
	            </td>
			</tr>
			<tr>
				<td>비밀번호 확인 *</td>
				<td>
	                <input class="inputTxt" type="password" name="userPwCk" />
	            </td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
	                <input class="inputTxt" type="text" name="userName" />
	            </td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
	                <input type="text" name="addr1" id="sample4_postcode"placeholder="우편번호"> 
	                <input type="button"onclick="sample4_execDaumPostcode()" value="우편번호 찾기"> <br>
	                <input type="text" name="addr2" id="sample4_roadAddress"
	                    placeholder="도로명주소">
	                <input type="text" name="addr3"	id="sample4_jibunAddress" placeholder="지번주소">
	                 <span id="guide" style="color: #999"></span>
	            </td>
			</tr>
	
			<tr>
				<td>EMAIL</td>
				<td>
					<form action="." name="form" method="post">
					<input class="box" type="text" name="email" id="email" size="15"  />@<input class="box" type="text" name="email2" id="email2" size="20" >
						<select name="email_select" class="box" id="email_select" onchange="checkemailaddy();">
							<option value="" selected>선택하세요</option>
							<option value="empal.com">empal.com</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="naver.com">naver.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="chollian.net">chollian.net</option>
							<option value="freechal.com">freechal.com</option>
							<option value="hanafos.com">hanafos.com</option>
							<option value="kebi.com">kebi.com</option>
							<option value="korea.com">korea.com</option>
							<option value="lycos.co.kr">lycos.co.kr</option>
							<option value="netian.com">netian.com</option>
							<option value="netsgo.com">netsgo.com</option>
							<option value="unitel.co.kr">unitel.co.kr</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
							<option value="1">직접입력</option>
						</select>
					</form>
				</td>
			</tr>
			<tr>
				<td>휴대폰 번호</td>
				<td>
	                <input class="inputTxt" type="text" name="phone" />
	            </td>
			</tr>
			<tr>
				<td colspan="2"  class="butt">
					<button id="join">개인정보 변경하기</button>
					<button id="secession">회원탈퇴</button>
				</td>
			</tr>
		</table>
		</div>		
	</body>
	<script>
	
	
		$(document).ready(function() {
			var jbOffset = $('.jbMenu').offset();
			$(window).scroll(function() {
				if ($(document).scrollTop() > jbOffset.top) {
					$('.jbMenu').addClass('jbFixed');
				} else {
					$('.jbMenu').removeClass('jbFixed');
				}
			});
		});
		
	    //이메일
	    function checkemailaddy(){
			if (form.email_select.value == '1') {
				form.email2.readOnly = false;
				form.email2.value = '';
				form.email2.focus();
			}
			else {
				form.email2.readOnly = true;
				form.email2.value = form.email_select.value;
			}
		}    
		//회원수정
		$("#join").click(function() {
			if (!overChk) {
				alert("아이디 중복 체크를 실행 해 주세요!");
				$("input[name='userId']").focus();//포커스 이동
			} else {
				if ($("input[name='userPw']").val() == "") {//비밀번호 입력 확인
					alert("비밀 번호를 확인 해 주세요!");
					$("input[name='userPw']").focus();//포커스 이동
				} else if ($("input[name='userName']").val() == "") {//이름 입력 확인
					alert("이름을 확인 해 주세요!");
					$("input[name='userName']").focus();//포커스 이동
				} else if ($("input[name='userAge']").val() == "") {//나이 입력 확인
					alert("나이를 확인 해 주세요!");
					$("input[name='userAge']").focus();//포커스 이동
				} else if ($("input[name='email']").val() == "") {//이메일 입력 확인
					alert("이메일을 확인 해 주세요!");
					$("input[name='email']").focus();//포커스 이동
				} else {
					console.log("서버 전송");
					obj.url = "./join";
					obj.data.id = $("input[name='userId']").val();
					obj.data.pw = $("input[name='userPw']").val();
					obj.data.name = $("input[name='userName']").val();
					obj.data.email = $("input[name='email']").val();
					obj.data.addr1 = $("input[name='addr1']").val();
					obj.data.addr2 = $("input[name='addr2']").val();
					obj.data.addr3 = $("input[name='addr3']").val();
					obj.data.phone = $("input[name='phone']").val();
					obj.data.filename = $("input[name='filename']").val();

					obj.success = function(data) {
						if (data.success == 1) {
							alert("회원 가입이 정상 처리 되었습니다.");
							location.href = "index.html";
						} else {
							alert("회원 가입에 실패 했습니다.");
						}
					}
					console.log(obj);
					ajaxCall(obj);
				}
			}
		});

		//전달 받은 오브젝트로 ajax 통신 실행
		function ajaxCall(obj) {
			$.ajax(obj);
		}
		//주소 API
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