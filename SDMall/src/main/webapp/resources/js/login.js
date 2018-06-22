function loginCheck() {
	
	$("#csm_LoginBtn").click(function() {
		
		 var id = $("#loginCSM_id").val();
		 var pw = $("#loginCSM_pw").val();
		 
		 $.ajax({
			 
			 url : "customer.validCheck",
			 data : {csm_id : id},
			 success : function(json) {
				 var ok = json.customer.length;
	
				 if (ok == 1) {
					var csm_id = json.customer[0].csm_id;
					var csm_pw = json.customer[0].csm_pw;
					
					if(pw == csm_pw){
						
						location.href = "customer.login.do?csm_id=" + id;
						
					}else if (pw != csm_pw) {
						alert("비밀번호가 틀렸습니다");
						$("#loginCSM_pw").val("");
						$("#loginCSM_pw").focus();
						
					}
					
				} else if(ok == 0){
					alert("계정 없음");
					$("#loginCSM_id").val("");
					$("#loginCSM_pw").val("");
					$("#loginCSM_id").focus();
					
				}
				
			}
			 
		 });
		
	});
	
	$("#sl_LoginBtn").click(function() {
		
		var id = $("#loginSL_id").val();
		var pw = $("#loginSL_pw").val();
		
		$.ajax({
			
			url : "seller.validCheck",
			data : {sl_id : id},
			success : function(json) {
				var ok = json.seller.length;
				
				if (ok == 1) {
					var sl_id = json.seller[0].sl_id;
					var sl_pw = json.seller[0].sl_pw;
					
					if(pw == sl_pw){
						
						location.href = "seller.login.do?sl_id=" + id;
						
					}else if (pw != sl_pw) {
						alert("비밀번호가 틀렸습니다");
						$("#loginSL_pw").val("");
						$("#loginSL_pw").focus();
						
					}
					
				} else if(ok == 0){
					alert("계정 없음");
					$("#loginSL_id").val("");
					$("#loginSL_pw").val("");
					$("#loginSL_id").focus();
					
				}
				
			}
			
		});
		
	});
	
}
		 
 