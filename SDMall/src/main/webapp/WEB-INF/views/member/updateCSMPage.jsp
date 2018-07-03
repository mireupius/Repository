<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/csmUpdateCheck.js"></script>
<script type="text/javascript">
	$(function() {
		
		connectCSMUpdateCheckEvent();

	});

</script>
</head>
<body>
	<form action="customer.update.do" name="updateCSMForm" method="post">
		<div>
			<h2>SD Mall 회원정보변경</h2>
			<br>
		</div>
		<div>
			<span>
				<input class="idInput" name="csm_id" value="${sessionScope.loginCustomer.csm_id }" readonly="readonly">
				<br>
			</span>
		</div>
		<div>
			<span>
				<input class="originPwInput" name="csm_originPw" type="password"
				placeholder="비밀번호 10~15자, 영문, 숫자조합" maxlength="15"><br>
			</span>
			<span class="promptTxt_originPw" style="display: none;"></span> 
			<span>
				<input class="pwInput" name="csm_pw" type="password"
				placeholder="비밀번호 10~15자, 영문, 숫자조합" maxlength="15"><br>
			</span>
			<span> <input class="pwOKInput" name="csm_pwOK" type="password"
				placeholder="비밀번호 재입력" maxlength="15"><br>
			</span>
			<span class="promptTxt_pw" style="display: none;"></span> 
		</div>
		<div>
			<span><input class="nameInput" name="csm_name"
						readonly="readonly" value="${sessionScope.loginCustomer.csm_name }"><br></span>
		</div>
		<div>
		<span>
		<fmt:formatDate value="${sessionScope.loginCustomer.csm_birth }" dateStyle="long"/>
		</span>
		<span class="promptTxt_birthday"></span>
		</div>
		<div>
			<span> <input class="phoneNoInput" name="csm_phoneNo" placeholder="휴대전화 -없이 입력"
						value="${sessionScope.loginCustomer.csm_phoneNo }"	maxlength="11"><br>
			</span>
			<span class="promptTxt_phoneNo"></span>
		</div>
		<div>	
		<span> <input class="emailFrontInput" name="csm_emailFront" placeholder="이메일"
		value="${sessionScope.loginCustomer.csm_emailAddress }"
		maxlength="30"> </span>
			<select class="emailAuto" name="csm_autoCompleteEmail">
				<option value>직접입력</option>
				<option value="@gmail.com">gmail.com</option>
				<option value="@hanmail.net">hanmail.net</option>
				<option value="@hotmail.com">hotmail.com</option>
				<option value="@nate.com">nate.com</option>
				<option value="@naver.com">naver.com</option>
			</select>
			<span class="promptTxt_email" style="display: none;"></span>
		</div>
		<div>
			<input type="submit" value="회원정보변경">
		</div>
	</form>
</body>
</html>