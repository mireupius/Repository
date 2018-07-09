<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="OneTech shop project">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css"
	href="resources/css/cart_styles.css">
<link rel="stylesheet" type="text/css" href="resources/css/buying.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/cart_responsive.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/contact_styles.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/contact_responsive.css">


<style type="text/css">
li input {
	display: none;
}
</style>

<script src="resources/js/contact_custom.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="resources/js/jquery.js"></script>
<script type="text/javascript">
	$(function() {

		$("#adress").click(function() {
			new daum.Postcode({
				oncomplete : function(data) {
					$("#postno").val(data.zonecode);
					$("#take_area").text(data.address);
					$("#take_area_detail").removeAttr("readonly");
					$("#take_area_detail").attr("placeholder", "상세주소를 입력해주세요");
				}
			}).open();
		});

		$("#message").text($("#select").val());

		$("#select").click(function() {
			$("#message").text($("#select").val());
		});

	});
</script>
</head>
<body>
	<form method="post" action="buying.do">
		<div class="cart_section">
			<div class="container">
				<div class="row">
					<div class="col-lg-10 offset-lg-1">
						<div class="cart_container">
							<div class="cart_title">Shopping Cart</div>
							<div class="cart_items">
								<ul class="cart_list">

									<c:forEach items="${products}" var="p">

										<li class="cart_item clearfix">
											<div class="cart_item_image">
												<img src="${pageContext.request.contextPath}/upload/${p.sd_imageFileName }" alt="">
											</div>
											<div
												class="cart_item_info d-flex flex-md-row flex-column justify-content-between">
												<div class="cart_item_name cart_info_col">
													<div class="cart_item_title">Name</div>
													<div class="cart_item_text">
														${p.sd_product_name } <input name="sd_product_name"
															value="${p.sd_product_name } "> <input
															name="sd_out_area" value="${p.sd_out_area }"> <input
															name="sd_product_no" value="${p.sd_product_no}">
														<input name="sd_seller_id" value="${p.sd_seller_id }">
													</div>
													<div class="cart_item_title">
														옵션 : ${p.sd_option_info } (+${p.sd_option_price }) <input
															name="sd_option_info" value="${p.sd_option_info }">
														<input name="sd_option_price" value=${p.sd_option_price }>
													</div>
												</div>
												<div class="cart_item_color cart_info_col">
													<div class="cart_item_title">Delivery Cost</div>
													<div class="cart_item_text">
														$${p.sd_delivery_cost } <input name="sd_delivery_cost"
															value=${p.sd_delivery_cost }>
													</div>
												</div>
												<div class="cart_item_quantity cart_info_col">
													<div class="cart_item_title">Quantity</div>
													<div class="cart_item_text">
														${p.sd_amount } <input name="sd_amount"
															value=${p.sd_amount }>
													</div>
												</div>
												<div class="cart_item_price cart_info_col">
													<div class="cart_item_title">Sale Price</div>
													<div class="cart_item_text">
														$${p.sd_product_price } <input name="sd_product_price"
															value=${p.sd_product_price }> <input
															name="sd_product_sellprice" value=1500>
													</div>
												</div>
												<div class="cart_item_total cart_info_col">
													<div class="cart_item_title">Total</div>
													<div class="cart_item_text">
														${p.sd_total_price } <input name="sd_total_price"
															value=${p.sd_total_price }>
													</div>
												</div>
											</div>
										</li>
									</c:forEach>

								</ul>
							</div>

							<!-- Order Total -->
							<div class="order_total">
								<div class="order_total_content text-md-right">
									<div class="order_total_title">Order Total:</div>
									<div class="order_total_amount">
										<c:forEach items="${products}" var="p">
											<c:set var="sum" value="${sum + p.sd_total_price}" />
										</c:forEach>
										$
										<c:out value="${sum }" />
									</div>
								</div>
							</div>


						</div>
					</div>
				</div>
			</div>
			<div class="container" id="deliveryInfo">
				<div class="row">
					<div class="col-lg-10 offset-lg-1">
						<div class="contact_form_container">
							<div class="contact_form_title">Delivery Info</div>


							<div class="footer_phone">구매자 정보</div>
							<div
								class="contact_form_inputs d-flex flex-md-row flex-column justify-content-between align-items-between">
								<input type="text" id="contact_form_name"
									class="contact_form_name input_field" placeholder="구매자 이름"
									required="required" 
									name="so_customer_name"> <input type="text"
									id="contact_form_name" class="contact_form_name input_field"
									placeholder="구매자 연락처" required="required"
									 name="so_customer_ph">
							</div>

							<div class="footer_phone">수취인 정보</div>
							<div
								class="contact_form_inputs d-flex flex-md-row flex-column justify-content-between align-items-between">
								<input type="text" id="contact_form_name"
									class="contact_form_name input_field" placeholder="수취인명"
									required="required" 
									name="so_taker_name"> <input type="text"
									id="contact_form_email" class="contact_form_email input_field"
									placeholder="수취인 연락처" required="required"
									 name="so_taker_phone">
							</div>

							<div class="footer_phone">배송지 정보</div>
							<div
								class="contact_form_inputs d-flex flex-md-row flex-column justify-content-flex-start align-items-between">
								<input type="text" id="postno"
									class="contact_form_name input_field adressNo"
									placeholder="우편번호" required="required"
									readonly="readonly"
									name="so_postno">
								<button type="button" class="button cart_button_checkout"
									id="adress" required="required" >우편번호 찾기</button>


							</div>

							<div class="contact_form_text">
								<textarea id="take_area" class="text_field contact_form_message"
									name="so_take_area" rows="4" placeholder="주소입력"
									required="required" data-error="Please, write us a message."
									readonly="readonly"></textarea>
							</div>
							<div class="contact_form_text">
								<textarea id="take_area_detail"
									class="text_field contact_form_message"
									name="so_take_area_detail" rows="4" placeholder="주소를 먼저 입력하세요"
									required="required" data-error="Please, write us a message."
									id="take_area_detail" readonly="readonly"></textarea>
							</div>


							<div class="footer_phone">배송메세지</div>
							<div class="contact_form_text">
								<textarea id="message" class="text_field contact_form_message"
									rows="4" name="so_message" placeholder="배송메세지 입력"></textarea>
							</div>
							<div
								class="contact_form_inputs d-flex flex-md-row flex-column justify-content-between align-items-between">
								<label class="custom-select"> <select id="select">
										<option selected hidden>배송메세지 입력</option>
										<option>부재시 경비실에 맡겨주세요</option>
										<option>부재시 연락주세요</option>
										<option>부재시 문앞에 놔주세요</option>
								</select>
								</label>
							</div>
							<div class="footer_phone">결제수단 선택</div>
							<div
								class="contact_form_inputs d-flex flex-md-row flex-column justify-content-between align-items-between">
								<label class="custom-select"> <select id="select"
									name="so_pay_method" required="required" >
										<option selected hidden>선택해주세요</option>
										<option>신용카드</option>
										<option>계좌이체</option>
										<option>무통장입금</option>
								</select>
								</label>
							</div>

							<div
								class="contact_form_inputs d-flex flex-md-row flex-column justify-content-center align-items-center">

								<input type="submit" class="button cart_button_checkout"
									value="구매하기" id="goBuyBtn">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>