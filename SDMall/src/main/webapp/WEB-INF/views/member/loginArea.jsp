<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/junyoung/login.css">
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript" src="resources/js/login.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

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
	<div class="container">

		<div class="loginTop">

			<div class="loginTab">
				<h3>SD MALL 로그인</h3>
				<ul id="myTab" class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#csmloginArea"
						id="csm-tab" role="tab" data-toggle="tab">구매자</a></li>
					<li role="presentation" class=""><a href="#slloginArea"
						id="sl-tab" role="tab" data-toggle="tab">판매자</a></li>
				</ul>
			</div>
			<div id="myTabContent" class="tab-content">
				<!-- 구매자 로그인  -->
				<div class="tab-pane fade active in" id="csmloginArea">
					<div>
						<input class="loginInput" id="loginCSM_id" name="csm_id"
							placeholder="아이디">
					</div>
					<div>
						<input class="loginInput" type="password" id="loginCSM_pw"
							name="csm_pw" placeholder="비밀번호">
					</div>

					<button class="loginBtn" id="csm_LoginBtn">구매자 로그인</button>
				</div>

				<!-- 판매자 로그인  -->
				<div class="tab-pane fade" id="slloginArea">
					<div>
						<input class="loginInput" id="loginSL_id" name="sl_id"
							placeholder="아이디"><br>
					</div>
					<div>
						<input class="loginInput" type="password" id="loginSL_pw"
							name="sl_pw" placeholder="비밀번호">
					</div>
					<button class="loginBtn" id="sl_LoginBtn">판매자 로그인</button>
				</div>
			</div>


			<div class="loginBottom">
				<h4>회원이 되시려면</h4>
				<div class="goRegDiv">
					<button class="goRegBtn" type="button" onclick="goRegisterC();">
					구매자 회원가입
					</button>

				</div>
				<div>
					<button class="goRegBtn" type="button" onclick="goRegisterS();">
					판매자  회원가입
					</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>