<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap4/bootstrap.min.css">
<link
	href="resources/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="resources/css/cart_styles.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/cart_responsive.css">
</head>
<body>

	<div class="super_container">

		<!-- Cart -->

		<div class="cart_section">
			<form method="post" action="buyingFormBarsket.go">
				<div class="container">
					<div class="row">
						<div class="col-lg-10 offset-lg-1">
							<div class="cart_container">
								<div class="cart_title">장바구니</div>

								<div class="cart_items">
									<ul class="cart_list">
										<!-- 							장바구니 합계 가격 담는 orderTotal변수 초기화 -->
										<c:set var="orderTotal" value="0" />
										<c:forEach var="list" items="${cartItems }">
											<li class="cart_item clearfix"><input type="hidden"
												style="display: none;" value="${list.sb_no }">
												<div class="cart_item_image">
													<img
														src="${pageContext.request.contextPath}/upload/${list.gd_imgm}">
												</div>
												<div
													class="cart_item_info d-flex flex-md-row flex-column justify-content-between">
													<div class="cart_item_name cart_info_col">
														<div class="cart_item_title">Name</div>
														<div class="cart_item_text">${list.gd_name }</div>
													</div>
													<div class="cart_item_color cart_info_col">
														<div class="cart_item_title">Color</div>
														<div class="cart_item_text">${list.op_name }</div>
													</div>
													<div class="cart_item_price cart_info_col">
														<div class="cart_item_title">Price</div>
														<div id="price" class="cart_item_text">
														<fmt:formatNumber value="${list.gd_price+list.op_price}" pattern="#,###" />원
															</div>
													</div>
													<div class="cart_item_quantity cart_info_col">
														<div class="cart_item_title">Quantity</div>
														<div class="cart_item_text">${list.sb_quantity }</div>
													</div>
													<div class="cart_item_total cart_info_col">
														<div class="cart_item_title">Total</div>
														<div class="cart_item_text">
<%-- 														<fmt:formatNumber value="${(list.gd_price+list.op_price) * list.sb_quantity }" pattern="#,###"/>원 --%>
															<!-- 
																												orderTotal변수에 상품 총액 합 -->
															<c:set var="totalTest" value="${(list.gd_price+list.op_price) * list.sb_quantity }"/>
															<fmt:formatNumber value="${totalTest }" pattern="#,###"/>원
																												
															<c:set var="orderTotal"
																value="${orderTotal + (list.gd_price+list.op_price) * list.sb_quantity}" />
														</div>
													</div>
													<div class="cart_item_total cart_info_col">
														<button class="button delete_button" onclick="deleteCartItem(${list.sb_no})" type="button">삭제</button>
														<input name="sd_imageFileName" value="${list.gd_imgm}"
															type="hidden"> <input name="sd_product_name"
															value=${list.gd_name } type="hidden"> <input
															name="sd_product_sellprice" value=${list.gd_csmprice }
															type="hidden"> <input name="sd_amount"
															value=${list.sb_quantity } type="hidden"> <input
															name="sd_option_info" value="${list.op_name }"
															type="hidden"> <input name="sd_option_price"
															value="${list.op_price }" type="hidden"> <input
															name="sd_product_price" value="${list.gd_price }"
															type="hidden"> <input name="sd_total_price"
															value="${(list.gd_price+list.op_price) * list.sb_quantity + list.gd_dlvchrg}"
															type="hidden"> <input name="sd_product_no"
															value="${list.sb_gdno }" type="hidden"> <input
															name="sd_seller_id" value="${list.gd_sellerid }"
															type="hidden"> <input name="sd_out_area"
															value="${list.gd_outarea}" type="hidden"> <input
															name="sd_delivery_cost" value="${list.gd_dlvchrg}"
															type="hidden">
													</div>
												</div></li>
										</c:forEach>
									</ul>
								</div>

								<!-- Order Total -->
								<div class="order_total">
									<div class="order_total_content text-md-right">
										<div class="order_total_title">Order Total:</div>
										<!-- orderTotal출력 -->
										<div class="order_total_amount">
											<fmt:formatNumber value="${orderTotal }" pattern="#,###"/>원
										</div>
									</div>
								</div>

								<div class="cart_buttons">
									<button type="submit" class="button cart_button_checkout">구매하러
										가기</button>
								</div>
							</div>
						</div>

					</div>
				</div>
			</form>
		</div>

		<!-- Newsletter -->

		<div class="newsletter">
			<div class="container">
				<div class="row">
					<div class="col">
						<div
							class="newsletter_container d-flex flex-lg-row flex-column align-items-lg-center align-items-center justify-content-lg-start justify-content-center">
							<div class="newsletter_title_container">
								<div class="newsletter_icon">
									<img src="images/send.png" alt="">
								</div>
								<div class="newsletter_title">Sign up for Newsletter</div>
								<div class="newsletter_text">
									<p>...and receive %20 coupon for first shopping.</p>
								</div>
							</div>
							<div class="newsletter_content clearfix">
								<form action="#" class="newsletter_form">
									<input type="email" class="newsletter_input"
										required="required" placeholder="Enter your email address">
									<button class="newsletter_button">Subscribe</button>
								</form>
								<div class="newsletter_unsubscribe_link">
									<a href="#">unsubscribe</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="resources/css/bootstrap4/popper.js"></script>
	<script src="resources/css/bootstrap4/bootstrap.min.js"></script>
	<script src="resources/plugins/greensock/TweenMax.min.js"></script>
	<script src="resources/plugins/greensock/TimelineMax.min.js"></script>
	<script src="resources/plugins/scrollmagic/ScrollMagic.min.js"></script>
	<script src="resources/plugins/greensock/animation.gsap.min.js"></script>
	<script src="resources/plugins/greensock/ScrollToPlugin.min.js"></script>
	<script src="resources/plugins/easing/easing.js"></script>
	<script src="resources/js/cart_custom.js"></script>

</body>
</html>