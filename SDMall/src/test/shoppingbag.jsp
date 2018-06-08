<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>장바구니기본</title>
<!-- wan -->
<link href="resources/css/Shoppingbag/Shoppingbag.css" rel="stylesheet">

<!-- 부트 스트랩 코어 CSS -->
<link href="resources/css/bootstrap/bootstrap.min.css" rel="stylesheet">


<!--이 템플릿의 사용자 정의 스타일 -->
<link href="jumbotron-narrow.css" rel="stylesheet">


<!-- 디버깅 목적으로 만 사용됩니다. 실제로이 두 줄을 복사하지 마십시오! ->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../../assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 요소 및 미디어 쿼리에 대한 IE8 지원을위한 HTML5 shim 및 Respond.js ->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div class="container">
		<div class="logo">
			<a href="home.go"><img src="resources/img/cjmalllogo.png"></a>
			<input
				style="padding-left: 10px; margin-left: 200px; border-radius: 10px 10px 10px 10px; margin-top: 10px;"
				type="text" id="seachInput" placeholder="
CJmall 50대 가구 핫딜 SALE">
			<img src="resources/img/cjmallbaner.jpg" align="right">
		</div>
		<div class="header" id="header1">
			<nav>
			<ul class="nav nav-pills pull-right">
				<li role="presentation" class="active"><a href="#">장바구니</a></li>
				<li role="presentation"><a href="#">내정보</a></li>
				<li role="presentation"><a href="#">로그아웃</a></li>
			</ul>
			</nav>
			<h3 class="text-muted" style="padding-bottom: 10px;">카테고리</h3>
		</div>
		<div class="jumbotron">
			<div id="mainheader">장바구니</div>
			<div id="allcheck">
				<input type="checkbox" id="divECI_ISDVSAVE" class="checkbox-style"><label
					for="divECI_ISDVSAVE">전체상품구매</label> <a href="">전체상품삭제</a>
			</div>
			<div id="alldelete" align="right"></div>
			<div>
				<c:forEach var="p" items="${shoppingbag }">
					<table border="1">
						<tr>
							<td><input type="checkbox" id="divECI_ISDVSAVE"
								class="checkbox-style"><label for="divECI_ISDVSAVE">[VW
									베라왕］2018 SdS 레이디 Lady 슬링백</label></td>
							<td>X</td>
						</tr>
						<tr>
							<td rowspan="3">IMG들어올자리</td>
							<td>아이스그레이/250MM | 수량1</td>
						</tr>
						<tr>
							<td>98,000원 | 배송비정보</td>
						</tr>
						<tr>
							<td>무이자 3개월</td>
						</tr>
						<tr>
							<td colspan="2" align="right">옵션변경 구매하기</td>
						</tr>
					</table>
				</c:forEach>
			</div>
			<div>
				<table border="1" width="397">
					<tr>
						<td>상품금액</td>
						<td align="right">99,000원</td>
					</tr>
					<tr>
						<td>할인금액</td>
						<td align="right">-1000원</td>
					</tr>
					<tr>
						<td>배송비</td>
						<td align="right">5000원</td>
					</tr>
					<tr>
						<td>주문금액</td>
						<td align="right">98,000원</td>
					</tr>
				</table>
			</div>
			<div style="width: 395px;">선택상품 구매</div>
			<div style="width: 395px;">전체상품구매</div>
		</div>
		<footer class="footer">
		<p>&copy; Company 2018-06-07</p>
		</footer>
	</div>
	<!-- /container -->
	<!--Surface / desktop 윈도우 용 IE10 뷰포트 해킹 버그 -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>