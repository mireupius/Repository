<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">
	
	$(function() {

		alert("++++" + $(".tt").val());
		alert("===" + $('input[name=tt]').val());

		
	
		
		
	/* 	$(".opname").click( function() {
			
		   var id_check = $(this).attr("id").val();
		   alert(id_check);
		}); */
		
		// 전체상품선택시 전체상품선택되고 풀면다풀리게해주기		
		$("#checkAll").click(function() {
			//클릭되었으면
			if ($("#checkAll").prop("checked")) {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
				$("input[name=check]").prop("checked", true);
				//클릭이 안되있으면
			} else {
				//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
				$("input[name=check]").prop("checked", false);
			}
		});

		// 전체상품선택후 다른상품 하나라도 해제시 전체상품체크박스 체크해제
		$('.check').click(function() {
			if ($('#check').prop("checked")) {

				$("input[name=checkAll]").prop("checked", true);
			} else {
				$("input[name=checkAll]").prop("checked", false);
			}
		});

		$('.check').click(function() {
			alert($(this).attr(id));
		});

	});
</script>
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
<input name="tt"  class="tt"    value="asdasdasd">
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
		<c:choose>
			<c:when test="${shopBag.size() == 0}">
				<h1>장바구니가 비었습니다</h1>
			</c:when>
			<c:otherwise>
				<div class="jumbotron">
					<div id="mainheader">장바구니</div>
					<div id="allcheck">
						<input type="checkbox" id="checkAll" class="checkbox-style"
							name="checkAll"><label for="divECI_ISDVSAVE">전체상품선택</label>
						<a href="deleteAll.do?sb_csm_id=${sp.sb_csm_id }">전체상품삭제</a>
					</div>
					<div id="alldelete" align="right"></div>
					<div>
						<c:forEach var="sp" items="${shopBag }" varStatus="status">
							<table border="1">
								<tr>
									<td><input type="checkbox" name="check" class="check"
										id="check${status.count}"><label for="divECI_ISDVSAVE">${sp.sb_Pname }</label></td>
									<td align="right"><a
										href="delete.do?sb_gd_no=${sp.sb_gd_no }">X</a>
										 </td>
										
								</tr>
								<tr>
									<td rowspan="3"><img src="resources/img/${sp.sb_Img }"
										style="width: 90px;"></td>
									<td><select>
											<option style="background-color: blue;" class="opname"
												value="">${sp.sb_optionName }</option>
											<c:forEach var="op" items="${option }">
												<c:if test="${sp.sb_gd_no==op.op_gdno}">
													     <option id="" class="opname" value="${op.op_no }">${op.op_name }</option>
												</c:if>
											</c:forEach>
									</select>| 
									<select>
											<option style="background-color: blue;">${sp.sb_quantity }</option>
											<c:forEach var="op" items="${option }">
												<c:if test="${op.op_gdno == sp.sb_gd_no }">
													<c:forEach begin="1" end="${op.op_stock }" var="i">
														<option>${i}</option>
													</c:forEach>
												</c:if>
											</c:forEach>
									</select> 
									<input type="button" value="변경">
									</td>
								</tr>
								<tr>
									<td><c:forEach begin="${status.index}"
											end="${status.index}" var="sm" items="${summoney}">
											<fmt:formatNumber pattern="###,###,###"
												value="${sm.summoney }"></fmt:formatNumber>
										</c:forEach> | 배송비정보</td>
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
								<td align="right"><fmt:formatNumber pattern="###,###,###"
										value="${sumAllprice }"></fmt:formatNumber></td>
							</tr>
							<tr>
								<td>할인금액</td>
								<td align="right">- <fmt:formatNumber pattern="###,###,###"
										value="${saleprice }"></fmt:formatNumber></td>
							</tr>
							<tr>
								<td>배송비</td>
								<td align="right">미정</td>
							</tr>
							<tr>
								<td>주문금액</td>
								<td align="right"><fmt:formatNumber pattern="###,###,###"
										value="${sumAllSprice }"></fmt:formatNumber></td>
							</tr>
						</table>
					</div>
					<div style="width: 395px;">선택상품 구매</div>
					<div style="width: 395px;">전체상품구매 ${r }</div>
				</div>
			</c:otherwise>
		</c:choose>
		<footer class="footer">
		<p>&copy; Company 2018-06-07</p>
		</footer>
	</div>
	<!-- /container -->
	<!--Surface / desktop 윈도우 용 IE10 뷰포트 해킹 버그 -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>