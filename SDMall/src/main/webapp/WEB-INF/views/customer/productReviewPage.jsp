<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources/junyoung/review.css" rel="stylesheet">
<script src="resources/js/go.js"></script>
</head>
<body>

	<div>
		<table class="reviewTb0">
			<tr>
				<td>
					<h2>상품 리뷰</h2>
				</td>
			</tr>
		</table>
	</div>

	<c:forEach var="list" items="${orderList }">
		<div>
			<table class="reviewOrder">
				<tr>
					<td class="reviewTd1">상품주문번호</td>
					<td class="reviewTd2">${list.sd_delivery_pno }</td>
				</tr>
				<tr>
					<td class="reviewTd1">상품명</td>
					<td class="reviewTd2">${list.sd_product_name }</td>
				</tr>
				<tr>
					<td colspan="2">
						<div>
							<button class="reviewBtn" type="button"
								onclick="goWritingReview(${list.sd_delivery_pno })">상품평작성</button>
						</div>
					</td>
				</tr>
			</table>
		</div>

	</c:forEach>

</body>
</html>