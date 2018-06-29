<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="resources/junyoung/star.css" rel="stylesheet">
<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/star.js"></script>
<script src="resources/js/go.js"></script>
</head>
<body>

<c:forEach var="list" items="${myQuestionList }">
	<div>
	여부 :  ${list.qa_check}
	상품명 : ${list.qa_gdName }
	상품명 : ${list.qa_questionTitle }
	질문내용 : ${list.qa_questionContent }
	작성일 : ${list.qa_qRegDate }
	</div>
</c:forEach>

<c:if test="${list.qa_answer != null }">
<c:forEach var="list" items="${myQuestionList }">
	<div>
	답변 : ${list.qa_answer }
	작성일 : ${list.qa_aRegDate }
	</div>
</c:forEach>
</c:if>

</body>
</html>