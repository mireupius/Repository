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

		$("#select").click(function() {
			$("#message").text($("#select").val());
		});

	});
</script>
</head>
<body>

	<div class="cart_section">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="cart_container">
						<div class="cart_title">Shopping Cart</div>
						<div class="cart_items">
							<ul class="cart_list">
							
								<li class="cart_item clearfix">
									<div class="cart_item_image">
										<img src="resources/css/sale/test.png" alt="">
									</div>
									<div
										class="cart_item_info d-flex flex-md-row flex-column justify-content-between">
										<div class="cart_item_name cart_info_col">
											<div class="cart_item_title">Name</div>
											<div class="cart_item_text">
												MacBook Air 13 <input name="sd_product_name" value="머리핀">
												<input name="sd_out_area" value="중림동"> <input
													name="sd_product_no" value="123456"> <input
													name="sd_seller_id" value="aaaa">
											</div>
											<div class="cart_item_title">
												옵션 : 레드 (+1000) <input name="sd_option_info" value="레드">
												<input name="sd_option_price" value=2000>
											</div>
										</div>
										<div class="cart_item_color cart_info_col">
											<div class="cart_item_title">Delivery Cost</div>
											<div class="cart_item_text">
												$9000 <input name="sd_delivery_cost" value="2500">
											</div>
										</div>
										<div class="cart_item_quantity cart_info_col">
											<div class="cart_item_title">Quantity</div>
											<div class="cart_item_text">
												1 <input name="sd_amount" value=1>
											</div>
										</div>
										<div class="cart_item_price cart_info_col">
											<div class="cart_item_title">Sale Price</div>
											<div class="cart_item_text">
												$2000 <input name="sd_product_price" value=2000> <input
													name="sd_product_sellprice" value=1500>
											</div>
										</div>
										<div class="cart_item_total cart_info_col">
											<div class="cart_item_title">Total</div>
											<div class="cart_item_text">
												$2000 <input name="sd_total_price" value=50500>
											</div>
										</div>
									</div>
								</li>
							
							
								<li class="cart_item clearfix">
									<div class="cart_item_image">
										<img src="resources/css/sale/test.png" alt="">
									</div>
									<div
										class="cart_item_info d-flex flex-md-row flex-column justify-content-between">
										<div class="cart_item_name cart_info_col">
											<div class="cart_item_title">Name</div>
											<div class="cart_item_text">
												MacBook Air 13 <input name="sd_product_name" value="머리핀">
												<input name="sd_out_area" value="중림동"> <input
													name="sd_product_no" value="123456"> <input
													name="sd_seller_id" value="aaaa">
											</div>
											<div class="cart_item_title">
												옵션 : 레드 (+1000) <input name="sd_option_info" value="레드">
												<input name="sd_option_price" value=2000>
											</div>
										</div>
										<div class="cart_item_color cart_info_col">
											<div class="cart_item_title">Delivery Cost</div>
											<div class="cart_item_text">
												$9000 <input name="sd_delivery_cost" value="2500">
											</div>
										</div>
										<div class="cart_item_quantity cart_info_col">
											<div class="cart_item_title">Quantity</div>
											<div class="cart_item_text">
												1 <input name="sd_amount" value=1>
											</div>
										</div>
										<div class="cart_item_price cart_info_col">
											<div class="cart_item_title">Sale Price</div>
											<div class="cart_item_text">
												$2000 <input name="sd_product_price" value=2000> <input
													name="sd_product_sellprice" value=1500>
											</div>
										</div>
										<div class="cart_item_total cart_info_col">
											<div class="cart_item_title">Total</div>
											<div class="cart_item_text">
												$2000 <input name="sd_total_price" value=50500>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>

						<!-- Order Total -->
						<div class="order_total">
							<div class="order_total_content text-md-right">
								<div class="order_total_title">Order Total:</div>
								<div class="order_total_amount">$2000</div>
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

						<form action="#" id="contact_form">

							<div class="footer_phone">구매자 정보</div>
							<div
								class="contact_form_inputs d-flex flex-md-row flex-column justify-content-between align-items-between">
								<input type="text" id="contact_form_name"
									class="contact_form_name input_field" placeholder="구매자 이름"
									required="required" data-error="Name is required."> <input
									type="text" id="contact_form_name"
									class="contact_form_name input_field" placeholder="구매자 연락처"
									required="required" data-error="Name is required.">
							</div>

							<div class="footer_phone">수취인 정보</div>
							<div
								class="contact_form_inputs d-flex flex-md-row flex-column justify-content-between align-items-between">
								<input type="text" id="contact_form_name"
									class="contact_form_name input_field" placeholder="수취인명"
									required="required" data-error="Name is required."> <input
									type="text" id="contact_form_email"
									class="contact_form_email input_field" placeholder="수취인 연락처"
									required="required" data-error="Email is required.">
							</div>

							<div class="footer_phone">배송지 정보</div>
							<div
								class="contact_form_inputs d-flex flex-md-row flex-column justify-content-flex-start align-items-between">
								<input type="text" id="postno"
									class="contact_form_name input_field adressNo"
									placeholder="우편번호" required="required"
									data-error="Name is required." readonly="readonly">
								<button type="button" class="button cart_button_checkout"
									id="adress">우편번호 찾기</button>


							</div>

							<div class="contact_form_text">
								<textarea id="take_area" class="text_field contact_form_message"
									name="message" rows="4" placeholder="주소입력" required="required"
									data-error="Please, write us a message." readonly="readonly"></textarea>
							</div>
							<div class="contact_form_text">
								<textarea id="take_area_detail"
									class="text_field contact_form_message" name="message" rows="4"
									placeholder="주소를 먼저 입력하세요" required="required"
									data-error="Please, write us a message." id="take_area_detail"
									readonly="readonly"></textarea>
							</div>


							<div class="footer_phone">배송메세지</div>
							<div class="contact_form_text">
								<textarea id="message" class="text_field contact_form_message"
									name="message" rows="4" name="so_message"
									placeholder="배송메세지 입력"></textarea>
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
								<label class="custom-select"> <select id="select">
										<option selected hidden>선택해주세요</option>
										<option>신용카드</option>
										<option>계좌이체</option>
										<option>무통장입금</option>
								</select>
								</label>
							</div>

							<div
								class="contact_form_inputs d-flex flex-md-row flex-column justify-content-center align-items-center">

								<input type="submit" class="button cart_button_checkout" value="구매하기" id="goBuyBtn">
							</div>




						</form>

					</div>
				</div>
			</div>
		</div>


	</div>











	<form method="post" action="buying.do">





		<table border="1">


			<tr>
				<td>구매자명</td>
				<td><input name="so_customer_name"></td>
			</tr>
			<tr>
				<td>구매자 연락처</td>
				<td><input name="so_customer_ph"></td>
			</tr>
			<tr>
				<td>수령인</td>
				<td><input name="so_taker_name"></td>
			</tr>
			<tr>
				<td>수령인 연락처</td>
				<td><input name="so_taker_phone"></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><input name="so_postno" id="postno" readonly="readonly"></td>
				<td><button id="adress" type="button">우편번호 검색</button></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input name="so_take_area" id="take_area"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td><input name="so_take_area_detail" id="take_area_detail"
					readonly="readonly" placeholder="우편번호를 입력하세요"></td>
			</tr>

			<tr>
				<td>결제방식</td>
				<td><input type="radio" class="contact_form_name input_field"
					name="so_pay_method" value="신용카드">신용카드 <input type="radio"
					class="contact_form_name input_field" name="so_pay_method"
					value="계좌이체">계좌이체 <input type="radio"
					class="contact_form_name input_field" name="so_pay_method"
					value="무통장입금">무통장입금</td>
			</tr>
			<tr>
				<td>배송메세지</td>
				<td><select id="select">
						<option selected hidden>선택해주세요</option>
						<option>부재시 경비실에 <span>맡겨주세요</span></option>
						<option>부재시 <span> 연락주세요 </span></option>
						<option>부재시 <span> 문앞에 놔주세요</span></option>
				</select> <input id="message" name="so_message"></td>
			</tr>

			<tr>
				<td colspan="3"><input type="submit" value="결제하기"></td>
			</tr>

		</table>
	</form>
	</div>
</body>
</html>