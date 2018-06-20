<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#checkAll").click(function() {
			if ($('#checkAll').prop('checked')) {
				$('.orderCheck').prop('checked', true);
			} else {
				$('.orderCheck').prop('checked', false);
			}
		});

		$("#inputSet").click(function() {

			$("input[name=orderCheck]:checked").each(function(i, box) {

				var q = ".cs_" + $(box).val();
				var n = ".no_" + $(box).val();
				var qv = $("#inputSel").val();
				var nv = $("#inputVal").val();

				$(q).val(qv).prop("selected", true);
				$(n).val(nv);

			});

		});

		$("#deliveryCheckButton").click(function() {

			var array;
			$("input[name=orderCheck]:checked").each(function(i, box) {
				if (i == 0) {
					array = $(box).val();
				} else {
					array += "," + $(box).val();
				}
			});

			$("#arrayVal").val(array);
			alert($("#arrayVal").val());
		});

		$("#deliveryCheckButton").click(function() {

			var array;
			$("input[name=orderCheck]:checked").each(function(i, box) {
				if (i == 0) {
					array = $(box).val();
				} else {
					array += "," + $(box).val();
				}
			});

			$("#arrayVal").val(array);
			alert('선택건 발주 확인완료 ');
		});

		$("#selectDealSend").click(function() {

			var array;
			$("input[name=orderCheck]:checked").each(function(i, box) {
				if (i == 0) {
					array = $(box).val();
				} else {
					array += "," + $(box).val();
				}
			});

			$("#arrayVal").val(array);
			alert($("#arrayVal").val());
		});

	});
</script>


</head>
<body>
	<section id="main-content">
		<section class="wrapper">
			<h3>
				<i class="fa fa-angle-right">교환관리</i>
			</h3>
			<div class="showback" id="inputSets">

				<span>교환 :<a href="sale.exchangeDelivery.go">${exchangeDeliveryNum }</a>건
				</span>

			</div>

			<div class="row mt">
				<div class="col-lg-12">
					<div class="content-panel" id="deliveryTableDiv">

						<section id="unseen">
							<table class="table table-bordered table-striped table-condensed">
								<thead>
									<tr>
										<th><input type="checkbox" class="checked" id="checkAll"></th>
										<th>상품주문번호</th>
										<th>주문번호</th>
										<th>발송처리일</th>
										<th>배송방법</th>
										<th>택배사</th>
										<th>송장번호</th>
										<th>구매자명</th>
										<th>구매자ID</th>
										<th>수취인명</th>
										<th>주문상태</th>
										<th>클레임상태</th>
										<th>상품번호</th>
										<th>상품명</th>
										<th>옵션종류</th>
										<th>옵션정보</th>
										<th>수량(구입수량)</th>
										<th>상품가격</th>
										<th>옵션가격</th>
										<th>상품별 총 주문금액</th>
										<th>배송완료일</th>
										<th>수취인연락처1</th>
										<th>배송지</th>
										<th>구매자연락처</th>
										<th>우편번호</th>

									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${deliverys != '0'}">
											<c:forEach items="${deliverys }" var="d">
												<tr class="tableTr">
													<td><input type="checkbox" class="checked orderCheck"
														name="orderCheck" value="${d.sd_delivery_pno}"></td>
													<td>${d.sd_delivery_pno}</td>
													<td>${d.sd_delivery_no}</td>
													<td>${d.sd_go_delivery_date}</td>
													<td>${d.sd_delivery_type}</td>
													<td>${d.sd_courier}</td>
													<td>${d.sd_invoice_no}</td>
													<td>${d.sd_customer_name}</td>
													<td>${d.sd_customer_id}</td>
													<td>${d.sd_taker_name}</td>
													<td>${d.sd_delivery_state}</td>
													<td>${d.sd_claim}</td>
													<td>${d.sd_product_no}</td>
													<td>${d.sd_product_name}</td>
													<td>${d.sd_option_type}</td>
													<td>${d.sd_option_info}</td>
													<td>${d.sd_amount}</td>
													<td>${d.sd_product_price}</td>
													<td>${d.sd_option_price}</td>
													<td>${d.sd_total_price}</td>
													<td>${d.sd_delivery_done_date}</td>
													<td>${d.sd_taker_phone}</td>
													<td>${d.sd_take_area}</td>
													<td>${d.sd_customer_ph}</td>
													<td>${d.sd_postno}</td>

												</tr>
											</c:forEach>
										</c:when>


										<c:otherwise>
											<tr>
												<td colspan="27">조회된 내용이 없습니다</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</section>
					</div>
					<!-- /content-panel -->
					<c:if test="${pageCount != 0}">
						<div class="showback" align="center">

							<c:forEach var="i" begin="0" varStatus="num" end="${pageCount }">
								<a href="${now}?pno=${num.count }">
									<button type="button" class="btn btn-default">${num.count }</button>
								</a>
							</c:forEach>

						</div>
					</c:if>
					<div class="showback">
						<button>엑셀 일괄등록</button>
					</div>
				</div>


				<!-- /col-lg-4 -->
			</div>



			<!-- /row -->
		</section>
		<!--/wrapper -->
	</section>
	<!-- /MAIN CONTENT -->
</body>
</html>