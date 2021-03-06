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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/goods/goodsView.js" ></script>

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
.tdFont{
	font-size: 11pt;
}
</style>

</head>
<body>
<section id="main-content">
<section class="wrapper">
<form name="tx_editor_form" id="tx_editor_form" action="goodsUpdate.do" method="post" accept-charset="utf-8" encType=multipart/form-data>
	<div class="gdTb3" data-toggle="collapse" href="#collapse1"
		aria-expanded="false" aria-controls="collapse1">
		<h3>표시설정</h3>
	</div>
	<div class="collapse in" id="collapse1">
		<div>
			<table class="gdTb3">
				<tbody>
					<tr>
						<td class="gdTd1 tdFont">상품분류 선택 필수</td>
						<td class="gdTd2 tdFont">
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
								<span id="category_select1" >${gdViewCtg[0].ct_clfname}&nbsp;>&nbsp;</span>
								<span id="category_select2" >${gdViewCtg[1].ct_clfname}<c:if test="${gdViewCtg[2].ct_clfname != null}">&nbsp;>&nbsp;</c:if></span>
								<span id="category_select3" >${gdViewCtg[2].ct_clfname}</span>
								<input id="ctgry1" name="gd_clfl" type="hidden" value="${gdsView.gd_clfl}">
								<input id="ctgry2" name="gd_clfm" type="hidden" value="${gdsView.gd_clfm}">
								<input id="ctgry3" name="gd_clfs" type="hidden" value="${gdsView.gd_clfs}">
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
						<td class="gdTd1 tdFont">상품번호</td>
						<td class="gdTd2 tdFont">
							<input name="gd_no" value="${gdsView.gd_no}" readonly>
							<input name="gt_no" value="${gdsView.gt_no}" type="hidden">
						</td>
					</tr>
					<tr>
						<td class="gdTd1 tdFont">상품명 필수(20)</td>
						<td class="gdTd2 tdFont"><input name="gd_name" value="${gdsView.gd_name}" maxlength="20"></td>
					</tr>
					<tr>
						<td class="gdTd1 tdFont">모델명(20)</td>
						<td class="gdTd2 tdFont"><input name="gt_mdlname" value="${gdsView.gt_mdlname}" maxlength="20"></td>
					</tr>
					<tr>
						<td class="gdTd1 tdFont">상품상세설명 필수</td>
						<td class="gdTd2 tdFont">
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
						<td class="gdTd1 tdFont">검색어설정(40)</td>
						<td class="gdTd2 tdFont"><input name="gt_keyword" value="${gdsView.gt_keyword}" maxlength="40"></td>
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
						<td class="gdTd1 tdFont">소비자가 필수(7)</td>
						<td class="gdTd2 tdFont"><input name="gd_csmprice" value="${gdsView.gd_csmprice}" maxlength="7"></td>
					</tr>
					<tr>
						<td class="gdTd1 tdFont">판매가 필수(7)</td>
						<td class="gdTd2 tdFont"><input name="gd_price" value="${gdsView.gd_price}" maxlength="7"></td>
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
						<td class="gdTd1 tdFont">옵션명 필수(20)</td>
						<td class="gdTd2 tdFont" rowspan="3" >
						<div>
						<ul class="opUl">
						<c:if test="${gdsOp.size() > 0}">
						<c:forEach var="h" begin="0" end="${gdsOp.size()-1}" step="1">
							<li class="opTb" id="opLi${h}">
								<span>
									<input class="inpWidth" name="op_name${h}" value="${gdsOp[h].op_name}" maxlength="20">
									<input type="hidden" name="op_no${h}" value="${gdsOp[h].op_no}">
								</span><br>
								<span>
									<input class="inpWidth" name="op_price${h}" value="${gdsOp[h].op_price}" maxlength="7">
								</span><br>
								<span>
									<input class="inpWidth" name="op_stock${h}" value="${gdsOp[h].op_stock}" maxlength="4">
								</span>
							</li>
							<li class="opChkLi"  id="ch${h}"><input type="checkbox" name="opChk" value="${gdsOp[h].op_no}"></li>
						</c:forEach>
						</c:if>
						</ul>
						</div>
						<input name="opl_no" type="hidden">
						<input name="opl_name" type="hidden">
						<input name="opl_price" type="hidden">
						<input name="opl_stock" type="hidden">
						</td>
					</tr>
					<tr>
						<td class="gdTd1 tdFont">옵션가격 필수(7)</td>
					</tr>
					<tr>
						<td class="gdTd1 tdFont">옵션재고 필수(4)</td>
					</tr>
					<tr>
						<td class="gdTd1"></td>
						<td class="gdTd2">
							<span class="opTbr">
								<button id="opPlus">입력칸 추가</button>
							</span>
							<span class="opTbr" onclick="opBoxDelete();">
								<button id="opDelete" >입력칸 삭제</button>
							</span>
							<span class="opTbr" onclick="opDelete();">
								<button id="opDelete" >옵션 삭제</button>
							</span>
						</td>
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
						<td class="gdTd1 tdFont" rowspan="2">이미지 등록 필수</td>
						<td class="gdTd2 tdFont">
							<div>
								<ul>
									<li class="liImg">
										<span>상세이미지</span><br>
										<span>권장 470px * 470px</span><br>
										<span>
											<img id="img1" src="${pageContext.request.contextPath}/upload/${gdsView.gd_imgl}" width="108" height="108" >
										</span>
									</li>
									<li class="liImg">
										<span>목록 이미지</span><br>
										<span>권장 236px * 236px</span><br>
										<span>
											<img id="img2" src="${pageContext.request.contextPath}/upload/${gdsView.gd_imgm}" width="108" height="108" >
										</span>
									</li>
									<li  class="liImg">
										<span>작은목록 이미지</span><br>
										<span>권장 115px * 115px</span><br>
										<span>
											<img id="img3"  src="${pageContext.request.contextPath}/upload/${gdsView.gd_imgs}" width="108" height="108"  >
										</span>
									</li>
									<li class="liImg">
										<span>축소 이미지</span><br>
										<span>권장 70px * 70px</span><br>
										<span>
											<img id="img4" src="${pageContext.request.contextPath}/upload/${gdsView.gd_imgss}" width="108" height="108" >
										</span>
									</li>
								</ul>
							</div><br>
						</td>
					</tr>
					<tr>
						<td class="gdTd2 tdFont">
							<span>
								<input type="file" id="input_img" name="gd_file1">
								<input type="hidden"  name="gd_file2" >
								<input type="hidden"  name="gd_file3">
								<input type="hidden"  name="gd_file4">
								<input type="hidden"  name="gd_imgl" value="${gdsView.gd_imgl}">
								<input type="hidden"  name="gd_imgm" value="${gdsView.gd_imgm}">
								<input type="hidden"  name="gd_imgs" value="${gdsView.gd_imgs}">
								<input type="hidden"  name="gd_imgss" value="${gdsView.gd_imgss}">
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
						<td class="gdTd1 tdFont">제조사(20)</td>
						<td class="gdTd2 tdFont"><input name="gt_maker" value="${gdsView.gt_maker}" maxlength="20"></td>
					</tr>
					<tr>
						<td class="gdTd1 tdFont">브랜드(20)</td>
						<td class="gdTd2 tdFont"><input name="gt_brand" value="${gdsView.gt_brand}" maxlength="20"></td>
					</tr>
					<tr>
						<td class="gdTd1 tdFont">제조일자(8)</td>
						<td class="gdTd2 tdFont"><input name="gt_mfd" value="${gdsView.gt_mfd}" maxlength="8"></td>
					</tr>
					<tr>
						<td class="gdTd1 tdFont">유효기간(8)</td>
						<td class="gdTd2 tdFont"><input name="gt_exp" value="${gdsView.gt_exp}" maxlength="8"></td>
					</tr>
					<tr>
						<td class="gdTd1 tdFont">소재(20)</td>
						<td class="gdTd2 tdFont"><input name="gt_material" value="${gdsView.gt_material}" maxlength="20"></td>
					</tr>
					<tr>
						<td class="gdTd1 tdFont">전체중량(kg)(20)</td>
						<td class="gdTd2 tdFont"><input name="gt_weight" value="${gdsView.gt_weight}" maxlength="20"></td>
					</tr>
					<tr>
						<td class="gdTd1 tdFont">부피(cm)(20)</td>
						<td class="gdTd2 tdFont"><input name="gt_volume" value="${gdsView.gt_volume}" maxlength="20"></td>
					</tr>
					<tr>
						<td class="gdTd1 tdFont">원산지(20)</td>
						<td class="gdTd2 tdFont"><input name="gt_origin" value="${gdsView.gt_origin}" maxlength="20"></td>
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
						<td class="gdTd1 tdFont">배송비 필수(20)</td>
						<td class="gdTd2 tdFont"><input name="gd_dlvchrg" value="${gdsView.gd_dlvchrg}" maxlength="20"></td>
					</tr>
					<tr>
						<td class="gdTd1 tdFont">출고지 필수(12)</td>
						<td class="gdTd2 tdFont"><input name="gd_outarea" value="${gdsView.gd_outarea}" maxlength="12"></td>
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
						<td class="gdTd1 tdFont">판매자ID 필수(12)</td>
						<td class="gdTd2 tdFont"><input name="gd_sellerid" value="${gdsView.gd_sellerid}" readonly></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<br>
	<div align="center">
		<!-- 실제 값이 담겨져서 넘어갈 textarea 태그 -->
		<input type="button" id="save_button" value="상품수정" onclick="saveContent();"/>
		<input type="button" id="delete_button" value="상품삭제" onclick="deleteGoods();"/>
	</div>
	<br><br><br><br><br><br>
</form>
</section>
</section>
</body>