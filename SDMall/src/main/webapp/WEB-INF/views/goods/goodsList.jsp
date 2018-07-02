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
function nullReplace(a){
	if(a == null){
		return "";
	}
	return a;
}

function pageGo(p){
	// 주의사항: 오름차순과 내림차순이 페이징 과정에서 반전 되는 것을 유의 해야함
	//         오름차순과 내림차순 선택시 asc와 desc를 반대로 설정해줘야함
	var k_name = $("#sKey").val();
	var k_value = $("#sValue").val();
	var sort_name = $("#sort").val();
	var desc_name = $("#desc").val();
	var curPage = p;
	
	$.ajax({
		url : "goods.search.keyword",
		data : {
				key_name : k_name,
				key_value : k_value,
				sort_name : sort_name,
				desc_name : desc_name
				,curPage : curPage
				},
		success : function(json) {
			var ar = json.goodsView;
			curPage = json.curPage;
			var pc = json.pageCount;
			
			$("#gdLstTr").empty();
			
			$.each(ar, function(i, s){
				var makerTd = $("<td></td>").attr("class","gdLstTd1").text(nullReplace(s.gt_maker));
				var brandTd = $("<td></td>").attr("class","gdLstTd1").text(nullReplace(s.gt_brand));
				var mdlnameTd = $("<td></td>").attr("class","gdLstTd1").text(nullReplace(s.gt_mdlname));
				var originTd = $("<td></td>").attr("class","gdLstTd1").text(nullReplace(s.gt_origin));
				var noTd = $("<td></td>").attr("class","gdLstTd1").text(4*(curPage-1)+1+i);
				var codeA = $("<a></a>").attr("href","goods.view?gd_no="+s.gd_no).text(s.gd_no);
				var codeTd = $("<td></td>").attr("class","gdLstTd1").append(codeA);
				var nameImg=$("<img>").attr("src","${pageContext.request.contextPath}/upload/"+s.gd_imgl);
				nameImg.css("width","44").css("height","44");
				var nameTd = $("<td></td>").attr("class","gdLstTd1").append(nameImg);
				nameTd.append("&nbsp;&nbsp; " + s.gd_name);
				var priceTd = $("<td></td>").attr("class","gdLstTd1").text(s.gd_price);
				var cmpriceTd = $("<td></td>").attr("class","gdLstTd1").text(s.gd_csmprice);
				var tr = $("<tr></tr>").append(noTd, codeTd, nameTd, priceTd,cmpriceTd,makerTd,brandTd,mdlnameTd,originTd);
				$("#gdLstTr").append(tr);
			});
			
			$("#pageDiv").empty();
			for (var i =1 ; i <= pc ; i++){
				if(curPage == i){
					var pageA = $("<a></a>").attr("class","pageNo red").text(i);
				}else{
					var pageA = $("<a></a>").attr("class","pageNo").text(i);
				}
				pageA.attr("onclick","pageGo("+ i +");")
				
				$("#pageDiv").append(pageA,"&nbsp;&nbsp;");
			}
		}
	});
}

$(function(){
		
		$("#sValue").keyup(function(e) {
			// 입력시 엔터치면 클릭이벤트 발생
			if(e.keyCode == 13){
				// 강제 이벤트 발생
				$("#s_bt").trigger("click");
			}
		});
	
		$("#s_bt").click(function(){
			var k_name = $("#sKey").val();
			var k_value = $("#sValue").val();
			var sort_name = $("#sort").val();
			var desc_name = $("#desc").val();
			var curPage = 1;

			$.ajax({
				//goods.search.keyword?key_name="gd_name"&key_value="00"&sort_name="gd_name"&gd_sellerid ="a"
				url : "goods.search.keyword",
				data : {
						key_name : k_name,
						key_value : k_value,
						sort_name : sort_name,
						desc_name : desc_name
						,curPage:curPage
						},
				success : function(json) {
					var ar = json.goodsView;
					curPage = json.curPage;
					var pc = json.pageCount;

					$("#gdLstTr").empty();
					
					$.each(ar, function(i, s){
						var makerTd = $("<td></td>").attr("class","gdLstTd1").text(nullReplace(s.gt_maker));
						var brandTd = $("<td></td>").attr("class","gdLstTd1").text(nullReplace(s.gt_brand));
						var mdlnameTd = $("<td></td>").attr("class","gdLstTd1").text(nullReplace(s.gt_mdlname));
						var originTd = $("<td></td>").attr("class","gdLstTd1").text(nullReplace(s.gt_origin));
						var noTd = $("<td></td>").attr("class","gdLstTd1").text(4*(curPage-1)+1+i);
						var codeA = $("<a></a>").attr("href","goods.view?gd_no="+s.gd_no).text(s.gd_no);
						var codeTd = $("<td></td>").attr("class","gdLstTd1").append(codeA);
						var nameImg=$("<img>").attr("src","${pageContext.request.contextPath}/upload/"+s.gd_imgl);
						nameImg.css("width","44").css("height","44");
						var nameTd = $("<td></td>").attr("class","gdLstTd1").append(nameImg);
						nameTd.append("&nbsp;&nbsp; " + s.gd_name);
						var priceTd = $("<td></td>").attr("class","gdLstTd1").text(s.gd_price);
						var cmpriceTd = $("<td></td>").attr("class","gdLstTd1").text(s.gd_csmprice);
						var tr = $("<tr></tr>").append(noTd, codeTd, nameTd, priceTd,cmpriceTd,makerTd,brandTd,mdlnameTd,originTd);
						$("#gdLstTr").append(tr);
					});
						
					$("#pageDiv").empty();
					for (var i =1 ; i <= pc ; i++){
						if(curPage == i){
							var pageA = $("<a></a>").attr("class","pageNo red").text(i);
						}else{
							var pageA = $("<a></a>").attr("class","pageNo").text(i);
						}
						pageA.attr("onclick","pageGo("+ i +");")
						
						$("#pageDiv").append(pageA,"&nbsp;&nbsp;");
					}
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
					<h3>검색</h3>
				</div>
				<div>
					<div>
						<table class="table table-bordered table-striped table-condensed">
							<tbody>
								<tr class="gdliTb1">
									<td class="gdLstTd2">
									<select class="gdLstSel" id="sKey" >
											<option value="gd_no">검색조건</option>
											<option value="">--------------------</option>
											<option value="gd_name">상품명</option>
											<option value="">--------------------</option>
											<option value="gd_no">상품코드</option>
											<option value="">--------------------</option>
											<option value="gt_maker">제조사</option>
											<option value="gt_brand">브랜드</option>
											<option value="">--------------------</option>
											<option value="gt_mdlname">모델명</option>
											<option value="gt_origin">원산지</option>
											<option value="gt_keyword">상품 검색태그</option>
									</select>
									<select class="gdLstSel" id="sort" >
											<option value="gd_no">정렬방법</option>
											<option value="">--------------------</option>
											<option value="gd_name">상품명</option>
											<option value="">--------------------</option>
											<option value="gd_no">상품코드</option>
											<option value="">--------------------</option>
											<option value="gt_maker">제조사</option>
											<option value="gt_brand">브랜드</option>
											<option value="">--------------------</option>
											<option value="gt_mdlname">모델명</option>
											<option value="gt_origin">원산지</option>
											<option value="gt_keyword">상품 검색태그</option>
									</select>
									<select class="gdLstSel" id="desc" >
											<option value="desc">오름차순</option>
											<option value="asc">내림차순</option>
									</select>
									<input id="sValue" ><button id="s_bt">검색</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
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
									<td class="gdLstTd1">제조사</td>
									<td class="gdLstTd1">브랜드</td>
									<td class="gdLstTd1">모델명</td>
									<td class="gdLstTd1">원산지</td>
								</tr>
							<tbody id="gdLstTr">
								<c:if test="${gdsViewList.size() > 0}">
									<c:forEach var="i" begin="0" end="${gdsViewList.size()-1}" >
										<tr>
											<td class="gdLstTd1">${i+1}</td>
											<td class="gdLstTd1"><a href="goods.view?gd_no=${gdsViewList[i].gd_no}" >${gdsViewList[i].gd_no}</a></td>
											<td class="gdLstTd1"><img src="${pageContext.request.contextPath}/upload/${gdsViewList[i].gd_imgl}" width="44"
												height="44" alt="">&nbsp;&nbsp; ${gdsViewList[i].gd_name}</td>
											<td class="gdLstTd1">${gdsViewList[i].gd_price}</td>
											<td class="gdLstTd1">${gdsViewList[i].gd_csmprice}</td>
											<td class="gdLstTd1">${gdsViewList[i].gt_maker}</td>
											<td class="gdLstTd1">${gdsViewList[i].gt_brand}</td>
											<td class="gdLstTd1">${gdsViewList[i].gt_mdlname}</td>
											<td class="gdLstTd1">${gdsViewList[i].gt_origin}</td>
											</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
				
				<div id="pageDiv" align="center">
					<c:forEach var="p" begin="1" end="${pageCount}">
						<c:choose>
							<c:when test="${p == 1}">
								<a class="pageNo red" onclick="pageGo(${p});">${p}&nbsp;</a>
							</c:when>
							<c:otherwise>
								<a class="pageNo" onclick="pageGo(${p});">${p}&nbsp;</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<br>
				<br>
				<br>
	</section>
	</section>
</body>
</html>