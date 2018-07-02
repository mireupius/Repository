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

		var all = "${all }";
		var success = "${success }";

		if (all != "" && success != "") {
			alert(all + "건 등록시도," + success + "건 등록성공");
		}

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

			alert('선택건 발주 확인완료 ');
		});

		$("#selectDealSend").click(function() {

			var array;
			var cs_array;

			var no_array;
			$("input[name=orderCheck]:checked").each(function(i, box) {
				var value = $(box).val();
				if (i == 0) {
					array = value;
					cs_array = $(".cs_" + value).val();
					no_array = $(".no_" + value).val();
				} else {
					array += "," + value;
					cs_array += "," + $(".cs_" + value).val();
					no_array += "," + $(".no_" + value).val();
				}
			});

			$("#send_ArrayVal").val(array);
			$("#cs_ArrayVal").val(cs_array);
			$("#no_ArrayVal").val(no_array);

		});

	});
</script>


</head>
<body>
	<section id="main-content">
		<section class="wrapper">
			<h3>
				<i class="fa fa-angle-right"></i> 발주/발송관리

			</h3>

			<div class="showback" id="inputSets">


				<span>전체주문 :<a href="sale.delivery.go">${AllDeliveryNum }</a>건
				</span> <span>신규주문 :<a href="sale.selNewDeals.go">${NewDeliveryNum }</a>건
				</span> <span>발주확인 :<a href="sale.selCheckDeals.go">${CheckDeliveryNum }</a>건
				</span> <span>선택건 일괄입력</span> <select id="inputSel">
					<option value="" selected disabled hidden>선택</option>
					<option>대한통운</option>
					<option>로젠택배</option>
					<option>우체국택배</option>
				</select> <input id="inputVal" type="text" class="form-control"
					placeholder="송장번호입력">
				<button id="inputSet" type="button" class="btn btn-default">선택건
					적용</button>
				<a href="excel.xlsx"><button type="button"
						class="btn btn-default">발주확인 주문건 엑셀다운로드</button></a>

			</div>

			<div class="row mt">
				<div class="col-lg-12">
					<div class="content-panel" id="deliveryTableDiv">
						<section id="unseen">
							<table class="table table-bordered table-striped table-condensed"
								id="deliveryTable">
								<thead>
									<tr>
										<th><input type="checkbox" class="checked" id="checkAll"></th>
										<th>상품주문번호</th>
										<th>주문번호</th>
										<th>택배사</th>
										<th>송장번호</th>
										<th>배송완료일</th>
										<th>구매자명</th>
										<th>구매자ID</th>
										<th>수취인명</th>
										<th>주문상태</th>
										<th>주문세부상태</th>
										<th>배송비</th>
										<th>상품번호</th>
										<th>상품명</th>
										<th>옵션종류</th>
										<th>옵션정보</th>
										<th>수량(구입수량)</th>
										<th>옵션가격</th>
										<th>상품가격</th>
										<th>판매가격</th>
										<th>상품별 총 주문금액</th>
										<th>발주확인일</th>
										<th>수취인연락처1</th>
										<th>배송지</th>
										<th>구매자연락처</th>
										<th>우편번호</th>
										<th>배송메세지</th>
										<th>출고지</th>
										<th>주문일시</th>
										<th>클레임상태</th>
										<th>결제수단</th>
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
													<td><select class="cs_${d.sd_delivery_pno}">
															<option value="" selected disabled hidden>선택</option>
															<option>대한통운</option>
															<option>로젠택배</option>
															<option>우체국택배</option>
													</select></td>
													<td><input type="text"
														class="no_${d.sd_delivery_pno} form-control deliver_no_input"></td>
													<td>${d.sd_delivery_done_date}</td>
													<td>${d.sd_customer_name}</td>
													<td>${d.sd_customer_id}</td>
													<td>${d.sd_taker_name}</td>
													<td>${d.sd_delivery_state}</td>
													<td>${d.sd_state_detail}</td>
													<td>${d.sd_delivery_cost}</td>
													<td>${d.sd_product_no}</td>
													<td>${d.sd_product_name}</td>
													<td>${d.sd_option_type}</td>
													<td>${d.sd_option_info}</td>
													<td>${d.sd_amount}</td>
													<td>${d.sd_option_price}</td>
													<td>${d.sd_product_price}</td>
													<td>${d.sd_product_sellprice}</td>
													<td>${d.sd_total_price}</td>
													<td>${d.sd_check_date}</td>
													<td>${d.sd_taker_phone}</td>
													<td>${d.sd_take_area}</td>
													<td>${d.sd_customer_ph}</td>
													<td>${d.sd_postno}</td>
													<td>${d.sd_message}</td>
													<td>${d.sd_out_area}</td>
													<td>${d.sd_order_date}</td>
													<td>${d.sd_claim}</td>
													<td>${d.sd_pay_method}</td>
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
						<form action="sale.deliverySend.do" method="post"
							style="display: inline">
							<input name="send_Array" id="send_ArrayVal" hidden> <input
								name="cs_sendArray" id="cs_ArrayVal" hidden> <input
								name="no_sendArray" id="no_ArrayVal" hidden> <input
								id="selectDealSend" type="submit" value="선택건 발송처리" type="submit"
								class="btn btn-default">
						</form>

						<form action="sale.deliveryCheck.do" method="post"
							style="display: inline">
							<input name="array" id="arrayVal" hidden> <input
								id="deliveryCheckButton" type="submit" value="선택건 발주확인"
								type="button" class="btn btn-default">
						</form>

						<form action="insertExcel.go" enctype="multipart/form-data"
							method="post" style="display: inline">
							<input type="submit" value="엑셀 일괄발송" type="button"
								class="btn btn-default"> <input name="excelFile"
								type="file" style="display: inline">
						</form>


					</div>


				</div>



				<!-- /col-lg-4 -->

				<!-- /row -->
		</section>
		<!--/wrapper -->
	</section>
	<!-- /MAIN CONTENT -->
</body>
</html>