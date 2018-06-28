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
<link rel="stylesheet" type="text/css"
	href="resources/css/cart_responsive.css">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="resources/js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$("#adress").click(function() {
			new daum.Postcode({
				oncomplete : function(data) {
					$("#postno").val(data.zonecode);
					$("#take_area").val(data.address);
					$("#take_area_detail").removeAttr("readonly");
					$("#take_area_detail").attr("placeholder", "상세주소를 입력해주세요");
				}
			}).open();
		});

		$("#select").click(function() {
			$("#message").val($("#select").val());
		});

	});
</script>
</head>
<body>
	<div class="blog_text">
		<form method="post" action="buying.do">



			<div class="cart_section">
				<div class="container">
					<div class="row">
						<div class="col-lg-10 offset-lg-1">
							<div class="cart_container">
								<div class="cart_title">Shopping Cart</div>
								<div class="cart_items">
									<ul class="cart_list">

										<!-- 구매상품목록 -->
										<li class="cart_item clearfix">
											<div
												class="cart_item_info d-flex flex-md-row flex-column justify-content-between">

												<div class="cart_item_image">
													<img src="resources/css/sale/test.png" alt="">
												</div>


												<div class="cart_item_name cart_info_col">
													<div class="cart_item_title">Name</div>
													<div class="cart_item_text">MacBook Air 13</div>
												</div>

												<div class="cart_item_price cart_info_col">
													<div class="cart_item_title">Price</div>
													<div class="cart_item_text">$2000</div>
												</div>

												<div class="cart_item_price cart_info_col">
													<div class="cart_item_title">Sale Price</div>
													<div class="cart_item_text">$1900</div>
												</div>

												<div class="cart_item_color cart_info_col">
													<div class="cart_item_title">option</div>
													<div class="cart_item_text">red</div>
												</div>

												<div class="cart_item_color cart_info_col">
													<div class="cart_item_title">option price</div>
													<div class="cart_item_text">$0</div>
												</div>

												<div class="cart_item_quantity cart_info_col">
													<div class="cart_item_title">Quantity</div>
													<div class="cart_item_text">1</div>
												</div>

												<div class="cart_item_price cart_info_col">
													<div class="cart_item_title">delivery</div>
													<div class="cart_item_text">$2500</div>
												</div>

												<div class="cart_item_total cart_info_col">
													<div class="cart_item_title">Total</div>
													<div class="cart_item_text">$2000</div>
												</div>
											</div>
										</li>

										<!-- 구매상품목록 끝 -->

									</ul>
								</div>
							</div>

							<!-- Order Total -->
							<div class="order_total">
								<div class="order_total_content text-md-right">
									<div class="order_total_title">Order Total:</div>
									<div class="order_total_amount">$2000</div>
								</div>
							</div>

							<div class="cart_buttons">
								<button type="button" class="button cart_button_clear">Add
									to Cart</button>
								<button type="button" class="button cart_button_checkout">Add
									to Cart</button>
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>






	<table border="1">
		<tr>
			<th>배송비</th>

			<th>상품명</th>
			<th>옵션종류</th>
			<th>옵션정보</th>
			<th>수량(구입수량)</th>
			<th>옵션가격</th>
			<th>상품가격</th>
			<th>판매가격</th>
			<th>상품별 총 주문금액</th>
		<tr>
		<tr>
			<td><input name="sd_delivery_cost" value="2500"></td>
			<td><input name="sd_product_name" value="머리핀"></td>
			<td><input name="sd_option_info" value="레드"></td>
			<td><input name="sd_amount" value=1></td>
			<td><input name="sd_option_price" value=2000></td>
			<td><input name="sd_product_price" value=2000></td>
			<td><input name="sd_product_sellprice" value=1500></td>
			<td><input name="sd_total_price" value=50500></td>
			<td><input name="sd_out_area" value="중림동"> <input
				name="sd_product_no" value="123456" hidden> <input
				name="sd_seller_id" value="aaaa" hidden></td>
		<tr>
		<tr>
			<td><input name="sd_delivery_cost" value="2500"></td>
			<td><input name="sd_product_name" value="신발끈"></td>
			<td><input name="sd_option_info" value="레드"></td>
			<td><input name="sd_amount" value=1></td>
			<td><input name="sd_option_price" value=2000></td>
			<td><input name="sd_product_price" value=2000></td>
			<td><input name="sd_product_sellprice" value=1500></td>
			<td><input name="sd_total_price" value=50500></td>
			<td><input name="sd_out_area" value="갈월동"> <input
				name="sd_product_no" value="123456" hidden> <input
				name="sd_seller_id" value="xxxx" hidden></td>
		<tr>
		<tr>
			<td><input name="sd_delivery_cost" value="2500"></td>

			<td><input name="sd_product_name" value="머리핀2"></td>
			<td><input name="sd_option_info" value="레드"></td>
			<td><input name="sd_amount" value=1></td>
			<td><input name="sd_option_price" value=2000></td>
			<td><input name="sd_product_price" value=2000></td>
			<td><input name="sd_product_sellprice" value=1500></td>
			<td><input name="sd_total_price" value=50500></td>
			<td><input name="sd_out_area" value="갈월동"> <input
				name="sd_product_no" value="122222" hidden> <input
				name="sd_seller_id" value="aaaa" hidden></td>
		<tr>
	</table>


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
			<td><input type="radio" name="so_pay_method" value="신용카드">신용카드
				<input type="radio" name="so_pay_method" value="계좌이체">계좌이체 <input
				type="radio" name="so_pay_method" value="무통장입금">무통장입금</td>
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