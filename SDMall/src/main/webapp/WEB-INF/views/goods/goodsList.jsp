<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/goods/goodsLst.css">
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
	<section id="main-content"> <section class="wrapper">
	<form name="tx_editor_form" id="tx_editor_form"
		action="registration.do" method="post" accept-charset="utf-8"
		encType=multipart/form-data>

		<table border="1" summary="" class="eChkColor">
			<colgroup>

				<div class="gdliTb3">
					<h3>&nbsp;&nbsp;&nbsp;&nbsp;</h3>
				</div>
				<div>
					<div>
						<table class="gdliTb3">
							<tbody>
								<tr>
									<td class="gdLstTd1">상품명 검색</td>
									<td class="gdLstTd2"><select class="fSelect eSearch"
										name="eField[]">
											<option value="product_name">상품명</option>
											<option value="eng_product_name">영문상품명</option>
											<option value="item_name">상품명(관리용)</option>
											<option value="purchase_prd_name">공급사 상품명</option>
											<option value="naver_ks_product_name">네이버쇼핑 상품명</option>
											<option value="">--------------------</option>
											<option value="product_no">상품번호</option>
											<option value="product_code">상품코드</option>
											<option value="ma_product_code">자체 상품코드</option>
											<option value="item_code">품목코드</option>
											<option value="admin_item_code">자체 품목코드</option>
											<option value="">--------------------</option>
											<option value="Manufacturer">제조사</option>
											<option value="Supplier">공급사</option>
											<option value="Brand">브랜드</option>
											<option value="Trend">트렌드</option>
											<option value="Classification">자체분류</option>
											<option value="">--------------------</option>
											<option value="model_name">모델명</option>
											<option value="origin">원산지</option>
											<option value="Condition">상품상태</option>
											<option value="product_tag">상품 검색태그</option>
											<option value="product_weight">상품 전체중량</option>
											<option value="">--------------------</option>
											<option value="pm_memo">메모</option>
											<option value="ins_user">등록아이디</option>
									</select> <input class="" name=""> <a href="#none"
										class="btnIcon icoMinus" search-type="general"><span>삭제</span></a>
										<a href="#none" class="btnIcon icoPlus" search-type="general"
										style=""><span>추가</span></a></td>
								</tr>
								<tr>
									<td class="gdLstTd1">상품분류</td>
									<td class="gdLstTd2"><span> <select
											class="fSelect category eCategory" id="eCategory1" depth="1"
											name="categorys[]">
												<option value="">- 대분류 선택 -</option>
												<option value="24">(대분류) Outerwear</option>
												<option value="25">(대분류) Tops</option>
												<option value="26">(대분류) Dresses</option>
												<option value="27">(대분류) Bottoms</option>
												<option value="28">(대분류) Accessories</option>
										</select>
									</span> <span> <select class="fSelect category eCategory"
											id="eCategory2" depth="2" name="categorys[]">
												<option value="">- 중분류 선택 -</option>
										</select>
									</span> <span> <select class="fSelect category eCategory"
											id="eCategory3" depth="3" name="categorys[]">
												<option value="">- 소분류 선택 -</option>
										</select>
									</span></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<div class="gdLstTb3">
					<h3>상품목록</h3>
				</div>
				<div>
					<div>
						<table class="gdLstTb3">
							<tbody>
								<tr>
									<td class="gdLstTd1">No</td>
									<td class="gdLstTd1">상품코드</td>
									<td class="gdLstTd1">상품명</td>
									<td class="gdLstTd1">판매가</td>
									<td class="gdLstTd1">소비자가</td>
								</tr>
								<c:forEach var="i" begin="0" end="${gdslist.size() }" >
									<tr>
										<td class="gdLstTd1">${i+1}</td>
										<td class="gdLstTd1">${gdslist[i].gd_no}</td>
										<td class="gdLstTd1"><img src="${pageContext.request.contextPath}/upload/${gdslist[i].gd_imgl}" width="44"
											height="44" alt=""></td>
										<td class="gdLstTd1">${gdslist[i].gd_price}</td>
										<td class="gdLstTd1">${gdslist[i].gd_csmprice}</td>
										</td>
									</tr>
								</c:forEach>
								<tr>
									<td><a href="#none" class="btnIcon icoMinus"
										search-type="general"><span>삭제</span></a> <a href="#none"
										class="btnIcon icoPlus" search-type="general" style=""><span>추가</span></a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<br>
				<br>
				<br>
				</form>
				</section>
				</section>
</body>
</html>