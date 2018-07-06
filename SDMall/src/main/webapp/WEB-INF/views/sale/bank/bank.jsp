<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#takeMoneyBtn").click(function() {
			var take = confirm("정산하시겠습니까?");
			if (take) {
				location.href = "saleBank.takemoney.do";
			}

		});
		$("#modifyBtn").click(function() {
			var reg = confirm("수정하시겠습니까?");
			if (reg) {
				$("#modifyBtn").attr("type", "submit");
				$("#modifyBtn").text("수정하기");
				$("#an_input").removeAttr("readonly");
				$("#ab_input").removeAttr("readonly");
			}

		});
	})
</script>
</head>
<body>


	<section id="container">
		<section id="main-content">
			<section class="wrapper">
				<div class="row">
					<div class="col-lg-9 main-chart">
						<div class="row mt">
							<!-- SERVER STATUS PANELS -->


							<div class="col-md-4 mb">
								<!-- WHITE PANEL - TOP USER -->
								<div class="white-panel pn">
									<div class="white-header">
										<h5>${account.sa_id }</h5>
									</div>

									<p>
										결산 예정금액 <b> : &#92; ${money }</b>
										<button id="takeMoneyBtn">정산하기</button>
									</p>
									<div class="row">


										<c:choose>
											<c:when test="${account.sa_account_num }"== "">
												<b>등록된 계좌가 없습니다</b>
												<form action="">
													<input name="sa_account_num"> <select
														name="sa_account_bank">
														<option>국민</option>
														<option>하나</option>
														<option>기업</option>
														<option>신한</option>
														<option>우체국</option>
													</select> <input type="submit" value="등록하러가기">
												</form>


											</c:when>
											<c:otherwise>
												<form action="saleBank.reg.do" method="post">
													<div class="col-md-6">
														<p class="small mt">정산계좌</p>
														<p>
															<input id="an_input" readonly="readonly"
																name="sa_account_num" value="${account.sa_account_num }">

														</p>
													</div>
													<div class="col-md-6">
														<p class="small mt">정산은행</p>
														<p>
															<input id="ab_input" readonly="readonly"
																name="sa_account_bank"
																value="${account.sa_account_bank }">
														</p>
													</div>
													<button type="button" id="modifyBtn">계좌정보 수정하기</button>
												</form>
											</c:otherwise>

										</c:choose>

									</div>
								</div>
							</div>
							<!-- /col-md-4 -->


						</div>
						<!-- /row -->



						<div class="row mt">


							<div class="border-head">
								<h3>VISITS</h3>
							</div>
							<div class="custom-bar-chart">
								<ul class="y-axis">
									<li><span>10.000</span></li>
									<li><span>8.000</span></li>
									<li><span>6.000</span></li>
									<li><span>4.000</span></li>
									<li><span>2.000</span></li>
									<li><span>0</span></li>
								</ul>
								<div class="bar">
									<div class="title">JAN</div>
									<div class="value tooltips" data-original-title="8.500"
										data-toggle="tooltip" data-placement="top">85%</div>
								</div>
								<div class="bar ">
									<div class="title">FEB</div>
									<div class="value tooltips" data-original-title="5.000"
										data-toggle="tooltip" data-placement="top">50%</div>
								</div>
								<div class="bar ">
									<div class="title">MAR</div>
									<div class="value tooltips" data-original-title="6.000"
										data-toggle="tooltip" data-placement="top">60%</div>
								</div>
								<div class="bar ">
									<div class="title">APR</div>
									<div class="value tooltips" data-original-title="4.500"
										data-toggle="tooltip" data-placement="top">45%</div>
								</div>
								<div class="bar">
									<div class="title">MAY</div>
									<div class="value tooltips" data-original-title="3.200"
										data-toggle="tooltip" data-placement="top">32%</div>
								</div>
								<div class="bar ">
									<div class="title">JUN</div>
									<div class="value tooltips" data-original-title="6.200"
										data-toggle="tooltip" data-placement="top">62%</div>
								</div>
								<div class="bar">
									<div class="title">JUL</div>
									<div class="value tooltips" data-original-title="7.500"
										data-toggle="tooltip" data-placement="top">75%</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</section>
	</section>
</body>
</html>