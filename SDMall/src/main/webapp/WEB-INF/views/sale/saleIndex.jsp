<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/sale/delivery.css">
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/bootstrap/bootstrap-theme.min.css">
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript"
	src="resources/js/bootstrap/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<!-- 	<div class="row" id="mainDiv"> -->

		<div class="col-md-12" id="login">login</div>


		<div class="col-md-2" id="navigator"> 
			<jsp:include page="${saleNav }"></jsp:include>
		</div>

		<div class="col-md-10" id="content">
			<jsp:include page="${saleContent }"></jsp:include>
		</div>

	<!-- 	</div> -->


</body>
</html>