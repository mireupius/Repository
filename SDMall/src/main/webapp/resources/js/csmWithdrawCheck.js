function connectCSMWithdrawCheckEvent() {
	

//	구매자 회원탈퇴시 유효성 검사 및 회원탈퇴 컨트롤러로 보내기
	
	$(".withdrawBtn").click(function() {
		
		var id = $(".idCheck").val();
		var pw = $(".passwordCheck").val();
		var ms_csm_id = $('input[name = ms_csm_id]').val();
		
		
		$.ajax({
			
			 url : "customer.validCheck",
			 data : {csm_id : id},
			 success : function(json) {
				 var ok = json.customer.length;
	
				 if (ok == 1) {
					var csm_id = json.customer[0].csm_id;
					var csm_pw = json.customer[0].csm_pw;
					
					if(pw == csm_pw){
						
						var ok = confirm("정말 탈퇴하시겠습니까?");
						if (ok) {
							location.href = "customer.withdraw.do?csm_id=" + id + "&ms_csm_id=" + ms_csm_id;
						}
						
					}else if (pw != csm_pw) {
						alert("비밀번호가 틀렸습니다");
						$(".passwordCheck").val("");
						$(".passwordCheck").focus();
						
						
					}
					
				} else if(ok == 0){
					alert("계정 없음");
					
				}
				
			}
			 
		 });
		
	});
}
