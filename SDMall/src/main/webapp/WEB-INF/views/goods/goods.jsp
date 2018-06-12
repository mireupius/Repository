<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<!-- IE호환모들를 지정 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 반응형 웹페이지를 적용 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- IE9 버전 이하의 브라우저에서 반응형 웹을 적용 -->
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<!-- jquery -->
<script src="resources/js/bootstrap/bootstrap.min.js"></script>

<!-- 다음 에디터 -->
<link rel=stylesheet type=text/css
	href="${pageContext.request.contextPath}/resources/daumeditor/css/editor.css"
	charset=utf-8 />
<script type=text/javascript charset=utf-8
	src="${pageContext.request.contextPath}/resources/daumeditor/js/editor_loader.js"></script>
<!-- 도로아미 타불 -->
<script type="text/javascript">
function saveContent() {
    Editor.save(); // 이 함수를 호출하여 글을 등록하면 된다.
}
</script>

<title>Goods</title>
<style type="text/css">
h3 {
	margin-bottom: 0;
	margin-top: 0;
	font-weight: 400;
	font-size: 14pt;
	color: #fff;
	background-color: #848898;
}

.imgli {
	float: left;
	width: 200px;
}
</style>

</head>
<body>
	<div class="gdTb3" data-toggle="collapse" href="#collapse1"
		aria-expanded="false" aria-controls="collapse1">
		<h3>표시설정</h3>
	</div>
	<div class="collapse" id="collapse1">
		<div>
			<table class="gdTb3">
				<tbody>
					<tr>
						<td class="gdTd1">상품분류 선택</td>
						<td class="gdTd2">
							<table id="gdTb2">
								<tr>
									<td class="gdinTdleft gdinTdBgC" align="center">대분류</td>
									<td class="gdinTdcenter gdinTdBgC" align="center">중분류</td>
									<td class="gdinTdright gdinTdBgC" align="center">소분류</td>
								</tr>
								<tr>
									<td class="gdinTdleft gdinTdBottom height">
										<div>
											<ul>
												<c:forEach var="ctg" items="${category }">
													<c:if test="${ctg.ct_clf == '1'}">
														<li id="ct1">${ctg.ct_clfname}</li>
													</c:if>
												</c:forEach>
											</ul>
										</div>
									</td>
									<td class="gdinTdcenter gdinTdBottom height">
										<div>
											<ul>
												<c:forEach var="ctg" items="${category }">
													<c:if test="${ctg.ct_clf == '2'}">
														<li>${ctg.ct_clfname}</li>
													</c:if>
												</c:forEach>
											</ul>
										</div>
									</td>
									<td class="gdinTdright gdinTdBottom height">
										<div>
											<ul>
												<c:forEach var="ctg" items="${category }">
													<c:if test="${ctg.ct_clf == '3'}">
														<li>${ctg.ct_clfname}</li>
													</c:if>
												</c:forEach>
											</ul>
										</div>
									</td>
								</tr>
							</table> <br> <br> <br>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="gdTb3" data-toggle="collapse" href="#collapse2"
		aria-expanded="false" aria-controls="collapse2">
		<h3>기본정보</h3>
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
						<td class="Rhf">검색어설정</td>
						<td class="gdTd2"><input></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="gdTb3" data-toggle="collapse" href="#collapse3"
		aria-expanded="false" aria-controls="collapse3">
		<h3>판매정보</h3>
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
						<td class="gdTd2">
							<!-- 에디터 시작 -->
							<div>
								<form name="tx_editor_form" id="tx_editor_form"
									action="editor.do" method="post"
									accept-charset="utf-8">
								
									<!-- 에디터프레임호출 영역 -->
									<div id="editor_frame">
										<!-- 다음에디터 넣기 -->
										<jsp:include page="../daumeditor/editor.jsp"></jsp:include>
										<script type="text/javascript">
											//'수정하기' 모드일 때, 다음과 같이 데이터를 다음오픈에디터에 대입할 수 있다.
											if ('${board!=null}' == 'true')
												Editor.modify({'content' : '${board.daumcontent}'});
										</script>

									</div>

									<!-- 실제 값이 담겨져서 넘어갈 textarea 태그 -->
									<input type="button" id="save_button" value="내용전송" onclick="saveContent();"/>
								</form>
							</div> <!-- 에디터 끝 -->
						</td>
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
		<h3>옵션/재고</h3>
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
		<h3>이미지</h3>
	</div>
	<div class="collapse" id="collapse5">
		<div>
			<table class="gdTb3">
				<tbody>
					<tr>
						<td class="gdTd1">이미지 등록</td>
						<td class="gdTd2">
							<div>
								<ul>
									<li class="imgli"><span>상세이미지</span><br> <span>권장
											500px * 500px</span><br> <span><input type="file">
									</span></li>
									<li class="imgli"><span>목록 이미지</span><br> <span>권장
											300px * 300px</span><br></li>
									<li class="imgli"><span>작은목록 이미지</span><br> <span>권장
											100px * 100px</span><br></li>
									<li class="imgli"><span>축소 이미지</span><br> <span>권장
											220px * 220px</span><br></li>
								</ul>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>