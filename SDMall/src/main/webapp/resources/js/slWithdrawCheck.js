function connectSLWithdrawCheckEvent() {

	
	$(".withdrawBtn").click(function() {
		
		var id = $(".idCheck").val();
		var pw = $(".passwordCheck").val();
		
		$.ajax({
			
			 url : "seller.validCheck",
			 data : {sl_id : id},
			 success : function(json) {
				 var ok = json.seller.length;
	
				 if (ok == 1) {
					var sl_id = json.seller[0].sl_id;
					var sl_pw = json.seller[0].sl_pw;
					
					if(pw == sl_pw){
						
						var ok = confirm("정말 탈퇴하시겠습니까?");
						if (ok) {
							location.href = "seller.withdraw.do?sl_id=" + id;
						}
						
					}else if (pw != sl_pw) {
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