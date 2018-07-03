<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
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

<c:forEach var="list" items="${reviewList }">
	<div>
	상품평 번호 : ${list.pr_regNo }
	상품주문번호 : ${list.pr_orderNo }
	상품명 : ${list.pr_gdName }
	코멘트 : ${list.pr_comment }
	별점 : ${list.pr_star }점
	등록일 : <fmt:formatDate value="${list.pr_regDate }" dateStyle="long"/>
	
	</div>
</c:forEach>

</body>
</html>