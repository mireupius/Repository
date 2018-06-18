<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/csmWithdrawCheck.js"></script>
<script type="text/javascript">
$(function() {
	
	connectCSMWithdrawCheckEvent();
	
	
});
</script>
</head>
<body>
	<div>
		<span>
			아이디 : <input readonly="readonly" class="idCheck" value="${sessionScope.loginCustomer.csm_id }"><br>
			비밀번호 : <input class="passwordCheck" type="password"><br>
			<a class="withdrawBtn">탈퇴하기</a>
		</span>
	</div>
</body>
</html>