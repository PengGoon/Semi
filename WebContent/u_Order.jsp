<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<<<<<<< HEAD
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<style>
	table, td {
		/* border: 1px solid black; */
		width: 0%;
		padding: 10px;
		border-top: 1px solid #444444;
		border-collapse: collapse;
		text-align: center;
		margin: 0 auto;
		border-bottom: 1px solid #444444;
	}
	
	.ta {
		border-left: 1px solid #444444;
		border-right: 1px solid #FFFFFF;
	}
	
	.tb {
		border-left: 1px solid #FFFFFF;
	}
	
	.tc {
		border-left: 1px solid #FFFFFF;
		border-right: 1px solid #FFFFFF;
	}
	
	.td {
		/* border-left: 1px solid #FFFFFF; */
		border-left: 1px solid #FFFFFF;
		text-align: center;
	}
	
	.te {
		border-left: 1px solid #FFFFFF;
		border-right: 1px solid #444444;
	}
	#del{
		margin: 0 1110px;
	}	
	</style>
	</head>
	<body>
		<jsp:include page="navi.jsp"></jsp:include>
		<jsp:include page="myPage_menu.jsp"></jsp:include>
		<br><br><br><br>
		<table id="listTable">
			<tr>
				<td colspan="2"><input type="checkbox" id="allcheck">주문번호
				</td>
				<td colspan="3">상품정보</td>
				<td>수량</td>
				<td>구매일</td>
				<td>배송상태</td>
				<td>관리</td>
			</tr>
			<!-- JSON 내용을 테이블로 출력 -->
		</table>
		<input id="del" type="button" value="삭제" />
	</body>
	<script>
		//리스트 호출(ajax)
		var obj = {};
		obj.error = function(e) {
			console.log(e)
		};
		obj.type = "POST";
		obj.dataType = "JSON";
	
		$(document).ready(function() {
			obj.url = "./u_list";
			obj.success = function(data) {
				//console.log(data);
				if (data.list) {
					//리스트 보여주기
					listPrint(data.list);
				} else {
					alert("로그인이 필요한 서비스 입니다.");
					location.href = "index.jsp";
				}
			}
			ajaxCall(obj);
		});
	
		function listPrint(list) {
			console.log(list);
			var content = "";
	
			list.forEach(function(list, pur_id) {
						content += "<tr>";
						content += "<td class='tb'><input class='checkcheck' type='checkbox' value='"+list.pur_id+"'/></td>";
						//content +="<td class='td'><a href='./list?prd_Id="+list.prd_Id+"'>"+list.prd_id+"</a></td>";
						content += "<td class='td'>" + list.prd_id + "</td>";
						content += "<td class='ta'><img width='100' src='./upload/"+list.newFileName1+"'/></td>";//상품이름
						content += "<td class='tc'>" + list.prd_name + "</td>";//상품이름
						content += "<td class='te'>가격:" + list.prd_price + "원</td>"; //가격
						content += "<td>" + list.pur_count + "</td>";//수량
						content += "<td>" + list.pur_date + "</td>"; //날짜
						content += "<td>" + list.pur_state + "</td>";//배송
						content += "<td>"
								+ "<input type='button' value='후기작성' onclick=location.href='reviewWriteForm.jsp' /></td>";//ok
						content += "</tr>";
					});
			$("#listTable").append(content);
		}
	
		//체크박스
		$("#allcheck").click(function() {
			//만약 전체 선택 체크박스가체크된 상태일경우
			if ($("#allcheck").prop("checked")) {
				//해당화면 에전체 checkbox들을 체크해준다
				$("input[type='checkbox']").prop('checked', true);
			} else {
				//해당화면 에전체 checkbox들을 체크해제시켜준다
				$("input[type='checkbox']").prop('checked', false);
			}
	
		});
		//삭제
		$("#del").click(function() {
			obj.url = "./u_delete";
			var checked = [];
			//$(elem).each() == elem.forEach()
			$(".checkcheck:checked").each(function() {
				checked.push($(this).val());
			});
			console.log(checked);
			obj.data = {
				delList : checked
			};
			obj.success = function(data) {
				if (data.success) {
					alert("삭제에 성공 했습니다.");
					location.href = "u_Order.jsp";
				} else {
					alert("삭제에 실패 했습니다.");
				}
				location.href = "myPage.jsp";
			}
			console.log(obj);
			ajaxCall(obj);
		});
	
		function ajaxCall(param) {
			//console.log(param);
			$.ajax(param);
		}
	</script>
=======
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>Insert title here</title>
   <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
   <style>
   table, td {
      /* border: 1px solid black; */
      width: 0%;
      padding: 10px;
      border-top: 1px solid #444444;
      border-collapse: collapse;
      text-align: center;
      margin: 0 auto;
      border-bottom: 1px solid #444444;
   }
   
   .ta {
      border-left: 1px solid #444444;
      border-right: 1px solid #FFFFFF;
   }
   
   .tb {
      border-left: 1px solid #FFFFFF;
   }
   
   .tc {
      border-left: 1px solid #FFFFFF;
      border-right: 1px solid #FFFFFF;
   }
   
   .td {
      /* border-left: 1px solid #FFFFFF; */
      border-left: 1px solid #FFFFFF;
      text-align: center;
   }
   
   .te {
      border-left: 1px solid #FFFFFF;
      border-right: 1px solid #444444;
   }
   #del{
      margin: 0 1110px;
   }   
   </style>
   </head>
   <body>
      <jsp:include page="navi.jsp"></jsp:include>
      <jsp:include page="myPage_menu.jsp"></jsp:include>
      <br><br><br><br>
      <table id="listTable">
         <tr>
            <td colspan="2"><input type="checkbox" id="allcheck">주문번호
            </td>
            <td colspan="3">상품정보</td>
            <td>수량</td>
            <td>구매일</td>
            <td>배송상태</td>
            <td>관리</td>
         </tr>
         <!-- JSON 내용을 테이블로 출력 -->
      </table>
      <input id="del" type="button" value="삭제" />
   </body>
   <script>
      //리스트 호출(ajax)
      var obj = {};
      obj.error = function(e) {
         console.log(e)
      };
      obj.type = "POST";
      obj.dataType = "JSON";
   
      $(document).ready(function() {
         obj.url = "./u_list";
         obj.success = function(data) {
            //console.log(data);
            if (data.list) {
               //리스트 보여주기
               listPrint(data.list);
            } else {
               alert("로그인이 필요한 서비스 입니다.");
               location.href = "index.jsp";
            }
         }
         ajaxCall(obj);
      });
   
      function listPrint(list) {
         console.log(list);
         var content = "";
   
         list.forEach(function(list, pur_id) {
                  content += "<tr>";
                  content += "<td class='tb'><input class='checkcheck' type='checkbox' value='"+list.pur_id+"'/></td>";
                  //content +="<td class='td'><a href='./list?prd_Id="+list.prd_Id+"'>"+list.prd_id+"</a></td>";
                  content += "<td class='td'>" + list.prd_id + "</td>";
                  content += "<td class='ta'><img width='100' src='./upload/"+list.newFileName1+"'/></td>";//상품이름
                  content += "<td class='tc'>" + list.prd_name + "</td>";//상품이름
                  content += "<td class='te'>가격:" + list.prd_price + "원</td>"; //가격
                  content += "<td>" + list.pur_count + "</td>";//수량
                  content += "<td>" + list.pur_date + "</td>"; //날짜
                  content += "<td>" + list.pur_state + "</td>";//배송
                  content += "<td>"
                        + "<input type='button' value='후기작성' onclick=location.href='reviewWriteForm.jsp' /></td>";//ok
                  content += "</tr>";
               });
         $("#listTable").append(content);
      }
   
      //체크박스
      $("#allcheck").click(function() {
         //만약 전체 선택 체크박스가체크된 상태일경우
         if ($("#allcheck").prop("checked")) {
            //해당화면 에전체 checkbox들을 체크해준다
            $("input[type='checkbox']").prop('checked', true);
         } else {
            //해당화면 에전체 checkbox들을 체크해제시켜준다
            $("input[type='checkbox']").prop('checked', false);
         }
   
      });
      //삭제
      $("#del").click(function() {
         obj.url = "./delete";
         var checked = [];
         //$(elem).each() == elem.forEach()
         $(".checkcheck:checked").each(function() {
            checked.push($(this).val());
         });
         console.log(checked);
         obj.data = {
            delList : checked
         };
         obj.success = function(data) {
            if (data.success) {
               alert("삭제에 성공 했습니다.");
               location.href = "u_Order.jsp";
            } else {
               alert("삭제에 실패 했습니다.");
            }
            location.href = "main.html";
         }
         console.log(obj);
         ajaxCall(obj);
      });
   
      function ajaxCall(param) {
         //console.log(param);
         $.ajax(param);
      }
   </script>
>>>>>>> cb41482e5fbac7c4974389b474bb4cd06d8edc87
</html>