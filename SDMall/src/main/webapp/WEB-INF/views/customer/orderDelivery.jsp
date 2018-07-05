<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/junyoung/order.css">
<script type="text/javascript" src="resources/js/go.js"></script>

</head>
<body>

	<form action="customer.myHome.orderList">
		<div>
			<table class="orderTb0">
				<tr>
					<td>
						<h2>주문/배송 조회</h2>
					</td>
				</tr>
			</table>
		</div>
		<div>
			<table class="orderTb1">
				<tr>
					<td align="left">
						<div class="orderDiv">
							<select class="orderSelect" name="searchMonth">
								<option value="1">최근 1개월 전</option>
								<option value="3">최근 3개월 전</option>
								<option value="6">최근 6개월 전</option>
								<option value="12">최근 12개월 전</option>
							</select>
						</div>
					</td>
					<td align="right"><input class="orderBtn" type="submit"
						value="조회"></td>
				</tr>
			</table>
		</div>
	</form>

	<div class="showOrderlist">
		<c:forEach var="list" items="${orderList }">

				<table class="orderTb2">
					<tr>
						<td class="orderTd1">주문번호 : ${list.sd_delivery_pno }</td>
					</tr>
					<tr>
						<td>
							<table class="orderTb3">
								<tr>
									<td class="orderTd2" colspan="2" rowspan="5"><img style="max-width: 100px;"
										src="upload/${list.gd_imgss }"></td>
									
								</tr>
								<tr>
									<td class="orderTd3">상품명</td>
									<td>${list.sd_product_name }</td>
								</tr>
								<tr>
									<td class="orderTd3">옵션</td>
									<td>수량 ${list.sd_amount } | ${list.sd_option_info }</td>
								</tr>
								<tr>
									<td class="orderTd3">가격</td>
									<td>${list.sd_total_price }</td>
								</tr>
								<tr>
									<td class="orderTd4" align="right" colspan="2">${list.sd_delivery_state }</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<button class="orderBtn" type="button"
								onclick="goCancelOrder(${list.sd_delivery_pno });">주문취소</button>
							<button class="orderBtn" type="button"
								onclick="goExchangeOrder(${list.sd_delivery_pno });">교환신청</button>
							<button class="orderBtn" type="button"
								onclick="goReturnOrder(${list.sd_delivery_pno });">반품신청</button>
							<button class="orderBtn" type="button"
								onclick="goQuestionSeller(${list.sd_delivery_pno });">판매자문의</button>
						</td>
					</tr>
				</table>

		</c:forEach>
	</div>
</body>
</html>