<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	${param.daumcontent}
	<table border="1" align="center">
		<c:forEach var="tt" items="${tent }">
			<tr>
				<td>${tt.gt_no}</td>
				<td>${tt.gt_gdno}</td>
				<td>${tt.gt_mdlname}</td>
				<td>${tt.gt_maker}</td>
				<td>${tt.gt_brand}</td>
				<td>${tt.gt_mfd}</td>
				<td>${tt.gt_exp}</td>
				<td>${tt.gt_material}</td>
				<td>${tt.gt_weight}</td>
				<td>${tt.gt_volume}</td>
				<td>${tt.gt_origin}</td>
				<td>${tt.gt_stock}</td>
				<td>${tt.gt_keyword}</td>
				<td>${tt.gt_detail}</td>
			</tr>
		</c:forEach>

	</table>



</body>
</html>