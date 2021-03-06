<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources/junyoung/review.css" rel="stylesheet">
<script src="resources/js/go.js"></script>
</head>
<body>
	<div>
		<table class="reviewTb0">
			<tr>
				<td>
					<h2>상품 리뷰</h2>
				</td>
			</tr>
		</table>
	</div>

	<div>
		<table class="reviewTb1">
			<tr>
				<td align="center">
					<table class="reviewTb2">
						<tr>
							<td class="reviewdTd1">상품명</td>
							<td class="reviewdTd1">내용</td>
							<td class="reviewdTd1">별점</td>
							<td class="reviewdTd1">작성일</td>
						</tr>
						<c:forEach var="list" items="${reviewList }">
							<tr>
								<td class="reviewdTd2">${list.pr_gdName }</td>
								<td class="reviewdTd2">${list.pr_comment }</td>
								<td class="reviewdTd2">${list.pr_star }점</td>
								<td class="reviewdTd2">${list.pr_regDate }</td>
							</tr>
						</c:forEach>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<div>
		<table class="reviewTb3">
			<tr>
				<td>
					<div>
						<button class="reviewBtn2" onclick="goCustomerPage();"
							type="button">이전으로</button>
					</div>
				</td>
			</tr>
		</table>
	</div>

</body>
</html>