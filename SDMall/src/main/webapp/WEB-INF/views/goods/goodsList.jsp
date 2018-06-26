<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/goods/goodsList.css">
<style type="text/css">
h3 {
	margin-bottom: 0;
	margin-top: 0;
	font-weight: 400;
	font-size: 14pt;
	color: #fff;
	background-color: #848898;
}

.imgli {
	float: left;
	width: 200px;
}
</style>
<script type="text/javascript">
$(function(){
		
		$("#s_bt").click(function(){
			var k_name = $("#sKey").val();
			var k_value = $("#sValue").val();
	
			 $.ajax({
				url : "goods.search.keyword",
				data : {key_name : k_name, key_value : k_value},
				success : function(json) {
					var ar = json.goods;
					
					$.each(ar, function(i, c){
						$("#gdLstTr").empty();
						
						$.each(ar, function(i, s){
							var noTd = $("<td></td>").attr("class","gdLstTd1").text(i+1);
							var codeA = $("<a></a>").attr("href","goods.view?gd_no="+s.gd_no).text(s.gd_no);
							var codeTd = $("<td></td>").attr("class","gdLstTd1").append(codeA);
							var nameImg=$("<img>").attr("src","${pageContext.request.contextPath}/upload/"+s.gd_imgl);
							nameImg.css("width","44").css("height","44");
							var nameTd = $("<td></td>").attr("class","gdLstTd1").append(nameImg);
							nameTd.append("&nbsp;&nbsp; " + s.gd_name);
							var priceTd = $("<td></td>").attr("class","gdLstTd1").text(s.gd_price);
							var cmpriceTd = $("<td></td>").attr("class","gdLstTd1").text(s.gd_csmprice);
							var tr = $("<tr></tr>").append(noTd, codeTd, nameTd, priceTd,cmpriceTd);
							$("#gdLstTr").append(tr);
						});
						
					});
				}
			});
		});
});

</script>
</head>
<body>
	<section id="main-content">
	<section class="wrapper">
		<table border="1" summary="" class="eChkColor">
			<colgroup>
				<div class="gdliTb3">
					<h3>&nbsp;&nbsp;&nbsp;&nbsp;</h3>
				</div>
				<div>
					<div>
						<table class="table table-bordered table-striped table-condensed">
							<tbody>
								<tr class="gdliTb1">
									<td class="gdLstTitle">상품명 검색</td>
									<td class="gdLstTd2">
									<select class="gdLstSel" id="sKey" >
											<option value="gd_name">상품명</option>
											<option value="">--------------------</option>
											<option value="gd_no">상품번호</option>
											<option value="">--------------------</option>
											<option value="gt_maker">제조사</option>
											<option value="gt_brand">브랜드</option>
											<option value="">--------------------</option>
											<option value="gt_mdlname">모델명</option>
											<option value="gt_origin">원산지</option>
											<option value="gt_keyword">상품 검색태그</option>
											<option value="gt_weight">상품 전체중량</option>
									</select>
									<input id="sValue" >
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<br>
				<br>
				<br>
<div>
<button id="s_bt">검색</button>
</div>
				<br>
				<br>
				<br>
				<div class="gdLstTb3">
					<h3>상품목록</h3>
				</div>
				<div>
					<div>
						<table class="table table-bordered table-striped table-condensed">
								<tr>
									<td class="gdLstTd1">No</td>
									<td class="gdLstTd1">상품코드</td>
									<td class="gdLstTd1">상품명</td>
									<td class="gdLstTd1">판매가</td>
									<td class="gdLstTd1">소비자가</td>
								</tr>
							<tbody id="gdLstTr">
								<c:if test="${gdslist.size() > 0}">
									<c:forEach var="i" begin="0" end="${gdslist.size()-1}" >
										<tr>
											<td class="gdLstTd1">${i+1}</td>
											<td class="gdLstTd1"><a href="goods.view?gd_no=${gdslist[i].gd_no}" >${gdslist[i].gd_no}</a></td>
											<td class="gdLstTd1"><img src="${pageContext.request.contextPath}/upload/${gdslist[i].gd_imgl}" width="44"
												height="44" alt="">&nbsp;&nbsp; ${gdslist[i].gd_name}</td>
											<td class="gdLstTd1">${gdslist[i].gd_price}</td>
											<td class="gdLstTd1">${gdslist[i].gd_csmprice}</td>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
				<br>
				<br>
				<br>
	</section>
	</section>
</body>
</html>