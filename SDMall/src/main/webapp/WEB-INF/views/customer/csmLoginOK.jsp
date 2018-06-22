<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="loginOKTb">
		<tr>
			<td>
				<table>
					<tr>
						<td style="color: #004D40; font-size: 14pt; font-weight: 800;">
						<h1>${r }</h1>
						${sessionScope.loginCustomer.csm_id }님
						</td>
					</tr>
					<tr>
						<td>
						${sessionScope.loginCustomer.csm_name }<br>
						<span style="font-size: 10pt;">좋은 하루 되세요</span>
						</td>
					</tr>
					<tr>
						<td>
						${sessionScope.loginCustomer.csm_phoneNo }<br>
						<span style="font-size: 10pt;">좋은 하루 되세요</span>
						</td>
					</tr>
					<tr>
						<td>
							<a href="customer.logout.do">로그아웃</a>
							<a href="customer.update.go">회원정보변경</a>
							<a href="customer.withdraw.go">회원탈퇴</a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>