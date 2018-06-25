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
<script type="text/javascript">
function saveContent() {
    Editor.save(); // 이 함수를 호출하여 글을 등록하면 된다.
}

var opN = 1;// 옵션 항목 눌렀을 경우 추가되는 name의 번호

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
						$("#category_select1").text(clfname + ">");
						var input = $("#ctgry1").val(cn);
		                input.attr("name", "gd_clfl");
					});
				
				}else{
				
					// 카테고리 선택 표시 영역
					$("#category_select1").text(clfname + ">");
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
						$("#category_select2").text(clfname + ">");
						var input = $("#ctgry2").val(cn);
		                input.attr("name", "gd_clfm");
		                
					});
				}else{
					// 카테고리 선택 표시 영역
					$("#category_select2").text(clfname + ">");
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
		$("#category_select3").text(clfname + ">");
		var input = $("#ctgry3").val(cn);
        input.attr("name", "gd_clfs");
	});
	
	// ★★★★★★★★★★★★★옵션값 배열로 저장 input hidden으로 넘기기★★★★★★★★★★★★★★★
	$(document).on("click","#opPlus",function(){
alert("d");
		
		var opInputN = $("<input>").attr("class","inpWidth").attr("name", "op_name");
		var opSpanN = $("<span></span><br>").append(opInputN);
		
		var opInputP = $("<input>").attr("class","inpWidth").attr("name", "op_price");
		var opSpanP = $("<span></span><br>").append(opInputP);
		
		var opInputS = $("<input>").attr("class","inpWidth").attr("name", "op_stock"+opN);
		var opSpanS = $("<span></span><br>").append(opInputS);

		var opLi = $("<li></li>").attr("class","opTb").append(opSpanN, opSpanP, opSpanS);
		$("#opUl").append(opLi);
	});
	
	// ★★★★★★★★★★★★★옵션값 배열로 저장 input hidden으로 넘기기★★★★★★★★★★★★★★★
	
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
<form name="tx_editor_form" id="tx_editor_form" action="registration.do" method="post" accept-charset="utf-8" encType=multipart/form-data>
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
						<td class="gdTd2"><input name="gd_name"></td>
					</tr>
					<tr>
						<td class="gdTd1">모델명(20)</td>
						<td class="gdTd2"><input name="gt_mdlname"></td>
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
						<td class="gdTd1">검색어설정</td>
						<td class="gdTd2"><input name="gt_keyword"></td>
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
						<td class="gdTd2"><input name="gd_csmprice"></td>
					</tr>
					<tr>
						<td class="gdTd1">판매가 필수(7)</td>
						<td class="gdTd2"><input name="gd_price"></td>
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
						<input class="inpWidth" name="op_name" type="hidden">
						<input class="inpWidth" name="op_price" type="hidden">
						<input class="inpWidth" name="op_stock" type="hidden">
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
										<span>권장 500px * 500px</span><br>
										<span>
											<img id="img1" src="//img.echosting.cafe24.com/thumb/108x108_2.gif" width="108" height="108" >
										</span>
									</li>
									<li class="liImg">
										<span>목록 이미지</span><br>
										<span>권장 300px * 300px</span><br>
										<span>
											<img id="img2" src="//img.echosting.cafe24.com/thumb/108x108_2.gif" width="108" height="108" >
										</span>
									</li>
									<li  class="liImg">
										<span>작은목록 이미지</span><br>
										<span>권장 220px * 220px</span><br>
										<span>
											<img id="img3"  src="//img.echosting.cafe24.com/thumb/108x108_2.gif" width="108" height="108"  >
										</span>
									</li>
									<li class="liImg">
										<span>축소 이미지</span><br>
										<span>권장 100px * 100px</span><br>
										<span>
											<img id="img4" src="//img.echosting.cafe24.com/thumb/108x108_2.gif" width="108" height="108" >
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
						<td class="gdTd2"><input name="gt_maker"></td>
					</tr>
					<tr>
						<td class="gdTd1">브랜드(20)</td>
						<td class="gdTd2"><input name="gt_brand"></td>
					</tr>
					<tr>
						<td class="gdTd1">제조일자(20)</td>
						<td class="gdTd2"><input name="gt_mfd"></td>
					</tr>
					<tr>
						<td class="gdTd1">유효기간(20)</td>
						<td class="gdTd2"><input name="gt_exp"></td>
					</tr>
					<tr>
						<td class="gdTd1">상품소재(20)</td>
						<td class="gdTd2"><input name="gt_material"></td>
					</tr>
					<tr>
						<td class="gdTd1">상품 전체중량(kg)(20)</td>
						<td class="gdTd2"><input name="gt_weight"></td>
					</tr>
					<tr>
						<td class="gdTd1">상품부피(cm)(20)</td>
						<td class="gdTd2"><input name="gt_volume"></td>
					</tr>
					<tr>
						<td class="gdTd1">원산지(20)</td>
						<td class="gdTd2"><input name="gt_origin"></td>
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
						<td class="gdTd2"><input name="gd_dlvchrg"></td>
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
						<td class="gdTd2"><input name="gd_sellerid"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<br>
	<div align="center">
		<!-- 실제 값이 담겨져서 넘어갈 textarea 태그 -->
		<input type="button" id="save_button" value="내용전송" onclick="saveContent();"/>
	</div>
	<br><br><br><br><br><br>
</form>
</section>
</section>
</body>
