<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- IE호환모들를 지정 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 반응형 웹페이지를 적용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- IE9 버전 이하의 브라우저에서 반응형 웹을 적용 -->
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<!-- jquery -->
<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap/bootstrap.min.js"></script>
<title>Goods</title>
</head>
<body>
	<table class="gdTb">
		<tr>
			<td style="background-color: gray;" data-toggle="collapse"
				href="#collapse1" aria-expanded="false" aria-controls="collapse1"
				colspan="2">표시설정</td>
		</tr>
		<tr class="collapse" id="collapse1">
			<td class="gdTd1">상품분류 선택</td>
			<td class="gdTd2"><br> <br> <br> <br>
				<table id="gdTb2">
					<tr>
						<td class="gdinTdleft gdinTdBgC" align="center">대분류</td>
						<td class="gdinTdcenter gdinTdBgC" align="center">중분류</td>
						<td class="gdinTdright gdinTdBgC" align="center">소분류</td>
					</tr>
					<tr>
						<td class="gdinTdleft gdinTdBottom height"><div>
								<ul>
									<li>s</li>
								</ul>
							</div></td>
						<td class="gdinTdcenter gdinTdBottom height">
							<div>
								<ul>
									<li>s</li>
								</ul>
							</div>
						</td>
						<td class="gdinTdright gdinTdBottom height">
							<div>
								<ul>
									<li>s</li>
								</ul>
							</div>
						</td>
					</tr>
				</table> <br> <br> <br> <br>


				<table id="gdTb2">
					<tr>
						<td class="gdinTdleft gdinTdBgC" align="center">대분류</td>
						<td class="gdinTdcenter gdinTdBgC" align="center">중분류</td>
						<td class="gdinTdright gdinTdBgC" align="center">소분류</td>
					</tr>
					<tr>
						<td class="gdinTdleft gdinTdBottom height"><div>
								<ul>
									<li>s</li>
								</ul>
							</div></td>
						<td class="gdinTdcenter gdinTdBottom height">
							<div>
								<ul>
									<li>s</li>
								</ul>
							</div>
						</td>
						<td class="gdinTdright gdinTdBottom height">
							<div>
								<ul>
									<li>s</li>
								</ul>
							</div>
						</td>
					</tr>
				</table></td>
		</tr>
	</table>

	<div class="gdTb3" data-toggle="collapse" href="#collapse2"
		aria-expanded="false" aria-controls="collapse2">
		<h2 style="background-color: gray;">기본정보</h2>
	</div>
	<div class="collapse" id="collapse2">
		<div>
			<table class="gdTb3">
				<tbody>
					<tr>
						<td class="gdTd1">상품명</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">모델명</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">상품코드</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">상품상세설명</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">검색어설정</td>
						<td class="gdTd2"><input></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="gdTb3" data-toggle="collapse" href="#collapse3"
		aria-expanded="false" aria-controls="collapse3">
		<h2 style="background-color: gray;">판매정보</h2>
	</div>
	<div class="collapse" id="collapse3">
		<div>
			<table class="gdTb3">
				<tbody>
					<tr>
						<td class="gdTd1">소비자가 판매가</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">상품코드</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">상품상세설명</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">검색어설정</td>
						<td class="gdTd2"><input></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="gdTb3" data-toggle="collapse" href="#collapse4"
		aria-expanded="false" aria-controls="collapse4">
		<h2 style="background-color: gray;">옵션/재고</h2>
	</div>
	<div class="collapse" id="collapse4">
		<div>
			<table class="gdTb3">
				<tbody>
					<tr>
						<td class="gdTd1">옵션명</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">옵션재고</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">옵션가격</td>
						<td class="gdTd2"><input></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
		<div class="gdTb3" data-toggle="collapse" href="#collapse5"
		aria-expanded="false" aria-controls="collapse5">
		<h2 style="background-color: gray;">이미지</h2>
	</div>
	<div class="collapse" id="collapse5">
		<div>
			<table class="gdTb3">
				<tbody>
					<tr>
						<td class="gdTd1">옵션명</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">옵션재고</td>
						<td class="gdTd2"><input></td>
					</tr>
					<tr>
						<td class="gdTd1">옵션가격</td>
						<td class="gdTd2"><input></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>