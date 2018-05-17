<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후기 상세보기</title>
<style>
	   	.ReviewWriteTitle{
            	margin : 30px 0px 20px 0px;
            	text-align: center;
            	color: limegreen;
            	font-size: 20;
            }

      .Review td{
      	border: 1px solid black;
        border-collapse: collapse;
        padding: 5px 10px;
      }
      
      .Review th{
      	border: 1px solid black;
        border-collapse: collapse;
        padding: 5px 10px;
      	width:70px;
      }
      
      .Review table{
      	position: absolute;
      	left:25%;
        width: 800px;
        border: 1px solid black;
        border-collapse: collapse;
        padding: 5px 10px;
        margin: 100px 0 100px 0;
      }
      .Review input[type='text']{
         width:100%;
      }
      .Review textarea{
         width:100%;
         resize:none;
         height:300px;
      }
      .Review td{
         text-align: left;
      }
      .photoAdd{
      	 position:relative;
         left:4%;
         height : 42px;
		 width: 130px;
		 cursor: pointer;
      }
      
       #replace {
        position: absolute;
        left:4%;
        height : 42px;
        width: 130px;
        font-weight: 800;
        border-style : solid;
        border-color: limegreen;
        background-color : limegreen;
        color: white;
        cursor: pointer;
     }
      
      .write{
            	position:absolute;
            	left:83%;
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
      			text-decoration:none;
            	position:absolute;
            	left:65%;
            	height : 29px;
            	width: 130px;
            	font-weight: 800;
            	font-size:14;
            	text-align:center;
        		padding: 10px 0 0 0;
            	border:2.5px solid limegreen;
            	background-color : white;
            	color: limegreen;
      }
            
     .btnRow{
     	height:80px;
     	padding: 0;
     }




</style>
</head>
<body>
	<jsp:include page="navi.jsp"></jsp:include>
   	<div class = Review>
   	<div class = ReviewDetailTitle>
   	<h1>후기 상세보기</h1>
    	</div>
	<table>
		<tr>
			<th>작성자</th>
			<td><input type="text" id="userId" readonly /></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input class="editable" id="reviewTitle" type="text"  readonly /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea class="editable"  id="reviewContent" rows="15" readonly></td>
		</tr>
		<tr>
			<td colspan="2">
				<a class=exit href="reviewList.jsp">리스트 가기</a> 
				<a class=edit>수정</a>
				<a class=save>저장</a>
			</td>
		</tr>
	</table>
	</div>
</body>
<script>

	//html 문서를 로드하자 마자 상세 정보를 가져 온다.
	var obj = {};
	var idx;
	obj.type = "POST";
	obj.dataType = "JSON";
	obj.error = function(e) {
		console.log(e)
	};

	// 상세 정보 가져오기
   $(document).ready(function() {
	    console.log("후기 상세보기 요청");
		obj.url = "./review_detailView"; 
		System.out.println("상세");
		obj.success = function(data) {
			
			console.log(data);
			
			printInfo(data.info);
		}
		ajaxCall(obj);
	});
 
	function printInfo(info) {
		review_id = info.review_id;
		$("#userId").val(info.user_id);
		$("#reviewTitle").val(info.review_title);
		$("#reviewContent").val(info.review_content);
	}

	//수정 뷰
	$("#edit").click(function() {
		$("#save").css("display", "inline");
		$(".editable").css("border-width", "1px");
		$(".editable").attr("readonly", false);
		$("#edit").css("display", "none");
	});

	//수정 후 저장 요청
	$("#save").click(function() {
		obj.url = "./review_update";
		obj.data = {
			"review_id" : review_id,
			"review_title" : $("#reviewTitle").val(),
			"review_content" : $("#reviewContent").val()
		};
		obj.success = function(data) {
			console.log(data);
			if (data.success == 1) {
				alert("수정이 성공 했습니다.");
				location.href = "reviewDetail.jsp";
			} else {
				alert("수정이 실패 했습니다.");
			}
		};
		ajaxCall(obj);
	});

	function ajaxCall(param) {
		$.ajax(param);
	}
</script>
</html>






