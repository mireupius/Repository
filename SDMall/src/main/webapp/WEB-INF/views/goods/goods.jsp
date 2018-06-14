<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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


$(function(){
	

	$(".ct1").click(function() {
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
				$.each(ar, function(i, c){
					var fname = $("<li></li>").text(c.ct_clfname);
					fname.attr("class","ct2");
					fname.attr("category_num", c.ct_no);
					$("#ct12").append(fname);
					
					$("#category_select").text(clfname + ">");
				}); 
			}
		});
	});
	// 동적으로 생성된 태그에 이벤트 주기 $(document).on("click",".ct2",function(){
	$(document).on("click",".ct2",function(){
		var cn = $(this).attr("category_num");
		var clf = "3";
		$.ajax({
			url : "category.get",
			data : {ct_no : cn, ct_clf : clf},
			success : function(json) {
				var ar = json.category;
				$("#ct13").empty();
				$.each(ar, function(i, c){
					var fname = $("<li></li>").text(c.ct_clfname);
					$("#ct13").append(fname);
				}); 
			}
		});
	});
	
});

</script>

<title>Goods</title>
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
<form name="tx_editor_form" id="tx_editor_form"
	action="editor.do" method="post"
	accept-charset="utf-8">
	<div class="gdTb3" data-toggle="collapse" href="#collapse1"
		aria-expanded="false" aria-controls="collapse1">
		<h3>표시설정</h3>
	</div>
	<div class="collapse" id="collapse1">
		<div>
			<table class="gdTb3">
				<tbody>
					<tr>
						<td class="gdTd1">상품분류 선택</td>
						<td class="gdTd2">
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
							</table> <br> <br> <br>
							
							<div id="category_select"></div>
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
	<div class="collapse" id="collapse2">
		<div>
			<table class="gdTb3">
				<tbody>
					<tr>
						<td class="gdTd1">상품명</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">상품코드</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">모델명</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">상품상세설명</td>
						<td class="gdTd2">
							<!-- 에디터 시작 -->
							<div>
<!-- 								<form name="tx_editor_form" id="tx_editor_form"
									action="editor.do" method="post"
									accept-charset="utf-8"> -->
								
									<!-- 에디터프레임호출 영역 -->
									<div id="editor_frame">
										<!-- 다음에디터 넣기 -->
										<jsp:include page="../daumeditor/editor.jsp"></jsp:include>
										<script type="text/javascript">
											//'수정하기' 모드일 때, 다음과 같이 데이터를 다음오픈에디터에 대입할 수 있다.
											if ('${board!=null}' == 'true')
												Editor.modify({'content' : '${board.daumcontent}'});
										</script>


gt_no	<input name ="gt_no">	<br>
gt_gdno	<input name ="gt_gdno">	<br>
gt_mdlname   	<input name ="gt_mdlname">	<br>
gt_maker     	<input name ="gt_maker">	<br>
gt_brand     	<input name ="gt_brand">	<br>
gt_mfd       	<input name ="gt_mfd">	<br>
gt_exp       	<input name ="gt_exp">	<br>
gt_material  	<input name ="gt_material">	<br>
gt_weight    	<input name ="gt_weight">	<br>
gt_volume    	<input name ="gt_volume">	<br>
gt_origin    	<input name ="gt_origin">	<br>
gt_stock     	<input name ="gt_stock">	<br>
gt_keyword   	<input name ="gt_keyword">	<br>


									</div>

<!-- 									실제 값이 담겨져서 넘어갈 textarea 태그
									<input type="button" id="save_button" value="내용전송" onclick="saveContent();"/>
								</form> -->
							</div> <!-- 에디터 끝 -->
						</td>
					</tr>
					<tr>
						<td class="gdTd1">검색어설정</td>
						<td class="gdTd2"><input></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="gdTb3" data-toggle="collapse" href="#collapse3"
		aria-expanded="false" aria-controls="collapse3">
		<h3>판매정보</h3>
	</div>
	<div class="collapse" id="collapse3">
		<div>
			<table class="gdTb3">
				<tbody>
					<tr>
						<td class="gdTd1">소비자가</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">판매가</td>
						<td class="gdTd2"><input></td>
					</tr>
					
				</tbody>
			</table>
		</div>
	</div>
	<div class="gdTb3" data-toggle="collapse" href="#collapse4"
		aria-expanded="false" aria-controls="collapse4">
		<h3>옵션/재고</h3>
	</div>
	<div class="collapse" id="collapse4">
		<div>
			<table class="gdTb3">
				<tbody>
					<tr>
						<td class="gdTd1">옵션명</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">옵션가격</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">옵션재고</td>
						<td class="gdTd2"><input></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="gdTb3" data-toggle="collapse" href="#collapse5"
		aria-expanded="false" aria-controls="collapse5">
		<h3>이미지</h3>
	</div>
	<div class="collapse" id="collapse5">
		<div>
			<table class="gdTb3">
				<tbody>
					<tr>
						<td class="gdTd1">이미지 등록</td>
						<td class="gdTd2">
							<div>
								<ul>
									<li class="imgli"><span>상세이미지</span><br> <span>권장
											500px * 500px</span><br> <span><input type="file">
									</span></li>
									<li class="imgli"><span>목록 이미지</span><br> <span>권장
											300px * 300px</span><br></li>
									<li class="imgli"><span>작은목록 이미지</span><br> <span>권장
											100px * 100px</span><br></li>
									<li class="imgli"><span>축소 이미지</span><br> <span>권장
											220px * 220px</span><br></li>
								</ul>
							</div>
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
	<div class="collapse" id="collapse6">
		<div>
			<table class="gdTb3">
				<tbody>
					<tr>
						<td class="gdTd1">제조사</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">브랜드</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">제조일자</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">유효기간</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">상품소재</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">상품 전체중량(kg)</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">상품부피(cm)</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">원산지</td>
						<td class="gdTd2"><input></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="gdTb3" data-toggle="collapse" href="#collapse7"
		aria-expanded="false" aria-controls="collapse7">
		<h3>배송 정보</h3>
	</div>
	<div class="collapse" id="collapse7">
		<div>
			<table class="gdTb3">
				<tbody>
					<tr>
						<td class="gdTd1">배송비</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">무료조건가격</td>
						<td class="gdTd2"><input></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div align="center">
		<!-- 실제 값이 담겨져서 넘어갈 textarea 태그 -->
		<input type="button" id="save_button" value="내용전송" onclick="saveContent();"/>
	</div>
</form>
</body>