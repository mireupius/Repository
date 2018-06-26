<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="customer.myHome.orderList">

		<select name="sb_searchMonth">
			<option value="1">최근 1개월 전</option>
			<option value="3">최근 3개월 전</option>
			<option value="6">최근 6개월 전</option>
			<option value="12">최근 12개월 전</option>
		</select> <input type="submit" value="조회">
	</form>

	<c:forEach var="list" items="${orderList }">
	<div>
	상품주문번호 : ${list.sd_delivery_pno }
	상품번호 : ${list.sd_delivery_no }
	상품명 : ${list.sd_product_name }
	가격 : ${list.sd_total_price }
	주문상태 : ${list.sd_delivery_state }
	수량 : ${list.sd_amount }
	옵션 : ${list.sd_option_info }
	<button>주문취소</button>
	</div>

</c:forEach>

</body>
</html>