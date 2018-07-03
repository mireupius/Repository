<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources/junyoung/myPage.css" rel="stylesheet">

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="shop_sidebar">
					<div class="sidebar_section myPage_sidebar">
						<div class="sidebar_title">주문관리</div>
						<ul class="sidebar_categories">
							<li><a href="customer.myHome.orderList.go">주문/배송조회</a></li>
							<li><a href="customer.myHome.claimedOrderList.go">취소/교환/반품조회</a></li>
						</ul>
						<div class="sidebar_title">활동관리</div>
						<ul class="sidebar_categories">
							<li><a href="customer.myHome.productReview.go">상품평작성</a></li>
							<li><a href="customer.productReview.show">상품평조회</a></li>
							<li><a href="customer.myQuestion.show">상품Q&A</a></li>
							<li><a href="">적립금</a></li>
						</ul>
						<div class="sidebar_title">정보관리</div>
						<ul class="sidebar_categories">
							<li><a href="customer.update.go">개인정보수정</a></li>
							<li><a href="customer.withdraw.go">회원탈퇴</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-9">
			
				<div class="myPageContent">
					<jsp:include page="${myPageContentArea }"></jsp:include>
				</div>
			</div>
		</div>
	</div>
</body>
</html>