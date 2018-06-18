<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script type="text/javascript">
$(function() {
	
	$(".withdrawBtn").click(function() {
		
		var id = $(".idCheck").val();
		var pw = $(".passwordCheck").val();
		
		$.ajax({
			
			 url : "customer.validCheck",
			 data : {csm_id : id},
			 success : function(json) {
				 var ok = json.customer.length;
	
				 if (ok == 1) {
					var csm_id = json.customer[0].csm_id;
					var csm_pw = json.customer[0].csm_pw;
					
					if(pw == csm_pw){
						
						location.href = "customer.withdraw.do?csm_id=" + id;
						
					}else if (pw != csm_pw) {
						alert("비밀번호가 틀렸습니다");
						
					}
					
				} else if(ok == 0){
					alert("계정 없음");
					
				}
				
			}
			 
		 });
		
	});
	
});



</script>
</head>
<body>

	<div>
		<span>
			아이디 : <input class="idCheck" value="${sessionScope.loginCustomer.csm_id }"><br>
			비밀번호 : <input class="passwordCheck" type="password"><br>
			<a class="withdrawBtn">탈퇴하기</a>
		</span>
	
	</div>

</body>
</html>