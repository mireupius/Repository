<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<div id="searchDelivery" class="col-md-11">
		검색 : <input>
	</div>

	<div id="deliveryTableDiv" class="col-md-11">
		<table
			class="table table-hover table-striped table-bordered table-sm table-responsive"
			id="deliveryTable">
			<thead class="thead-dark">
				<tr>
					<th scope="col">상품주문번호</th>
					<th scope="col">주문번호</th>
					<th scope="col">택배사</th>
					<th scope="col">송장번호</th>
					<th scope="col">배송완료일</th>
					<th scope="col">구매자명</th>
					<th scope="col">구매자ID</th>
					<th scope="col">수취인명</th>
					<th scope="col">주문상태</th>
					<th scope="col">주문세부상태</th>
					<th scope="col">배송비</th>
					<th scope="col">상품번호</th>
					<th scope="col">상품명</th>
					<th scope="col">옵션종류</th>
					<th scope="col">옵션정보</th>
					<th scope="col">수량(구입수량)</th>
					<th scope="col">옵션가격</th>
					<th scope="col">상품가격</th>
					<th scope="col">판매가격</th>
					<th scope="col">상품별 총 주문금액</th>
					<th scope="col">발주확인일</th>
					<th scope="col">수취인연락처1</th>
					<th scope="col">배송지</th>
					<th scope="col">구매자연락처</th>
					<th scope="col">우편번호</th>
					<th scope="col">배송메세지</th>
					<th scope="col">출고지</th>
					<th scope="col">주문일시</th>
					<th scope="col">클레임상태</th>
					<th scope="col">결제수단</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="o" items="${orders }">
					<tr>
						<th scope="row">${o.shp_o_order_pnum}</th>
						<!--상품주문번호 -->
						<td>${o.shp_o_order_num}</td>
						<!--주문번호 -->
						<td>${o.shp_o_courier}</td>
						<!--택배사 -->
						<td>${o.shp_o_invoice_num}</td>
						<!--송장번호 -->
						<td>${o.shp_o_delivery_done_date}</td>
						<!--배송완료일 -->
						<td>${o.shp_o_customer_name}</td>
						<!--구매자명 -->
						<td>${o.shp_o_customer_id}</td>
						<!--구매자ID -->
						<td>${o.shp_o_taker_name}</td>
						<!--수취인명 -->
						<td>${o.shp_o_state}</td>
						<!--주문상태 -->
						<td>${o.shp_o_state_detail}</td>
						<!--주문세부상태 -->
						<td>${o.shp_o_delivery_cost}</td>
						<!--배송비 -->
						<td>${o.shp_o_product_num}</td>
						<!--상품번호 -->
						<td>${o.shp_o_product_name}</td>
						<!--상품명 -->
						<td>${o.shp_o_option_type}</td>
						<!--옵션종류 -->
						<td>${o.shp_o_option_info}</td>
						<!--옵션정보 -->
						<td>${o.shp_o_amount}</td>
						<!--수량(구입수량) -->
						<td>${o.shp_o_option_price}</td>
						<!--옵션가격 -->
						<td>${o.shp_o_product_price}</td>
						<!--상품가격 -->
						<td>${o.shp_o_product_sellprice}</td>
						<!--판매가격 -->
						<td>${o.shp_o_total_price}</td>
						<!--상품별 총 주문금액 -->
						<td>${o.shp_o_check_date}</td>
						<!--발주확인일 -->
						<td>${o.shp_o_taker_ph}</td>
						<!--수취인연락처1 -->
						<td>${o.shp_o_take_area}</td>
						<!--배송지 -->
						<td>${o.shp_o_customer_ph}</td>
						<!--구매자연락처 -->
						<td>${o.shp_o_postnum}</td>
						<!--우편번호 -->
						<td>${o.shp_o_message}</td>
						<!--배송메세지 -->
						<td>${o.shp_o_out_area}</td>
						<!--출고지 -->
						<td>${o.shp_o_date}</td>
						<!--주문일시 -->
						<td>${o.shp_o_claim}</td>
						<!--클레임상태 -->
						<td>${o.shp_o_pay_method}</td>
						<!--결제수단 -->
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>