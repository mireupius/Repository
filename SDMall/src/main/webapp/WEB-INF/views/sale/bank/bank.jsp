<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>

<style type="text/css">
#bankTabel {
	border: none;
	height: 300px;
}

#btCell {
	font-size: 10pt;
	text-align: center;
	border-top: none;
}

#an_input {
	width: 100%;
	border: none;
}

#ab_input {
	width: 100%;
	border: none;
}

#infoCell {
	text-align: center;
}

#infoCell2 {
	text-align: center;
}
</style>
<script type="text/javascript">
	$(function() {

		
		if (${empty bankNum }){
			alert("등록된 은행 정보가 없습니다");
		}								
		
		$("#takeMoneyBtn").click(function() {
			var take = confirm("정산하시겠습니까?");
			if (take && ${!empty bankNum}) {
				location.href = "saleBank.takemoney.do";
			}else{
			  alert("은행정보를 등록해주세요");
			}
		});

		$("#modifyBtn").click(function() {

			if (confirm("수정하시겠습니까?") == true) {

				$("#modifyBtn").remove();
				$("#an_input").val("");
				$("#ab_input").val("");
				$("#an_input").css("border","black solid 1px");
				$("#ab_input").css("border","black solid 1px");
				$("#an_input").removeAttr("readonly");
				$("#ab_input").removeAttr("readonly");

				$("<input>", {
					value : "수정하기",
					type : "submit",
				    class : "btn btn-default"
				}).appendTo($("#btCell"));

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

					<div class="col-md-6">
						<div class="content-panel">
							<c:choose>
								<c:when test="${empty bankNum }">
									<form action="saleBank.reg.do" method="post" id="backForm">
								</c:when>
								<c:otherwise>
									<form action="saleBank.modify.do" method="post" id="backForm">
								</c:otherwise>
							</c:choose>

							<table class="table" id="bankTabel">
								<tr>
									<th>정산금액</th>
									<td colspan="3">${money }￦
										<button class="btn btn-default" type="button"
											id="takeMoneyBtn">정산하기</button>
									</td>
								</tr>

								<c:choose>
									<c:when test="${empty bankNum }">
										<tr>

											<th>정산금 입금계좌번호</th>
											<td><input name="sa_account_num"></td>
											<th>은행명</th>
											<td><input name="sa_account_bank"></td>
										</tr>

										<tr>
											<td colspan="4" id="infoCell2">
												<button class="btn btn-default" id="btCell">은행정보 입력</button>
											</td>
										</tr>

									</c:when>

									<c:otherwise>

										<tr>

											<th>정산금 입금계좌번호</th>
											<td><input id="an_input" value="${bankNum }"
												name="sa_account_num" readonly="readonly"></td>
											<th>은행명</th>
											<td><input id="ab_input" value="${bankName }"
												name="sa_account_bank" readonly="readonly"><br></td>
										</tr>

										<tr>
											<td colspan="4" id="btCell">
												<button class="btn btn-default" id="modifyBtn">계좌정보
													수정하기</button>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
							</form>
						</div>
					</div>
					<!-- /col-md-12 -->


				</div>
			</div>


			<!-- /col-lg-4 -->

			<!-- /row -->
		</section>
		<!--/wrapper -->
	</section>

</body>
</html>