<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>${goodsDtl1.gd_name } - SDmall</title>
<link rel="stylesheet" type="text/css" href="resources/css/product_styles.css">
<link rel="stylesheet" type="text/css" href="resources/css/product_responsive.css">

<script src="resources/js/product_custom.js"></script>
</head>

<body>

<div class="super_container">

	<!-- Single Product -->

	<div class="single_product">
		<div class="container">
			<div class="row">


				<!-- Selected Image -->
				<div class="col-lg-7 order-lg-3 order-1">
					<div class="image_selected"><img src="${pageContext.request.contextPath}/upload/${goodsDtl1.gd_imgl}"></div>
				</div>

				<!-- Description -->
				<div class="col-lg-5 order-3">
					<div class="product_description">
						<div class="product_category">
						<c:forEach var="goodsCategory" items="${allCategory}">
							<c:if test="${goodsDtl1.gd_clfl==goodsCategory.ct_no }">
								<a href="shop.Category?ct_no=${goodsDtl1.gd_clfl }">${goodsCategory.ct_clfname }</a>
							</c:if>
							<c:if test="${goodsDtl1.gd_clfm==goodsCategory.ct_no }">
								 > <a href="shop.Category?ct_no=${goodsDtl1.gd_clfm }">${goodsCategory.ct_clfname }</a>
							</c:if>
							<c:if test="${goodsDtl1.gd_clfs==goodsCategory.ct_no }">
								 > <a href="shop.Category?ct_no=${goodsDtl1.gd_clfs }">${goodsCategory.ct_clfname }</a>
							</c:if>
						</c:forEach>
						</div>
						<div class="product_name">${goodsDtl1.gd_name }</div>
						<div class="product_price"><fmt:formatNumber value="${goodsDtl1.gd_price }" pattern="#,###" />원</div>
						<div class="rating_r rating_r_4 product_rating"><i></i><i></i><i></i><i></i><i></i></div>
						<div class="product_text">
						<c:set var="dlvchrg" value="${fn:split(goodsDtl1.gd_dlvchrg, ',') }"/>
						<input type="hidden" id="chrg" value="${dlvchrg[0]}"> 
						<input type="hidden" id="terms" value="${dlvchrg[1]}"> 
						<c:choose>
							<c:when test="${dlvchrg[0]==0}">
							무료배송
							</c:when>
							<c:otherwise>
							<p>배송비 <fmt:formatNumber value="${dlvchrg[0]}" pattern="#,###" />원</p>
							<c:if test="${dlvchrg[1]>0}">
							<p><fmt:formatNumber value="${dlvchrg[1]}" pattern="#,###" />원 이상 구매시 무료 배송</p>
							</c:if>
							</c:otherwise>
						</c:choose>
						</div>
						<div class="order_info d-flex flex-row">
<!-- 							장바구니 form -->
							<form action="cart.add" method="get">
								<div class="clearfix" style="z-index: 1000;">
									<!-- Product Quantity -->
									<div class="product_quantity clearfix">
										<span>수량: </span>
										<input id="quantity_input" type="text" pattern="[0-9]*" value="1" name="sb_quantity" onchange="overQuantity()">
										<div class="quantity_buttons">
											<div id="quantity_inc_button" class="quantity_inc quantity_control"><i class="fas fa-chevron-up"></i></div>
											<div id="quantity_dec_button" class="quantity_dec quantity_control"><i class="fas fa-chevron-down"></i></div>
										</div>
									</div>
										<label class="custom-select" for="styledSelect1">
											<select id="styledSelect1" name="sb_opno" onchange="opChange()">
												<c:forEach var="o" items="${option}">
												<option value="${o.op_no }">${o.op_name } (+${o.op_price }) / ${o.op_stock }</option>
												</c:forEach>
											</select>
										</label>
								</div>
								<div id="view_total_price" class="product_price">${goodsDtl1.gd_price }</div>
							<div class="button_container">
								<input type="hidden" name="sb_gdno" value="${goodsDtl1.gd_no }">
								<button class="button cart_button">장바구니 추가</button>
<!-- 									<div class="product_fav"><i class="fas fa-heart"></i></div> -->
							</form>
							
<!-- 							즉시구매 form -->
							<form action="buying.go" method="post">
								<input type="hidden" name="sd_imageFileName" value="${goodsDtl1.gd_imgs }">
								<input type="hidden" id="send_dlvchrg" name="sd_delivery_cost" value="${goodsDtl1.gd_dlvchrg }">
								<input type="hidden" name="sd_product_name" value="${goodsDtl1.gd_name }">
								<input type="hidden" id="send_option_name" name="sd_option_info">
								<input type="hidden" id="send_quantity" name="sd_amount">
								<input type="hidden" id="send_option_price" name="sd_option_price">
								<input type="hidden" id="send_price" name="sd_product_price" value="${goodsDtl1.gd_price }">
								<input type="hidden" name="sd_product_sellprice" value="${goodsDtl1.gd_csmprice }">
								<input type="hidden" id = "send_total_price" name="sd_total_price">
								<input type="hidden" name="sd_out_area" value="${goodsDtl1.gd_outarea }">
								<input type="hidden" name="sd_product_no" value="${goodsDtl1.gd_no }">
								<input type="hidden" name="sd_seller_id" value="${goodsDtl1.gd_sellerid }">
								<button class="button buy_button"> 구 매 </button>
							</form>
							
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 	상품 상세정보 영역 -->
	<div class="container goods_content">
		<div class="row">
		${goodsDtl2.gt_detail }
		</div>	
	</div>


</body>

</html>
