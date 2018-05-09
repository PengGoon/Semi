<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	</head>
		<style>
		#notice_form{
			margin:0 auto;
		}
		#write-form td {
		    border: none;
		}
		#write-form textarea {
		    width: 90%;
		}
		table{
    		border-top : 1px solid black;
    		border-collapse: collapse;
    		text-align: center;

			min-width : 700px;
			margin : 0 auto;
            height:300px; 

		}
		h3{
			text-align: center;
		}
		h2{
			margin-left : 15px;
		}
		</style>
	<body>
	<div id="notice_form"><h2>공지사항</h2></div>
		<h3>공지사항 글쓰기 </h3>
		<form id="writeForm" action="" method="post" >
		<table id="write-form" class="">
			<tr>
			    <td>제목</td>
			    <td><input type="text" name="title" style="width: 90%;" placeholder="제목을 입력하세요" /></td>
			</tr>
			<tr>
				<td>내용</td>
			    <td>
			        <textarea name="content" rows="15" cols="120" placeholder="내용을 입력하세요"></textarea>
			    </td>
			</tr>
		</table>
		<div style="text-align: center;padding-bottom: 15px;">
			<br/><br/>
		    <input type="button" value="작성 완료" onclick="notice_write()"/>
		</div>
		</form>
	
	</body>
	<script></script>
</html>