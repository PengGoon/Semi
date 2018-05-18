<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	</head>
	<style>
	<style>
		#write-form td {
		    border: none;
		}
		#write-form textarea {
		    width: 99%;
		    }
		    		#write-form td {
		    border: none;
		}
		#write-form textarea {
		    width: 90%;
		    border-width: 0;
		}
		table{
    		border-top : 1px solid black;
    		border-collapse: collapse;
    		text-align: center;
			min-width : 700px;
			margin : 0 auto;
            height:300px; 
		}
	</style>
	<body>
	<jsp:include page="navi.jsp"></jsp:include>
		<table id="write-form" >
			<tr>
				<td>작성자</td>
				<td><input type="text" id="admin_id" readonly/></td>
			</tr>
			<tr>
			    <td>제목</td>
			    <td><input class="edit"type="text" name="notice_title" id="notice_title"style="width: 90%;"  readonly/></td>
			</tr>
			<tr>
				<td>내용</td>
			    <td>
			        <textarea class="edit"  name="notice_content" id="notice_content" rows="15" cols="120" readonly></textarea>
			    </td>
			</tr>
		</table>
			<br/><br/>

	
	</body>
	</html>
