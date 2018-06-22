function connectCSMWithdrawCheckEvent() {
	

	
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
						
						var ok = confirm("정말 탈퇴하시겠습니까?");
						if (ok) {
							location.href = "customer.withdraw.do?csm_id=" + id;
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
