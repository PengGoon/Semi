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
</head>
<body>
	<form action="./upload" method="post" enctype="multipart/form-data"
		name="form">
		<fieldset>
			<legend>사업자 등록증 업로드</legend>
			<input type="text" id="result" name="result" value="${filename}" />
			<input type="file" id="filenamee" name="filename" /> <input
				type="submit" value="업로드" />
		</fieldset>
	</form>
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