<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
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
=======

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		
	});



</script>
<style type="text/css">

fieldset{
border: 0;
}

legend{
display: none;
line-height: 0;
}

ul, li{
list-style: none;
float: left;

}

li{
width: 50px;
position: relative;
}

li.on{
padding-right: 20px;

}



</style>
</head>
<body>
 <h3>로그인</h3>${r }
<div>
	<ul>
		<li class="on"><a href="" id="csmLogin">구매자</a></li>
		<li><a href="" id="slLogin">판매자</a></li>
	</ul>
		
	<form action="customer.login.do" method="post" id="csmf" style="display:block;">
	 <fieldset>
	 	<legend>로그인폼</legend>
	 		<input name="csm_id" type="text" class="login_Input" maxlength="12" placeholder = "아이디 8~12자"><p>
	 		<input name="csm_pw" type="text" class="login_Input" maxlength="15" placeholder = "비밀번호 10~15자"><p>
	 		<button type="submit">구매자로그인</button>
	 </fieldset>
	</form>
	
	<form action="seller.login.do" method="post" id="slf" style="display: none;">
	 <fieldset>
	 	<legend>로그인폼</legend>
	 		<input name="sl_id" type="text" class="login_Input" maxlength="12" placeholder = "아이디 8~12자"><p>
	 		<input name="sl_pw" type="text" class="login_Input" maxlength="15" placeholder = "비밀번호 10~15자"><p>
	 		<button type="submit">판매자로그인</button>
	 </fieldset>
	</form>
</div>
<div>
	<span>회원이 되시려면</span><p>
	<button type="button" onclick="goRegisterC();">구매자 회원가입</button>
	<button type="button" onclick="goRegisterS();">판매자 회원가입</button>
	<button type="button" onclick="goShop();">상품등록</button>
	
</div>
<div>
${sessionScope.loginMember.csm_id }
${sessionScope.loginMember.csm_name }
${sessionScope.loginMember.csm_phoneNo }
${sessionScope.loginMember.csm_emailAddress }
${sessionScope.loginMember.csm_birth }
</div>



>>>>>>> refs/remotes/origin/Oh
</body>
</html>