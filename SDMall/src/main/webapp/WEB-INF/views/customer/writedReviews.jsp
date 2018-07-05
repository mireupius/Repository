<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources/junyoung/review.css" rel="stylesheet">
<script src="resources/js/go.js"></script>
</head>
<body>

	<c:forEach var="list" items="${reviewList }">

		<div>
			<table class="reviewTb0">
				<tr>
					<td align="justify">
						<h2>SD Mall Q&A</h2>
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
								<td class="reviewdTd2">
									<div>
										<input class="writeInput" value="${list.pr_gdName }">
									</div>
								</td>
							</tr>
							<tr>
								<td class="reviewdTd1">내용</td>
								<td class="reviewdTd2">
									<div>
										<textarea class="reviewTextArea"> ${list.pr_comment }</textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td class="reviewdTd1">별점</td>
								<td class="reviewdTd2">
									${list.pr_star }점
								</td>
							</tr>
							<tr>
								<td class="reviewdTd1">작성일</td>
								<td class="reviewdTd2">
									<div>
										<fmt:formatDate value="${list.pr_regDate }" dateStyle="long" />
									</div>
								</td>
							</tr>
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
	</c:forEach>

</body>
</html>