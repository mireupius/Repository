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
						<h2>�ϻ� ��Ȱ�� ��ģ ���, ���� �غ� �ϼ���.</h2> <br>
						<h3>
							TripSight�� ��� ������ �ִ��� ��⵵�� ���͵帳�ϴ�.<br> �������� ���� �����ϰ� �� �پ���
							������ ���� ������ ���忡�� �ִ��� ��ƺ����� ����߽��ϴ�.<br> �װ�, ȣ��, ����, ���� �� ���Ͻô�
							������ �Ͻ� �� �ֽ��ϴ�.<br> ȸ���� �ǽŴٸ� �ڱ⸸�� ��Ÿ�Ϸ� ���� ���� ��ȹ�� ����� �� �ֽ��ϴ�.
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
								<td class="memberTd1">���̵�</td>
								<td class="memberTd2"><input id="joinID" name="tm_id" class="in1">
								<span id="idBtn" >ID �Է�</span>
								</td>
							</tr>
							<tr>
								<td class="memberTd1">��й�ȣ</td>
								<td class="memberTd2">
								<input name="tm_pw" type="password"	class="in1"
								 placeholder="���� ��ҹ���, ��������"></td>
							</tr>
							<tr>
								<td class="memberTd1">��й�ȣ Ȯ��</td>
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
								<td class="memberTd1">�̸�</td>
								<td class="memberTd2"><input name="tm_name" class="in1"></td>
							</tr>
							<tr>
								<td class="memberTd1">�ּ�</td>
								<td class="memberTd2">
								<input readonly="readonly" id="a1" name="tm_postalCode" placeholder="�����ȣ" class="in1">
									<span id="addressBtn" >�����ȣ�˻�</span><br>
								<input readonly="readonly" id="a2" name="tm_address" placeholder="�ּ�" class="in1"><br>
								<input name="tm_addressDetail" placeholder="���ּ�" class="in1"></td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<td>
						<table class="memberTb3">
							<tr>
								<td class="memberTd1">����</td>
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
					<input type="submit" value="��������" class="createBtn"></td>
				</tr>
			</table>
		</div>
	</form>

</body>
</html>