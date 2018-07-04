<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {

		var ms_grade = $(".ms_grade").text();

		if (ms_grade = '실버') {

			$('.upRow').css("background-color", "#c0c0c0");

		} else if (ms_grade = '골드') {
			$('.upRow').css("background-color", "#e7bd42");

		} else {
			$('.upRow').css("background-color", "#be4f62");
		}

	});
</script>
</head>
<body>
	<table class="memberShipTable">
		<tr>
			<td colspan="2">
				<table class="upRow">
					<tr>
						<td class="ms_grade msTd">${memberStatus.ms_grade}</td>
						<td class="msTd">${sessionScope.loginCustomer.csm_name}님</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="msTd">적립금 : ${memberStatus.ms_point} point</td>
			<td class="msTd">누적구매금 : ${memberStatus.ms_totalBuy} 원</td>
		</tr>
	</table>
</body>
</html>