<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/go.js"></script>
</head>
<body>

	<form action="customer.myHome.orderList">
		<table class="searchOrderTb" border="1">
			<tr>
			<td class="searchOrderTd">주문/배송 조회</td>
			</tr>
			<tr>
				<td class="searchOrderTd">
					<div>
						<select name="searchMonth">
							<option value="1">최근 1개월 전</option>
							<option value="3">최근 3개월 전</option>
							<option value="6">최근 6개월 전</option>
							<option value="12">최근 12개월 전</option>
						</select>
					</div>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="조회"></td>
			</tr>
		</table>
	</form>

	
	<c:forEach var="list" items="${orderList }">
		<div>
			<table>
				<tr>
					<td>상품주문번호 : ${list.sd_delivery_pno }</td>
				</tr>
				<tr>
					<td>
						<table>
							<tr>
								<td rowspan="4"><img style="max-width: 100px;"
									src="upload/${list.gd_imgss }"></td>
								<td>${list.sd_delivery_state }</td>
							</tr>
							<tr>
								<td>상품명 ${list.sd_product_name }</td>
							</tr>
							<tr>
								<td>수량 ${list.sd_amount } | ${list.sd_option_info }</td>
							</tr>
							<tr>
								<td>가격 : ${list.sd_total_price }</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<button type="button"
							onclick="goCancelOrder(${list.sd_delivery_pno });">주문취소</button>
						<button type="button"
							onclick="goExchangeOrder(${list.sd_delivery_pno });">교환신청</button>
						<button type="button"
							onclick="goReturnOrder(${list.sd_delivery_pno });">반품신청</button>
						<button type="button"
							onclick="goQuestionSeller(${list.sd_delivery_pno });">판매자문의</button>
					</td>
				</tr>
			</table>
		</div>
	</c:forEach>
</body>
</html>