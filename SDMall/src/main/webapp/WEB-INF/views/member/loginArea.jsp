<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/go.js"></script>
<style type="text/css">

fieldset{
border: 0;
}

legend{
display: none;
line-height: 0;
}



</style>
</head>
<body>
 <h3>로그인</h3>${r }
<div>
	<form action="customer.login.do" method="post">
	 <fieldset>
	 	<legend>로그인폼</legend>
	 		<input name="csm_id" type="text" class="login_Input" maxlength="12" placeholder = "아이디 8~12자"><p>
	 		<input name="csm_pw" type="text" class="login_Input" maxlength="15" placeholder = "비밀번호 10~15자"><p>
	 		<button type="submit">로그인</button>
	 </fieldset>
	</form>
</div>
<div>
	<span>회원이 되시려면</span><p>
	<button type="button" onclick="goRegisterC();">구매자 회원가입</button>
	<button type="button" onclick="goRegisterS();">판매자 회원가입</button>
	<button type="button" onclick="goRegisterP();">상품등록</button>
</div>
</body>
</html>