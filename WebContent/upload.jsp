<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
.uploadTitle {
	margin: 10px auto 25px auto;
	text-align: center;
	font-size: 20;
}

.uploadTable {
	position: relative;
	width: 200px;
	margin: 0 auto;
	text-align: right;
}

.uploadTable hr {
	border: none;
	width: 100%;
	border: 1px solid limegreen;
	color: limegreen; /* IE */
	border-color: limegreen; /* 사파리 */
	background-color: limegreen; /* 크롬, 모질라 등, 기타 브라우저 */
}

.inp {
	height: 41px;
}

#filenamee {
	position: relative;
	height: 42px;
	width: 130px;
	cursor: pointer;
	opacity: 0;
}

#fileReplace {
	position: absolute;
	height: 42px;
	width: 130px;
	font-weight: 800;
	border-style: solid;
	border-color: limegreen;
	background-color: limegreen;
	color: white;
	cursor: pointer;
}

#submitt {
	position:relative;
	float:right;
	margin:0 0 0 0;
	height: 42px;
	width: 130px;
	font-weight: 800;
	border-style: solid;
	border-color: limegreen;
	background-color: limegreen;
	color: white;
	cursor: pointer;
	margin: auto;
	opacity: 0;
}

#submitReplace {
	position: absolute;
	float:right;
	margin:0 0 0 0;
	height: 42px;
	width: 130px;
	font-weight: 800;
	border-style: solid;
	border-color: limegreen;
	background-color: limegreen;
	color: white;
	cursor: pointer;
}

</style>
</head>
<body>
	<div class=uploadTitle>
		<h2>사업자 등록증 업로드</h2>
	</div>
	<table class=uploadTable>
		<form action="./upload" method="post" enctype="multipart/form-data"
			name="form">
		<tr>
			<td colspan="3"><hr /></td>
		</tr>
		<tr>
			<td><input type="text" id="result" name="result"
				value="${filename}" disabled="true" style="height: 36px" /></td>
			<td><button id="fileReplace">파일 찾기</button>
				<input type="file" id="filenamee" name="filename" /></td>
		</tr>
		<tr>
			<td colspan="3"><hr /></td>
		</tr>
		<tr>
			<td><button id="submitReplace">등록증 업로드</button>
				<input type="submit" id="submitt" /></td>
		</tr>
		</form>
	</table>
</body>

<script>
	var msg = "${msg}";
	var path = "${filename}";
	var filename = $("#filenamee").val();

	$(document)
			.ready(
					function() {
						console.log(document.getElementById("filenamee").value);
						if (msg == "정상 업로드") {
							opener.document.getElementById("successinfo").value = document
									.getElementById("result").value;
							window.open("about:blank", "_self").close();
							alert(msg);

						} else if (msg == "jpg 또는 png 파일만 가능합니다.") {
							alert(msg);
						}

					});
</script>
</html>