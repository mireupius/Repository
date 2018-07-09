<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/junyoung/member.css">
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
		<table class="memberTb3">
			<tr>
				<td class="memberTd1">아이디</td>
				<td class="memberTd2"><input name="csm_id" readonly="readonly"
					class="idCheck" value="${sessionScope.loginCustomer.csm_id }">
				<input type="hidden" name="ms_csm_id"
					 value="${sessionScope.loginCustomer.csm_id }">
				<input type="hidden" name="csm_name"
					 value="${sessionScope.loginCustomer.csm_name }">
				</td>
			</tr>
			<tr>
				<td class="memberTd1">비밀번호 확인</td>
				<td class="memberTd2"><input class="passwordCheck"
					type="password"></td>
			</tr>
		</table>
		<table class="memberTb2">
			<tr>
				<td>
					<div>
						<a class="withdrawBtn">탈퇴하기</a>
					</div>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>