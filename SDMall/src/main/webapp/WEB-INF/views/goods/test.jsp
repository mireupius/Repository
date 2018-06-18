<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery.js"></script>
<script type="text/javascript">
	function saveContent() {
		Editor.save(); // 이 함수를 호출하여 글을 등록하면 된다.
	}

	$(function() {
		$(".ct1").click(function() {
			var cn = $(this).attr("category_num");
			alert(cn);

			/* 			//$.each(배열, 데이터하나만날때마다 호출되는 콜백함수);
			 $(".ct1").each(function(i, s){
			 // ct1에 들어있는 모든 값 돌면서 출력
			 alert($(s).text());		
			 }); */

			$.ajax({
				url : "category.get",
				data : {
					ct_no : cn
				},
				success : function(json) {
					alert(json);
					var ar = json.category;
					$("table").empty();
					$.each(ar, function(i, s) {
						var nTd = $("<td></td>").text(s.ct_clfname);
						var tr = $("<tr></tr>").append(nTd);
						$("table").append(tr);
					});
				}
			});
		});
	});
</script>

</head>
<body>

	<div>
		<ul>
			<c:forEach var="i" begin="0"
				end="${category.size() > 0 ? category.size()-1 : category.size() }"
				step="1">
				<c:if test="${category[i].ct_clf == '1'}">
					<li class="ct1" category_num="${category[i].ct_no }">${category[i].ct_clfname}</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>

	<%-- ${param.daumcontent} --%>
	<table></table>
	<%-- <c:forEach var="tt" items="${tent }">
			<tr>
				<td>${tt.gt_no}</td>
				<td>${tt.gt_gdno}</td>
				<td>${tt.gt_mdlname}</td>
				<td>${tt.gt_maker}</td>
				<td>${tt.gt_brand}</td>
				<td>${tt.gt_mfd}</td>
				<td>${tt.gt_exp}</td>
				<td>${tt.gt_material}</td>
				<td>${tt.gt_weight}</td>
				<td>${tt.gt_volume}</td>
				<td>${tt.gt_origin}</td>
				<td>${tt.gt_stock}</td>
				<td>${tt.gt_keyword}</td>
				<td>${tt.gt_detail}</td>
			</tr>
		</c:forEach> --%>
	<%-- <c:forEach var="ctg" items="${category }">
			<c:if test="${ctg.ct_clf == '1'}">
				<li id="ct1">${ctg.ct_clfname}</li>
			</c:if>
		</c:forEach>
		<c:forEach var="i" begin="0" end="${category.size() > 0 ? category.size()-1 : category.size() }" step="1">
			<c:if test="${category[i].ct_clf == '1'}">
									${category[i].ct_clf }
				<li id="ct1">${category[i].ct_clfname}</li>
			</c:if>
		</c:forEach> --%>
	ddd 

</body>
</html>