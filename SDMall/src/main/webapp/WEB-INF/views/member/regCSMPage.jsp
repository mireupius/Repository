<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
<form action="customer.register.do" name="regCSMForm" method="get">
		<div>
			<h2>SD Mall 회원가입</h2>
			<br>
		</div>
		<div>
			<span>
			<input name="csm_id" placeholder="아이디 8~12자, 영문, 숫자조합" maxlength="12">
			</span>
			<button type="button" id="validateId">중복확인</button><br>
			<p class="promptTxt" style="display: none;">중복확인 버튼을 눌러주십시오</p>
			<span>
			<input name="csm_pw" type="password" placeholder="비밀번호 10~15자, 영문, 숫자조합" maxlength="15"><br>
			</span>
			<span>
			<input name="csm_pwOK" type="password" placeholder="비밀번호 재입력" maxlength="15"><br>
			</span>
			<p class="promptTxt" style="display: none;">입력하신 비밀번호와 일치하지 않습니다</p>
			<span>
			<input name="csm_name" placeholder="이름 2자이상" maxlength="10"><br>
			</span>
			<p class="promptTxt" style="display: none;">이름을 입력해주세요</p>
			<span>
			<input name="csm_birthday" placeholder="생년월일(예: 19910101)" maxlength="8"><br>
			</span>
			<p class="promptTxt" style="display: none;">생년월일을 입력해주세요</p>
			<span>
			<input name="csm_phoneNo" placeholder="휴대전화 -없이 입력" maxlength="11"><br>
			</span>
			<p class="promptTxt" style="display: none;">휴대전화를 입력해주세요</p>
			<span>
			<input name="csm_emailFront" placeholder="이메일" maxlength="30">
			</span>
			<select name="csm_autoCompleteEmail">
				<option value>직접입력</option>
				<option value="@gmail.com">gmail.com</option>
				<option value="@hanmail.net">hanmail.net</option>
				<option value="@hotmail.com">hotmail.com</option>
				<option value="@nate.com">nate.com</option>
				<option value="@naver.com">naver.com</option>
			</select>
			<p class="promptTxt" style="display: none;">이메일을 입력해주세요</p>
		</div>
		<div>
			<input type="submit" value="회원가입">
		</div>
	</form>
</body>
</html>