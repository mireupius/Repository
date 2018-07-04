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
function getQna(num) {
	$.ajax({
		url : "sale.delivery.qna.get",
		data : {
			qa_regNo : num
		},
		success : function(json) {
			$("#qRegDate").text(json.qa_qRegDate);
			$("#aRegDate").text(json.qa_aRegDate);
			$("#qa_orderNo").text(json.qa_orderNo);
			$("#gdName").text(json.qa_gdName);
			$("#questionTitle").text("["+json.qa_sort+"]"+json.qa_questionTitle);
			$("#questionContent").text(json.qa_questionContent);
			$("#anwserNum").val(json.qa_regNo);
			$("#anwser").val(json.qa_answer);
		}
	});
}

$(function(){
var r = $("#result").text();
	if(r!=""){
		alert(r);
	}	
});


</script>

</head>
<body>
	<section id="main-content">
		<section class="wrapper">
			<h3>
				<i class="fa fa-angle-right"></i> 상품문의
			</h3>
			<div class="showback" id="inputSets">

				<span>전체답변 :<a href="sale.delivery.qna.go">${AllNum }</a>건
				</span> <span>답변대기중 :<a href="sale.delivery.una.go">${unANum }</a>건
				</span> <span>답변완료 :<a href="sale.delivery.aed.go">${AedNum }</a>건
				</span>

			</div>

			<div class="row mt">
				<div class="col-lg-12">
					<div class="content-panel" id="qnaTableDiv">
						<section id="unseen">
							<table class="table table-bordered table-striped table-condensed"
								id="qnaTable">
								<thead>
									<tr>
										<th>Question등록일</th>
										<th>답변여부</th>
										<th>분류</th>
										<th>상품주문번호</th>
										<th>Question제목</th>
										<th>상품번호</th>
										<th>상품명</th>
										<th>구매자id</th>
										<th>Answer등록일</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${qna != '0'}">
											<c:forEach items="${qna }" var="q">
												<tr class="tableTr" onclick="getQna(${q.qa_regNo})">
													<td>${q.qa_qRegDate}</td>
													<td>${q.qa_check}</td>
													<td>${q.qa_sort}</td>
													<td>${q.qa_orderNo}</td>
													<td>${q.qa_questionTitle}</td>
													<td>${q.qa_gdNo}</td>
													<td>${q.qa_gdName}</td>
													<td>${q.qa_csm_id}</td>
													<td>${q.qa_aRegDate}</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="9">조회된 내용이 없습니다</td>
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



					<!-- 답변패널 시작 -->
					<c:if test="${pageCount != 0}">
						<div class="col-md-6">
							<div class="content-panel">
								<table class="table">
									<thead>
										<tr>
											<th colspan="4">고객문의 내용보기</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>접수일</th>
											<td id="qRegDate"></td>
											<th>처리일</th>
											<td id="aRegDate"></td>
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
									</tbody>
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
					</c:if>
					<!-- 답변패널 끝-->


				</div>

			</div>


			<!-- /col-lg-4 -->

			<!-- /row -->
		</section>
		<!--/wrapper -->
	</section>
</body>
</html>