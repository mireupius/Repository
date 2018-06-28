<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources/junyoung/star.css" rel="stylesheet">
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/junyoung/star.js"></script>
</head>
<body>

<form action="customer.productReview.write">
<input value="${review.sd_delivery_pno }" name="pr_orderNo"><br>
<input value="${review.sd_product_no }" name="pr_gdNo"><br>
<input value="${review.sd_product_name }" name="pr_gdName"><br>
<input value="${review.sd_customer_id }" name="pr_csm_id"><br>
<input name="pr_comment"><br>
<span class="star-input">
	<span class="input focus">
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
<input type="submit" value="작성">

</form>

</body>
</html>