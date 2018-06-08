<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table id="loginOKTb">
		<tr>
			<td>
				<table>
					<tr>
						<td style="color: #004D40; font-size: 14pt; font-weight: 800;">		
						${sessionScope.loginCustomer.csm_id }님
						</td>
					</tr>
					<tr>
						<td>
						${sessionScope.loginCustomer.csm_name }<br>
						<span style="font-size: 10pt;">좋은 하루 되세요</span>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="loginOKBtnTd" align="center">
				<button onclick="goLogout();" class="loginOKBtn">로그아웃</button>
				<button onclick="goUpdateMember();" class="loginOKBtn">정보수정</button>
				<button onclick="doWithdrawMember('${sessionScope.loginCustomer.csm_id}');" class="loginOKBtn">회원탈퇴</button>
			</td>
		</tr>
	</table>
</body>
</html>