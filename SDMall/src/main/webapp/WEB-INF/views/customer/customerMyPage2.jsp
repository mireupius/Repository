<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources/junyoung/bootstrap.min.css" rel="stylesheet">
<link href="resources/junyoung/myPage.css" rel="stylesheet">

</head>
<body>

	<!-- 헤더가 와야할 위치 -->
	<div id="myPagelogo">
		<a href="/mall"><img src="resources/etc/logo.png"></a>
	</div>
	<!-- Login -->
	<div id="header-Icon">
		<div class="wishlist_content">
			<div class="wishlist_icon">
				<img src="resources/etc/icon-login.png" alt="">
			</div>
			<div class="wishlist_text">
				<c:if test="${sessionScope.loginCustomer == null }">
					<a href="member.loginPage">로그인</a>
				</c:if>
				<c:if test="${sessionScope.loginCustomer != null }">
					<a href="customer.logout.do">로그아웃</a>
				</c:if>
			</div>
		</div>

		<!-- Myhome -->
		<div class="wishlist_content">
			<div class="wishlist_icon">
				<img src="resources/etc/icon-myhome.png" alt="">
			</div>
			<div class="wishlist_text">
				<a href="customer.myHome.go">마이홈</a>
			</div>
		</div>


		<!-- Cart -->
		<div class="wishlist_content">
			<div class="wishlist_icon">
				<img src="resources/etc/icon-cart.png" alt="">
				<div class="cart_count">
					<span></span>
				</div>
			</div>
			<div class="wishlist_text">
				<a href="customer.cart.go">장바구니</a>
			</div>
		</div>
	</div>

	<!--  -->

	<div class="container-fluid">

		<div class="row row-offcanvas row-offcanvas-left">
		
		<h4>마이페이지</h4>
		${sessionScope.loginCustomer.csm_name }님<br>
		${sessionScope.loginCustomer.csm_phoneNo }<br>
		${memberStatus.ms_grade }<br>
		${memberStatus.ms_point }<br>

			<div class="col-sm-3 col-md-2 sidebar-offcanvas" id="sidebar" role="navigation">

				<ul class="nav nav-sidebar">
					<h4>주문관리</h4>
					<li><a href="customer.myHome.orderList.go">주문/배송조회</a></li>
					<li><a href="customer.myHome.claimedOrderList.go">취소/교환/반품조회</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<h4>활동관리</h4>
					<li><a href="customer.myHome.productReview.go">상품평작성</a></li>
					<li><a href="customer.productReview.show">상품평조회</a></li>
					<li><a href="customer.myQuestion.show">상품Q&A</a></li>
					<li><a href="">적립금</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<h4>정보관리</h4>
					<li><a href="customer.update.go">개인정보수정</a></li>
					<li><a href="customer.withdraw.go">회원탈퇴</a></li>
				</ul>

			</div>
			<!--/span-->

				<h1 class="page-header">
					Dashboard
					<p class="lead">
						(<a href="http://www.bootply.com/128936">with off-canvas
							sidebar</a>)
					</p>
				</h1>



				<hr>

				<h2 class="sub-header">Section title</h2>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>#</th>
								<th>Header</th>
								<th>Header</th>
								<th>Header</th>
								<th>Header</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1,001</td>
								<td>Lorem</td>
								<td>ipsum</td>
								<td>dolor</td>
								<td>sit</td>
							</tr>
							<tr>
								<td>1,002</td>
								<td>amet</td>
								<td>consectetur</td>
								<td>adipiscing</td>
								<td>elit</td>
							</tr>
							<tr>
								<td>1,003</td>
								<td>Integer</td>
								<td>nec</td>
								<td>odio</td>
								<td>Praesent</td>
							</tr>
							<tr>
								<td>1,003</td>
								<td>libero</td>
								<td>Sed</td>
								<td>cursus</td>
								<td>ante</td>
							</tr>
							<tr>
								<td>1,004</td>
								<td>dapibus</td>
								<td>diam</td>
								<td>Sed</td>
								<td>nisi</td>
							</tr>
							<tr>
								<td>1,005</td>
								<td>Nulla</td>
								<td>quis</td>
								<td>sem</td>
								<td>at</td>
							</tr>
							<tr>
								<td>1,006</td>
								<td>nibh</td>
								<td>elementum</td>
								<td>imperdiet</td>
								<td>Duis</td>
							</tr>
							<tr>
								<td>1,007</td>
								<td>sagittis</td>
								<td>ipsum</td>
								<td>Praesent</td>
								<td>mauris</td>
							</tr>
							<tr>
								<td>1,008</td>
								<td>Fusce</td>
								<td>nec</td>
								<td>tellus</td>
								<td>sed</td>
							</tr>
							<tr>
								<td>1,009</td>
								<td>augue</td>
								<td>semper</td>
								<td>porta</td>
								<td>Mauris</td>
							</tr>
							<tr>
								<td>1,010</td>
								<td>massa</td>
								<td>Vestibulum</td>
								<td>lacinia</td>
								<td>arcu</td>
							</tr>
							<tr>
								<td>1,011</td>
								<td>eget</td>
								<td>nulla</td>
								<td>Class</td>
								<td>aptent</td>
							</tr>
							<tr>
								<td>1,012</td>
								<td>taciti</td>
								<td>sociosqu</td>
								<td>ad</td>
								<td>litora</td>
							</tr>
							<tr>
								<td>1,013</td>
								<td>torquent</td>
								<td>per</td>
								<td>conubia</td>
								<td>nostra</td>
							</tr>
							<tr>
								<td>1,014</td>
								<td>per</td>
								<td>inceptos</td>
								<td>himenaeos</td>
								<td>Curabitur</td>
							</tr>
							<tr>
								<td>1,015</td>
								<td>sodales</td>
								<td>ligula</td>
								<td>in</td>
								<td>libero</td>
							</tr>
						</tbody>
					</table>
				</div>

				<a href="http://www.bootply.com/gkTHCwjLO9">Get the Source Code</a>
				| <a href="http://bootstrap.theme.cards">More free Bootstrap
					themes</a>

			</div>
			<!--/row-->
		</div>
	</div>
	<!--/.container-->

	<footer>
		<p class="pull-right">©2016 Company</p>
	</footer>

	<!-- script references -->
	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/junyoung/bootstrap.min.js"></script>
	<script src="resources/junyoung/scripts.js"></script>

</body>
</html>