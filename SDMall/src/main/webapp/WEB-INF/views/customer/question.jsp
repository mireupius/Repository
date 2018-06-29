<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>

<form action="order.question.write">
<h3>히든처리</h3>
<input value="${question.sd_customer_id }" name="qa_csm_id"><br>
<input value="${question.sd_seller_id }" name="qa_sl_id"><br>
<input value="${question.sd_product_no }" name="qa_gdNo"><br>
<h3>히든처리</h3>
주문번호 : <input value="${question.sd_delivery_pno }" name="qa_orderNo"><br>
문의상품 : <input value="${question.sd_product_name }" name="qa_gdName"><br>
문의종류 : <select name="qa_sort">
				<option value="상품">상품</option>
				<option value="배송">배송</option>
				<option value="취소">취소</option>
				<option value="반품">반품</option>
				<option value="교환">교환</option>
		   </select><br>
제목 : <input name="qa_questionTitle" placeholder="최소 6자 이상" maxlength="20"><br>
내용 : <textarea name="qa_questionContent" placeholder="최소 20자 이상" maxlength="200"></textarea><br>
<input type="submit" value="문의하기">
<button type="button">취소하기</button>
</form>

</body>
</html>