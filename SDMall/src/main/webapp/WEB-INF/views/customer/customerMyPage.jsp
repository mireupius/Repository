<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>마이페이지</h1>
${sessionScope.loginCustomer.csm_id }님<br>
${sessionScope.loginCustomer.csm_name }<br>
${sessionScope.loginCustomer.csm_phoneNo }<br>

<form action="customer.myHome.orderList">

<select name="searchMonth">
	<option value="-1">최근 1개월 전</option>
	<option value="-3">최근 3개월 전</option>
	<option value="-6">최근 6개월 전</option>
	<option value="-12">최근 12개월 전</option>
</select>

<input type="submit" value="조회">
</form>



<c:forEach var="list" items="${orderList }">

주문자 : ${list.sb_csm_id }
상품명 : ${list.sb_Pname }
가격 : ${list.sb_Pprice }

</c:forEach>
</body>
</html>