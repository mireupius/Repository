<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
<link rel="stylesheet" href="resources/junyoung/member.css">
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/slUpdateCheck.js"></script>
<script type="text/javascript">
	$(function() {

		connectSLUpdateCheckEvent();

	});
</script>
</head>
<body>
	<form action="seller.register.do" name="regSLForm" method="post">

		<div>
			<table class="memberTb0">
				<tr>
					<td align="justify">
						<h2>SD Mall 회원정보변경</h2>
					</td>
				</tr>
			</table>
		</div>
		<div>
			<table class="memberTb1">
				<tr>
					<td align="center">
						<table class="memberTb3">
							<tr>
								<td class="memberTd1">아이디</td>
								<td class="memberTd2">
									<div>
										<input class="idInput" name="sl_id"
											value="${sessionScope.loginSeller.sl_id }"
											readonly="readonly" placeholder="아이디 8~12자, 영문, 숫자조합"
											maxlength="12">
									</div>
								</td>
							</tr>
							<tr>
								<td class="memberTd1">기존 비밀번호</td>
								<td class="memberTd2">
									<div>
										<input class="input1 originPwInput" name="sl_originPw"
											type="password" placeholder="비밀번호 10~15자, 영문, 숫자조합"
											maxlength="15">
										<div>
											<span class="promptTxt_originPw" style="display: none;"></span>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td class="memberTd1">새로운 비밀번호</td>
								<td class="memberTd2">
									<div>
										<input class="input1 pwInput" name="sl_pw" type="password"
											placeholder="비밀번호 10~15자, 영문, 숫자조합" maxlength="15">
									</div>
								</td>
							</tr>

							<tr>
								<td class="memberTd1">새로운 비밀번호 재입력</td>
								<td class="memberTd2">
									<div>
										<input class="input1 pwOKInput" name="sl_pwOK" type="password"
											placeholder="비밀번호 재입력" maxlength="15">
									</div>
									<div>
										<span class="promptTxt_pw" style="display: none;"></span>
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table class="memberTb3">
							<tr>
								<td class="memberTd1">이름</td>
								<td class="memberTd2">
									<div>
										<input class="nameInput" name="sl_coName"
											value="${sessionScope.loginSeller.sl_coName }"
											placeholder="상호명 2자이상" maxlength="10">
									</div>
									<div>
										<span class="promptTxt_name" style="display: none"></span>
									</div>
								</td>
							</tr>
							<tr>
								<td class="memberTd1">사업자등록번호</td>
								<td class="memberTd2">
									<div>
										<input class="coRegNoInput" name="sl_coRegNo"
											value="${sessionScope.loginSeller.sl_coRegNo }"
											placeholder="사업자등록번호(예: 123-45-67890)" maxlength="10">
									</div>
									<div>
										<span class="promptTxt_coRegNo" style="display: none"></span>
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<td>
						<table class="memberTb3">
							<tr>
								<td class="memberTd1">휴대전화</td>
								<td class="memberTd2">
									<div>
										<input class="phoneNoInput" name="sl_phoneNo"
											value="${sessionScope.loginSeller.sl_phoneNo }"
											placeholder="휴대전화 -없이 입력" maxlength="11">
									</div>
									<div>
										<span class="promptTxt_phoneNo"></span>
									</div>
								</td>
							</tr>
							<tr>
								<td class="memberTd1">이메일</td>
								<td class="memberTd2">
									<div>
										<input class="emailFrontInput" name="sl_emailFront"
											value="${sessionScope.loginSeller.sl_emailAddress }"
											placeholder="이메일" maxlength="30"> <select
											class="selectEmail emailAuto" name="sl_autoCompleteEmail">
											<option value>직접입력</option>
											<option value="@gmail.com">gmail.com</option>
											<option value="@hanmail.net">hanmail.net</option>
											<option value="@hotmail.com">hotmail.com</option>
											<option value="@nate.com">nate.com</option>
											<option value="@naver.com">naver.com</option>
										</select>
									</div>
									<div>
										<span class="promptTxt_email" style="display: none;"></span>
									</div>
								</td>
							</tr>

						</table>
					</td>
				</tr>
			</table>
		</div>
		<div>
			<table class="memberTb2">
				<tr>
					<td>
						<div>
							<input class="regBtn" type="submit" value="회원정보변경">
						</div>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>