<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="join.do" name="joinForm" onsubmit="return joinCheck();"
		method="post" enctype="multipart/form-data">
		<div>
			<table class="memberTb0">
				<tr>
					<td align="justify">
						<h2>일상 생활에 지친 당신, 떠날 준비를 하세요.</h2> <br>
						<h3>
							TripSight는 모든 여행을 최대한 즐기도록 도와드립니다.<br> 임직원이 직접 여행하고 온 다양한
							지역을 같은 여행자 입장에서 최대한 담아보려고 노력했습니다.<br> 항공, 호텔, 음식, 관광 등 원하시는
							선택을 하실 수 있습니다.<br> 회원이 되신다면 자기만의 스타일로 직접 여행 계획을 만드실 수 있습니다.
						</h3> <br>
					</td>
				</tr>
			</table>
		</div>
		<div id="joinDiv1">
			<table class="memberTb1">
				<tr>
					<td>
						<table class="memberTb3">
							<tr>
								<td class="memberTd1">아이디</td>
								<td class="memberTd2"><input id="joinID" name="tm_id" class="in1">
								<span id="idBtn" >ID 입력</span>
								</td>
							</tr>
							<tr>
								<td class="memberTd1">비밀번호</td>
								<td class="memberTd2">
								<input name="tm_pw" type="password"	class="in1"
								 placeholder="영문 대소문자, 숫자조합"></td>
							</tr>
							<tr>
								<td class="memberTd1">비밀번호 확인</td>
								<td class="memberTd2"><input name="tm_pwOK"
									type="password" class="in1"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table class="memberTb3">
							<tr>
								<td class="memberTd1">이름</td>
								<td class="memberTd2"><input name="tm_name" class="in1"></td>
							</tr>
							<tr>
								<td class="memberTd1">주소</td>
								<td class="memberTd2">
								<input readonly="readonly" id="a1" name="tm_postalCode" placeholder="우편번호" class="in1">
									<span id="addressBtn" >우편번호검색</span><br>
								<input readonly="readonly" id="a2" name="tm_address" placeholder="주소" class="in1"><br>
								<input name="tm_addressDetail" placeholder="상세주소" class="in1"></td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<td>
						<table class="memberTb3">
							<tr>
								<td class="memberTd1">사진</td>
								<td class="memberTd2"><input type="file" name="tm_img"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		<div id="joinDiv2">
			<table class="memberTb2">
				<tr>
					<td class="createBtnTd" align="center">
					<input type="submit" value="계정생성" class="createBtn"></td>
				</tr>
			</table>
		</div>
	</form>

</body>
</html>