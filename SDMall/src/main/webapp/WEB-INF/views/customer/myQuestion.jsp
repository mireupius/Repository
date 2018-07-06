<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
					<h2>MY Q&A</h2>
				</td>
			</tr>
		</table>
	</div>
	<!-- 내 질문 보여주기 -->
	<c:forEach var="list" items="${myQuestionList }">
		<table class="reviewTb1">
			<tr>
				<td align="center">
					<table class="reviewTb2">
						<tr>
							<td class="reviewdTd1">여부</td>
							<td class="reviewdTd2">${list.qa_check}</td>
						</tr>
						<tr>
							<td class="reviewdTd1">상품명</td>
							<td class="reviewdTd2">${list.qa_gdName }</td>
						</tr>
						<tr>
							<td class="reviewdTd1">제목</td>
							<td class="reviewdTd2">${list.qa_questionTitle }</td>
						</tr>
						<tr>
							<td class="reviewdTd1">질문내용</td>
							<td class="reviewdTd2">${list.qa_questionContent }</td>
						</tr>
						<tr>
							<td class="reviewdTd1">작성일</td>
							<td class="reviewdTd2">${list.qa_qRegDate }</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<!-- 판매자 답변 보여주기 -->
		<c:if test="${list.qa_answer != null }">
			<c:forEach var="list" items="${myQuestionList }">
				<table class="reviewTb1">
					<tr>
						<td align="center">
							<table class="reviewTb2">
								<tr>
									<td class="reviewdTd1">답변</td>
									<td class="reviewdTd2">${list.qa_answer }</td>
								</tr>
								<tr>
									<td class="reviewdTd1">작성일</td>
									<td class="reviewdTd2">${list.qa_aRegDate }</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</c:forEach>
		</c:if>
	</c:forEach>
</body>
</html>