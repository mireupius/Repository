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
<c:forEach var="list" items="${cartItems }">


장바구니 번호 : ${list.sb_no }
상품명 : ${list.gd_name }
상품사진 : ${list.gd_imgm }
옵션명 : ${list.op_name }
수량 : ${list.sb_quantity }
옵션가격 : ${list.op_price }
상품가격 : ${list.gd_price }<br>


</c:forEach>


</body>
</html>