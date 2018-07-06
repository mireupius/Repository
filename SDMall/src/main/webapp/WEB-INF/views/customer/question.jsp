<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/junyoung/write.css">
</head>
<body>
	<form action="order.question.write">

		<div>
			<table class="writeTb0">
				<tr>
					<td align="justify">
						<h2>SD Mall Q&A</h2>
						<div>
							<input type="hidden" value="${question.sd_customer_id }"
								name="qa_csm_id">
						</div>
						<div>
							<input type="hidden" value="${question.sd_seller_id }"
								name="qa_sl_id">
						</div>
						<div>
							<input type="hidden" value="${question.sd_product_no }"
								name="qa_gdNo">
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div>
			<table class="writeTb1">
				<tr>
					<td align="center">
						<table class="writeTb2">
							<tr>
								<td class="writeTd1">주문번호</td>
								<td class="writeTd2">
									<div>
										<input class="writeInput" value="${question.sd_delivery_pno }" name="qa_orderNo">
									</div>
								</td>
							</tr>
							<tr>
								<td class="writeTd1">문의상품</td>
								<td class="writeTd2">
									<div>
										<input class="writeInput" value="${question.sd_product_name }" name="qa_gdName">
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table class="writeTb2">
							<tr>
								<td class="writeTd1">문의종류</td>
								<td class="writeTd2">
									<div>
										<select class="writeSelect" name="qa_sort">
											<option value="상품">상품</option>
											<option value="배송">배송</option>
											<option value="취소">취소</option>
											<option value="반품">반품</option>
											<option value="교환">교환</option>
										</select>
									</div>
									
								</td>
							</tr>
							<tr>
								<td class="writeTd1">제목</td>
								<td class="writeTd2">
									<div>
										<input class="writeInput" name="qa_questionTitle" placeholder="최소 6자 이상"
											maxlength="20">
									</div>
								</td>
							</tr>
							<tr>
								<td class="writeTd1">내용</td>
								<td class="writeTd2">
									<div>
										<textarea class="writeTextArea" name="qa_questionContent" placeholder="최소 20자 이상"
											maxlength="200"></textarea>
									</div>
								</td>
							</tr>

						</table>
					</td>
				</tr>
			</table>
		</div>
		<div>
			<table class="writeTb3">
				<tr>
					<td>
						<div>
							<input class="writeBtn" type="submit" value="문의하기">
							<button class="writeBtn" onclick="goCustomerPage();" type="button">이전으로</button>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>