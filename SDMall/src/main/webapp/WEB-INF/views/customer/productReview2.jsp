<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources/junyoung/star.css" rel="stylesheet">
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/star.js"></script>
<script src="resources/js/go.js"></script>
</head>
<body>

<c:forEach var="list" items="${orderList }">
	<div>
	상품주문번호 : ${list.sd_delivery_pno }
	상품명 : ${list.sd_product_name }
	배송상태 : ${list.sd_delivery_state }
	<button type="button" onclick="goWritingReview(${list.sd_delivery_pno })">상품평작성</button>
	</div>

</c:forEach>

</body>
</html>