<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<!-- IE호환모들를 지정 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 반응형 웹페이지를 적용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- IE9 버전 이하의 브라우저에서 반응형 웹을 적용 -->
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script src="resources/js/bootstrap/bootstrap.min.js"></script>
<!-- 다음 에디터 -->
<link rel=stylesheet type=text/css
	href="${pageContext.request.contextPath}/resources/daumeditor/css/editor.css"
	charset=utf-8 />
<script type=text/javascript charset=utf-8
	src="${pageContext.request.contextPath}/resources/daumeditor/js/editor_loader.js"></script>
<script src="resources/js/goods/goodsRegCheck.js"></script>
<script src="resources/js/validCheck.js"></script>
<script type="text/javascript">
function saveContent() {
 		var clflField = document.tx_editor_form.gd_clfl;
 		var clfmField = document.tx_editor_form.gd_clfm;
 		var gdNameField = document.tx_editor_form.gd_name;
 		var mdlnameField = document.tx_editor_form.gt_mdlname;
 		var csmpriceField = document.tx_editor_form.gd_csmprice;
 		var priceField = document.tx_editor_form.gd_price;
 		var opNameField = document.tx_editor_form.op_name0;
 		var opPriceField = document.tx_editor_form.op_price0;
 		var opStockField = document.tx_editor_form.op_stock0;
 		var gdFileField = document.tx_editor_form.gd_file1;
 		var makerField = document.tx_editor_form.gt_maker;
 		var brandField = document.tx_editor_form.gt_brand;
 		var mdfField = document.tx_editor_form.gt_mfd;
 		var expField = document.tx_editor_form.gt_exp;
 		var materialField = document.tx_editor_form.gt_material;
 		var weightField = document.tx_editor_form.gt_weight;
 		var volumeField = document.tx_editor_form.gt_volume;
 		var originField = document.tx_editor_form.gt_origin;
 		var dlvchrgField = document.tx_editor_form.gd_dlvchrg;
 		var outareaField = document.tx_editor_form.gd_outarea;
 	
 		if (clflField==null) {
 			alert("상품 대분류 를 선택해주세요.");
 			$("body").scrollTop(0);
 		}else if(clfmField==null){
 			alert("상품 중분류 를 선택해주세요.");
 		}else if(isEmpty(gdNameField)){
 			alert("상품명을 입력해주세요.");
 			gdNameField.value = "";
 			gdNameField.focus();
 		}else if(isEmpty(mdlnameField)){
 			alert("모델명을 입력해주세요.");
 			mdlnameField.value = "";
 			mdlnameField.focus();
 		}else if(isEmpty(csmpriceField)){
 			alert("소비자가를 입력해주세요.");
 			csmpriceField.value = "";
 			csmpriceField.focus();
 			
 		}else if(isEmpty(priceField)){
 			alert("판매가를 입력해주세요.");
 			priceField.value = "";
 			priceField.focus();
 			
 		}else if(isEmpty(opNameField)){
 			alert("옵션명를 입력해주세요.");
 			opNameField.value = "";
 			opNameField.focus();
 			
 		}else if(isEmpty(opPriceField)){
 			alert("옵션가를 입력해주세요.");
 			opPriceField.value = "";
 			opPriceField.focus();
 			
 		}else if(isEmpty(opStockField)){
 			alert("옵션재고를 입력해주세요.");
 			opStockField.value = "";
 			opStockField.focus();

 		}else if(isEmpty(gdFileField)){
 			alert("이미지를 등록해주세요.");
 			
 		}else if(isNotNumber(mdfField)){
 			alert("숫자만 입력 해주세요.");
 			mdfField.value = "";
 			mdfField.focus();
 		}else if(isNotNumber(expField)){
 			alert("숫자만 입력 해주세요.");
 			expField.value = "";
 			expField.focus();
 		}else if(isNotNumber(weightField)){
 			alert("숫자만 입력 해주세요.");
 			expField.value = "";
 			expField.focus();
 			
 		}else if(isNotNumber(volumeField)){
 			alert("숫자만 입력 해주세요.");
 			expField.value = "";
 			expField.focus();
 		}else if(isEmpty(dlvchrgField)){
 			alert("배송비를 입력 해주세요.");
 			
 		}else if(isEmpty(outareaField)){
 			alert("출고지를 입력 해주세요.");
 		}else{
 			  Editor.save(); // 이 함수를 호출하여 글을 등록하면 된다.
 		}
 		
}

$(function(){

//구버전	$(".ct1").click(function() {
	$(document).on("click",".ct1",function(){
		var cn = $(this).attr("category_num");
		var clfname = $(this).text();
		var clf = "2";

		$.ajax({
			url : "category.get",
			data : {ct_no : cn, ct_clf : clf},
			success : function(json) {
				var ar = json.category;
				
				$("#ct12").empty();
				$("#ct13").empty();
				$("#category_select1").empty();
				$("#category_select2").empty();
				$("#category_select3").empty();
				
				if(ar.length > 0){
					$.each(ar, function(i, c){
						
						var fname = $("<li></li>").text(c.ct_clfname);
						fname.attr("class","ct2");
						fname.attr("category_num", c.ct_no);
						$("#ct12").append(fname);
						// 카테고리 선택 표시 영역
						$("#category_select1").text(clfname + " > ");
						var input = $("#ctgry1").val(cn);
		                input.attr("name", "gd_clfl");
					});
				
				}else{
				
					// 카테고리 선택 표시 영역
					$("#category_select1").text(clfname + " > ");
					var input = $("#ctgry1").val(cn);
	                input.attr("name", "gd_clfl");
				}
			}
		});
	});
	
	// 동적으로 생성된 태그에 이벤트 주기 $(document).on("click",".ct2",function(){
	$(document).on("click",".ct2",function(){
		var cn = $(this).attr("category_num");
		var clfname = $(this).text();
		var clf = "3";
		
		$.ajax({
			url : "category.get",
			data : {ct_no : cn, ct_clf : clf},
			success : function(json) {
				var ar = json.category;
				
				$("#ct13").empty();
				$("#category_select2").empty();
				$("#category_select3").empty();
				
				if(ar.length > 0){
					$.each(ar, function(i, c){
						
						var fname = $("<li></li>").text(c.ct_clfname);
						fname.attr("class","ct3");
						fname.attr("category_num", c.ct_no);
						$("#ct13").append(fname);
						
						// 카테고리 선택 표시 영역
						$("#category_select2").text(clfname);
						var input = $("#ctgry2").val(cn);
		                input.attr("name", "gd_clfm");
		                
					});
				}else{
					// 카테고리 선택 표시 영역
					$("#category_select2").text(clfname);
					var input = $("#ctgry2").val(cn);
	                input.attr("name", "gd_clfm");
				}
			}
		});
	});
	
	// 동적으로 생성된 태그에 이벤트 주기 $(document).on("click",".ct2",function(){
	$(document).on("click",".ct3",function(){
		var cn = $(this).attr("category_num");
		var clfname = $(this).text();
		
		$("#category_select3").empty();
		// 카테고리 선택 표시 영역
		$("#category_select3").text(" > "+clfname);
		var input = $("#ctgry3").val(cn);
        input.attr("name", "gd_clfs");
	});
	   
	// ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ 옵션값 배열로 저장 input hidden으로 넘기기 ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
	var opN = 1;// 옵션 항목 눌렀을 경우 추가되는 name의 번호

	$(document).on("click","#opPlus",function(){

		var opInputN = $("<input>").attr("class","inpWidth").attr("name", "op_name"+opN);
		var opSpanN = $("<span></span>").append(opInputN);
		
		var opInputP = $("<input>").attr("class","inpWidth").attr("name", "op_price"+opN);
		var opSpanP = $("<span></span>").append(opInputP);
		
		var opInputS = $("<input>").attr("class","inpWidth").attr("name", "op_stock"+opN);
		var opSpanS = $("<span></span>").append(opInputS);

		var opLi = $("<li></li>").attr("class","opTb").append(opSpanN, opSpanP, opSpanS);
		$(".opUl").append(opLi);
		
		opN++;
	});
	
	// 적용 버튼 클릭으로 옵션값 히든에 저장
//	$(document).on("keyup","[name=op_stock"+(opN-1)+"]",function(){
	$(document).on("click","#opSave",function(){
		var r = opN;
		var opl_name = [];
		var opl_price = [];
		var opl_stock = [];
		
		for (var i = 0; i < r; i++) {
			opl_name[i] = $("input[name=op_name"+i+"]").val();
			opl_price[i] = $("input[name=op_price"+i+"]").val();
			opl_stock[i] = $("input[name=op_stock"+i+"]").val();
		}
		
		$("input[name=opl_name]").val(opl_name);
		$("input[name=opl_price]").val(opl_price);
		$("input[name=opl_stock]").val(opl_stock);
		alert("옵션 적용");

	});
	// ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲ 옵션값 배열로 저장 input hidden으로 넘기기 ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
	
});

	var sel_file;
	
	$(document).ready(function(){  
		$("#input_img").on("change", handleImgFileSelect);
	});

	function handleImgFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){alert("확장자는 이미지 확장자만 가능")
				return;
			}
			
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e){
				$("#img1").attr("src", e.target.result); 
				$("#img2").attr("src", e.target.result);
				$("#img3").attr("src", e.target.result);
				$("#img4").attr("src", e.target.result);
			}
			
			reader.readAsDataURL(f);
		});
	}
	
</script>

<title>Goods</title>
<link rel="stylesheet" href="resources/css/goods/goods.css">
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

</head>
<body>
<section id="main-content">
<section class="wrapper">
<form name="tx_editor_form" id="tx_editor_form" action="registration.do" method="post" accept-charset="utf-8" encType=multipart/form-data >
	<div class="gdTb3" data-toggle="collapse" href="#collapse1"
		aria-expanded="false" aria-controls="collapse1">
		<h3>표시설정</h3>
	</div>
	<div class="collapse in" id="collapse1">
		<div>
			<table class="gdTb3">
				<tbody>
					<tr>
						<td class="gdTd1">상품분류 선택 필수</td>
						<td class="gdTd2">
						<br>
							<table id="gdTb2">
								<tr>
									<td class="gdinTdleft gdinTdBgC" align="center">대분류</td>
									<td class="gdinTdcenter gdinTdBgC" align="center">중분류</td>
									<td class="gdinTdright gdinTdBgC" align="center">소분류</td>
								</tr>
								<tr>
									<td class="gdinTdleft gdinTdBottom height">
										<div>
											<ul>
												<c:forEach var="i" begin="0" end="${category.size() > 0 ? category.size()-1 : category.size() }" step="1">
													<c:if test="${category[i].ct_clf == '1'}">
														<li class="ct1" category_num="${category[i].ct_no}" >${category[i].ct_clfname}</li>
													</c:if>
												</c:forEach>
											</ul>
										</div>
									</td>
									<td class="gdinTdcenter gdinTdBottom height">
										<div >
											<ul id= "ct12"></ul>
										</div>
									</td>
									<td class="gdinTdright gdinTdBottom height">
										<div>
											<ul id= "ct13"></ul>
										</div>
									</td>
								</tr>
							</table> <br> <br>
							<div>
								<span id="category_select1"></span>
								<span id="category_select2"></span>
								<span id="category_select3"></span>
								<input id="ctgry1"  type="hidden">
								<input id="ctgry2"  type="hidden">
								<input id="ctgry3"  type="hidden">
							</div>
							<br>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="gdTb3" data-toggle="collapse" href="#collapse2"
		aria-expanded="false" aria-controls="collapse2">
		<h3>기본정보</h3>
	</div>
	<div class="collapse in" id="collapse2">
		<div>
			<table class="gdTb3">
				<tbody>
					<tr>
						<td class="gdTd1">상품명 필수(20)</td>
						<td class="gdTd2"><input class="inpWidth" name="gd_name"></td>
					</tr>
					<tr>
						<td class="gdTd1">모델명(20)</td>
						<td class="gdTd2"><input class="inpWidth" name="gt_mdlname"></td>
					</tr>
					<tr>
						<td class="gdTd1">상품상세설명 필수</td>
						<td class="gdTd2">
							<!-- 에디터 시작 -->
							<div>
								<!-- 에디터프레임호출 영역 -->
								<div id="editor_frame">
									<!-- 다음에디터 넣기 -->
									<jsp:include page="../daumeditor/editor.jsp"></jsp:include>
								</div>
							</div>
							<!-- 에디터 끝 -->
						</td>
					</tr>
					<tr>
						<td class="gdTd1">검색어설정(40)</td>
						<td class="gdTd2"><input class="inpWidth" name="gt_keyword"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="gdTb3" data-toggle="collapse" href="#collapse3"
		aria-expanded="false" aria-controls="collapse3">
		<h3>판매정보</h3>
	</div>
	<div class="collapse in" id="collapse3">
		<div>
			<table class="gdTb3">
				<tbody>
					<tr>
						<td class="gdTd1">소비자가 필수(7)</td>
						<td class="gdTd2"><input class="inpWidth" name="gd_csmprice"></td>
					</tr>
					<tr>
						<td class="gdTd1">판매가 필수(7)</td>
						<td class="gdTd2"><input class="inpWidth" name="gd_price"></td>
					</tr>
					
				</tbody>
			</table>
		</div>
	</div>
	<div class="gdTb3" data-toggle="collapse" href="#collapse4"
		aria-expanded="false" aria-controls="collapse4">
		<h3>옵션/재고</h3>
	</div>
	<div class="collapse in" id="collapse4">
		<div>
			<table class="gdTb3">
				<tbody>
					<tr>
						<td class="gdTd1">옵션명 필수(20)</td>
						<td class="gdTd2" rowspan="3">
						<div>
						<ul class="opUl">
							<li class="opTb">
								<span>
									<input class="inpWidth" name="op_name0">
								</span><br>
								<span>
									<input class="inpWidth" name="op_price0">
								</span><br>
								<span>
									<input class="inpWidth" name="op_stock0">
								</span>
							</li>
						</ul>
						</div>
						<li class="opTbr">
							<button id="opPlus">추가</button>
						</li>
						<li class="opTbr">
							<button id="opSave">적용</button>
						</li>
						<input class="inpWidth" name="opl_name" type="hidden">
						<input class="inpWidth" name="opl_price" type="hidden">
						<input class="inpWidth" name="opl_stock" type="hidden">
						</td>
					</tr>
					<tr>
						<td class="gdTd1">옵션가격 필수(7)</td>
					</tr>
					<tr>
						<td class="gdTd1">옵션재고 필수(4)</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="gdTb3" data-toggle="collapse" href="#collapse5"
		aria-expanded="false" aria-controls="collapse5">
		<h3>이미지</h3>
	</div>
	<div class="collapse in" id="collapse5">
		<div>
			<table class="gdTb3">
				<tbody>
					<tr>
						<td class="gdTd1" rowspan="2">이미지 등록 필수</td>
						<td class="gdTd2">
							<div>
								<ul>
									<li class="liImg">
										<span>상세이미지</span><br>
										<span>권장 470px * 470px</span><br>
										<span>
											<img id="img1" src="${pageContext.request.contextPath}/resources/files/goods/img/108x108_2.gif" width="108" height="108" >
										</span>
									</li>
									<li class="liImg">
										<span>목록 이미지</span><br>
										<span>권장 236px * 236px</span><br>
										<span>
											<img id="img2" src="${pageContext.request.contextPath}/resources/files/goods/img/108x108_2.gif" width="108" height="108" >
										</span>
									</li>
									<li  class="liImg">
										<span>작은목록 이미지</span><br>
										<span>권장 220px * 220px</span><br>
										<span>
											<img id="img3"  src="${pageContext.request.contextPath}/resources/files/goods/img/108x108_2.gif" width="108" height="108"  >
										</span>
									</li>
									<li class="liImg">
										<span>축소 이미지</span><br>
										<span>권장 70px * 70px</span><br>
										<span>
											<img id="img4" src="${pageContext.request.contextPath}/resources/files/goods/img/108x108_2.gif" width="108" height="108" >
										</span>
									</li>
								</ul>
							</div><br>
						</td>
					</tr>
					<tr>
						<td class="gdTd2">
							<span>
								<input type="file" id="input_img" name="gd_file1">
								<input type="hidden"  name="gd_file2" >
								<input type="hidden"  name="gd_file3">
								<input type="hidden"  name="gd_file4">
							</span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="gdTb3" data-toggle="collapse" href="#collapse6"
		aria-expanded="false" aria-controls="collapse6">
		<h3>제작 정보</h3>
	</div>
	<div class="collapse in" id="collapse6">
		<div>
			<table class="gdTb3">
				<tbody>
					<tr>
						<td class="gdTd1">제조사(20)</td>
						<td class="gdTd2"><input class="inpWidth" name="gt_maker"></td>
					</tr>
					<tr>
						<td class="gdTd1">브랜드(20)</td>
						<td class="gdTd2"><input class="inpWidth" name="gt_brand"></td>
					</tr>
					<tr>
						<td class="gdTd1">제조일자(20)</td>
						<td class="gdTd2"><input class="inpWidth" name="gt_mfd"></td>
					</tr>
					<tr>
						<td class="gdTd1">유효기간(20)</td>
						<td class="gdTd2"><input class="inpWidth" name="gt_exp"></td>
					</tr>
					<tr>
						<td class="gdTd1">상품소재(20)</td>
						<td class="gdTd2"><input class="inpWidth" name="gt_material"></td>
					</tr>
					<tr>
						<td class="gdTd1">전체중량(kg)(20)</td>
						<td class="gdTd2"><input class="inpWidth" name="gt_weight"></td>
					</tr>
					<tr>
						<td class="gdTd1">부피(cm)(20)</td>
						<td class="gdTd2"><input class="inpWidth" name="gt_volume"></td>
					</tr>
					<tr>
						<td class="gdTd1">원산지(20)</td>
						<td class="gdTd2"><input class="inpWidth" name="gt_origin"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="gdTb3" data-toggle="collapse" href="#collapse7"
		aria-expanded="false" aria-controls="collapse7">
		<h3>배송 정보</h3>
	</div>
	<div class="collapse in" id="collapse7">
		<div>
			<table class="gdTb3">
				<tbody>
					<tr>
						<td class="gdTd1">배송비 필수(20)</td>
						<td class="gdTd2"><input class="inpWidth" name="gd_dlvchrg"></td>
					</tr>
					<tr>
						<td class="gdTd1">출고지 필수(20)</td>
						<td class="gdTd2"><input class="inpWidth" name="gd_outarea"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="gdTb3" data-toggle="collapse" href="#collapse8"
		aria-expanded="false" aria-controls="collapse8">
		<h3>판매자 정보</h3>
	</div>
	<div class="collapse in" id="collapse8">
		<div>
			<table class="gdTb3">
				<tbody>
					<tr>
						<td class="gdTd1">판매자ID 필수(12)</td>
						<td class="gdTd2"><input class="inpWidth" name="gd_sellerid" value="${sessionScope.loginSeller.sl_id}" readonly></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<br>
	<div align="center">
		<!-- 실제 값이 담겨져서 넘어갈 textarea 태그 -->
		<input type="button" id="save_button" value="상품등록" onclick="saveContent();"/>
	</div>
	<br><br><br><br><br><br>
</form>
</section>
</section>
</body>
