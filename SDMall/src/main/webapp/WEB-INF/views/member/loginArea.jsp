<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/login.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
//alert(${r});
	$(function() {
		
		 loginCheck();
		 
	});
</script>
<style type="text/css">
</style>
</head>
<body>

	<div class="loginTab">
		<h3>로그인</h3>${r }
		<h3>${r2 }</h3>
		<ul id="myTab" class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active">
				<a href="#csmloginArea" id="csm-tab" role="tab"	data-toggle="tab">구매자</a>
			</li>
			<li role="presentation" class="">
				<a href="#slloginArea" id="sl-tab" role="tab" data-toggle="tab">판매자</a>
			</li>
		</ul>
	</div>
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane fade active in" id="csmloginArea">
			<input id="loginCSM_id" name="csm_id" placeholder="아이디"><br>
			<input type="password" id="loginCSM_pw" name="csm_pw" placeholder="비밀번호">
			<button id="csm_LoginBtn">구매자 로그인</button>
		</div>
		
		<div class="tab-pane fade" id="slloginArea">
			<input id="loginSL_id" name="sl_id" placeholder="아이디"><br>
			<input type="password" id="loginSL_pw" name="sl_pw" placeholder="비밀번호">
			<button id="sl_LoginBtn">판매자 로그인</button>
		</div>
	</div>
	<div>
		<span>회원이 되시려면</span><br>
			<button type="button" onclick="goRegisterC();">구매자 회원가입</button>
			<button type="button" onclick="goRegisterS();">판매자 회원가입</button>
			<button type="button" onclick="goShop();">상품등록</button>
	</div>


</body>
</html>