<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="resources/junyoung/star.css" rel="stylesheet">
<link href="resources/junyoung/write.css" rel="stylesheet">
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/junyoung/star.js"></script>
</head>
<body>

	<div>
		<table class="writeTb0">
			<tr>
				<td>
					<h2>상품 리뷰 작성</h2>
				</td>
			</tr>
		</table>
	</div>

	<form action="customer.productReview.write">
		<div>
			<input type="hidden" value="${review.sd_product_no }" name="pr_gdNo">
			<input type="hidden" value="${review.sd_customer_id }"
				name="pr_csm_id"> <input type="hidden"
				value="${review.sd_delivery_pno }" name="pr_orderNo"> <input
				type="hidden" value="${review.sd_product_name }" name="pr_gdName">
		</div>

		<table class="writeTb0">
			<tr>
				<td class="writeTd1">상품평</td>
				<td class="writeTd2"><textarea class="writeTextArea" name="pr_comment"></textarea></td>
			</tr>
			<tr>
				<td class="writeTd1">별점</td>
				<td class="writeTd2">
					<div>
				<span class="star-input">
					<span class="input">
						<input type="radio" name="pr_star" value="1" id="p1">
							<label for="p1">1</label>
						<input type="radio" name="pr_star" value="2" id="p2">
							<label for="p2">2</label>
						<input type="radio" name="pr_star" value="3" id="p3">
							<label for="p3">3</label>
						<input type="radio" name="pr_star" value="4" id="p4">
							<label for="p4">4</label>
						<input type="radio" name="pr_star" value="5" id="p5">
							<label for="p5">5</label>
					</span>
				</span>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input class="writeBtn2" type="submit" value="작성"></td>
			</tr>	
		</table>

	</form>

</body>
</html>