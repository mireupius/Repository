<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/junyoung/member.css">
<script type="text/javascript" src="resources/js/validCheck.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
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
										<input class="input1 idInput" name="csm_id"
											value="${sessionScope.loginCustomer.csm_id }"
											readonly="readonly">
									</div>
								</td>
							</tr>
							<tr>
								<td class="memberTd1">기존 비밀번호</td>
								<td class="memberTd2">
									<div>
										<input class="input1 originPwInput" name="csm_originPw"
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
										<input class="input1 pwInput" name="csm_pw" type="password"
											placeholder="비밀번호 10~15자, 영문, 숫자조합" maxlength="15">
									</div>
								</td>
							</tr>

							<tr>
								<td class="memberTd1">새로운 비밀번호 재입력</td>
								<td class="memberTd2">
									<div>
										<input class="input1 pwOKInput" name="csm_pwOK"
											type="password" placeholder="비밀번호 재입력" maxlength="15">
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
										<input class="input1 nameInput" name="csm_name"
						readonly="readonly" value="${sessionScope.loginCustomer.csm_name }">
									</div>
								</td>
							</tr>
							<tr>
								<td class="memberTd1">생년월일</td>
								<td class="memberTd2">
									<div>
										<input class="input1 birthdayInput" type="date"
											name="csm_birthday">
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
										<input class="input1 phoneNoInput" name="csm_phoneNo" placeholder="휴대전화 -없이 입력"
										value="${sessionScope.loginCustomer.csm_phoneNo }"	maxlength="11">
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
										<input class="input1 emailFrontInput" name="csm_emailFront"
											value="${sessionScope.loginCustomer.csm_emailAddress }" placeholder="이메일" maxlength="30"> <select
											class="selectEmail emailAuto" name="csm_autoCompleteEmail">
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
							<button onclick="goCustomerPage();" class="regBtn" type="button">이전 페이지로 돌아가기</button>
						</div>
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