<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/slRegisterCheck.js"></script>
<script type="text/javascript">
	$(function() {
		
		connectSLRegisterCheckEvent();
	
	});

</script>
</head>
<body>
	<form action="seller.register.do" name="regSLForm" method="post">
		<div>
			<h2>SD Mall 판매자 회원가입</h2>
			<br>
		</div>
		<div>
			<span>
				<input class="idInput" name="sl_id" placeholder="아이디 8~12자, 영문, 숫자조합" maxlength="12">
			</span>
			<button type="button" class="validateBtn">중복확인</button><br>
			<span class="promptTxt_id" style="display: none;"></span>
		</div>
		<div>
			<span>
				<input class="pwInput" name="sl_pw" type="password"
				placeholder="비밀번호 10~15자, 영문, 숫자조합" maxlength="15"><br>
			</span>
			<span> <input class="pwOKInput" name="sl_pwOK" type="password"
				placeholder="비밀번호 재입력" maxlength="15"><br>
			</span>
			<span class="promptTxt_pw" style="display: none;"></span> 
		</div>
		<div>
			<span>
				<input class="nameInput" name="sl_coName" placeholder="이름 2자이상" maxlength="10"><br>
			</span>
			<span class="promptTxt_name" style="display: none"></span>
		</div>
		<div>
			<span>
				<input class="coRegNoInput" name="sl_coRegNo" placeholder="사업자등록번호(예: 123-45-67890)" maxlength="10"><br>
			</span>
			<span class="promptTxt_coRegNo" style="display: none"></span>
		</div>
		<div>
			<span>
				<input class="phoneNoInput"	name="sl_phoneNo" placeholder="휴대전화 -없이 입력" maxlength="11"><br>
			</span>
			<span class="promptTxt_phoneNo"></span>
		</div>
		<div>	
			<span>
				<input class="emailFrontInput" name="sl_emailFront" placeholder="이메일" maxlength="30"> </span>
				<select class="emailAuto" name="sl_autoCompleteEmail">
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
			<input type="submit" value="회원가입">
		</div>
	</form>
</body>
</html>