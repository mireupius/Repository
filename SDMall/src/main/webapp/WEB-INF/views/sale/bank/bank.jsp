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

			if (confirm("수정하시겠습니까?") == true) {

				$("#modifyBtn").remove();
				$("#an_input").val("");
				$("#ab_input").val("");
				$("#an_input").removeAttr("readonly");
				$("#ab_input").removeAttr("readonly");

				$("<input>", {
					value : "수정하기",
					type : "submit"
				}).appendTo($("#modifyForm"));

			}

		});
	})
</script>
</head>
<body>

	<section id="main-content">
		<section class="wrapper">
			<h3>
				<i class="fa fa-angle-right"></i> 정산내역
			</h3>


			<div class="row mt">
				<div class="col-lg-12">

					<!-- 답변패널 시작 -->
					<div class="col-md-6">
						<div class="content-panel">
							<table class="table">
								<tr>
									<th>정산금액</th>
									<td>"${money }￦"</td>
									<th>정산하기</th>
									<td><button class="btn btn-default">정산하기</button></td>
								</tr>

								<tr>
									<th>상품주문번호</th>
									<td id="qa_orderNo"></td>
									<th>상품명</th>
									<td id="gdName"></td>
								</tr>
								<tr>
									<th>문의유형/제목</th>
									<td colspan="3" id="questionTitle"></td>
								</tr>
								<tr>
									<th>문의내용</th>
									<td colspan="3" id="questionContent"></td>
								</tr>
							</table>
						</div>
					</div>
					<!-- /col-md-12 -->


					<div class="col-md-6">
						<div class="content-panel">
							<table class="table">
								<thead>
									<tr>
										<th colspan="4">판매자 답변처리</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>답변내용</td>
										<td>
											<form method="post" action="sale.delivery.answer.do">
												<textarea name="qa_answer" id="anwser" value=""></textarea>
												<input name="qa_regNo" id="anwserNum" value="" hidden="">
												<input type="submit" value="답변하기"><span id="result"
													hidden>${r }</span>
											</form>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 답변패널 끝-->


				</div>

			</div>


			<!-- /col-lg-4 -->

			<!-- /row -->
		</section>
		<!--/wrapper -->
	</section>






















	<section id="container">
		<section id="main-content">
			<section class="wrapper">


				<div class="row mt">
					<div class="col-lg-12">
						<div class="form-panel">
							<h4 class="mb">
								<i class="fa fa-angle-right"></i> Form Elements
							</h4>

							<div class="form-group">
								<label class="col-sm-2 col-sm-2 control-label">정산예정금액</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" value="${money }￦"
										readonly="readonly">
									<button class="btn btn-default">정산하기</button>
								</div>
							</div>

							<form method="get">
								<div class="form-group">
									<label class="col-sm-2 col-sm-2 control-label">결제계좌</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" value="${bankNum }"
											readonly="readonly">
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 col-sm-2 control-label">은행명</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" value="${bankName }"
											readonly="readonly">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				</div>

				</div>
				<!-- col-lg-12-->
				</div>
				<!-- /row -->







				<div class="row">







					<div class="row mt">
						<div class="col-lg-12">
							<div class="form-panel">
								<h4 class="mb">
									<i class="fa fa-angle-right"></i> 정산내역
								</h4>

								<div class="form-group">
									<label class="col-sm-2 col-sm-2 control-label">정산예정금액</label>
									<div class="col-sm-10">
										결산 예정금액 <b> : ${money } ￦</b>
									</div>
								</div>





								<c:choose>
									<c:when test="${ empty bankNum }">
										<b>등록된 계좌가 없습니다</b>
										<form action="saleBank.reg.do" method="post">





											<div class="form-group">
												<label class="col-sm-2 col-sm-2 control-label">정산계좌</label>
												<div class="col-sm-10">
													<input id="an_input" name="sa_account_num"
														class="form-control">
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 col-sm-2 control-label">은행</label>
												<div class="col-sm-10">
													<input id="ab_input" name="sa_account_bank"
														class="form-control">
												</div>
											</div>

											<button type="submit">계좌 등록하기</button>
										</form>
									</c:when>
									<c:otherwise>
										<form action="saleBank.modify.do" method="post"
											id="modifyForm">



											<div class="form-group">
												<label class="col-sm-2 col-sm-2 control-label">Password</label>
												<div class="col-sm-10">
													<input type="password" class="form-control" placeholder="">
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 col-sm-2 control-label">Password</label>
												<div class="col-sm-10">
													<input type="password" class="form-control" placeholder="">
												</div>
											</div>


											<div class="form-group">
												<label class="col-sm-2 col-sm-2 control-label">정산계좌</label>
												<div class="col-sm-10">
													<input id="an_input" readonly="readonly"
														name="sa_account_num" value="${bankNum }"
														class="form-control">
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 col-sm-2 control-label">은행</label>
												<div class="col-sm-10">
													<input id="ab_input" readonly="readonly"
														name="sa_account_bank" value="${bankName }"
														class="form-control"> <select
														name="sa_account_bank">
														<option>국민</option>
														<option>하나</option>
														<option>기업</option>
														<option>신한</option>
														<option>우체국</option>
													</select>

												</div>
											</div>

											<button type="button" id="modifyBtn" name="modify">계좌정보
												수정하기</button>
										</form>


									</c:otherwise>
								</c:choose>

							</div>
						</div>
					</div>
					<!-- /col-md-4 -->


				</div>
				<!-- /row -->



			</section>
		</section>
	</section>
</body>
</html>