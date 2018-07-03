function connectCSMUpdateCheckEvent() {

		var pwField = document.updateCSMForm.csm_pw;	
		var pwOKField = document.updateCSMForm.csm_pwOK;
		var nameField = document.updateCSMForm.csm_name;
		var phoneNoField = document.updateCSMForm.csm_phoneNo;
		var birthdayField = document.updateCSMForm.csm_birthday;
		var emailFrontField = document.updateCSMForm.csm_emailFront;
		
		// 비밀번호 Event
		$('.originPwInput').keyup(function(e) {
			//alert("sdf");
			var id = $('.idInput').val();
			var originPw = $(".originPwInput").val();
			
			
			//alert(id);
			
			$.ajax({
				url : "customer.validCheck",
				data : {csm_id : id},
				success : function(json) {
					
					var ok = json.customer.length;
					
					 if (ok == 1) {
							var csm_id = json.customer[0].csm_id;
							var csm_pw = json.customer[0].csm_pw;
							
							if(originPw == csm_pw){
								
								$(".promptTxt_originPw").text("현재 비밀번호와 일치합니다")
								.css("color", "blue").css("display", "block");
								
							}else if (originPw != csm_pw) {
								
								$(".promptTxt_originPw").text("현재 비밀번호와 일치하지 않습니다")
								.css("color", "red").css("display", "block");
								
							}
							
						}
				}
			});
		});
		
		$('.pwInput').keyup(function(e) {
			
			if (isEmpty(pwField)
					|| lessThan(pwField, 10)
					|| notContains(pwField, "1234567890")
					|| notContains(pwField, "qwertyuiopasdfghjklzxcvbnm") != false) {
				
				$(".promptTxt_pw").text("비밀번호는 숫자, 영문 조합 10~15자리로 입력해주십시오")
				.css("color", "red").css("display", "block");

			}else {
				$(".promptTxt_pw").empty();
			}
			
		});
		
		$('.pwOKInput').keyup(function(e) {
		
				if (notEquals(pwField, pwOKField) != false) {
					$(".promptTxt_pw").text("새로 입력하신 비밀번호와 일치하지 않습니다")
					.css("color", "red").css("display", "block");
				}else {
					$(".promptTxt_pw").text("새로 입력하신 비밀번호와 일치합니다")
					.css("color", "blue").css("display", "block");
				}	
				
		});
		
		
		// 생년월일 Event
		
		$('.birthdayInput').keyup(function(e) {

			if (isEmpty(birthdayField)|| lessThan(birthdayField, 8) != false) {
				$(".promptTxt_birthday").text("생년월일을 입력해주세요")
				.css("color", "red").css("display", "block");
			}else {
				$(".promptTxt_birthday").empty();
			}
	
		});
		
		// 휴대전화 Event
		
		$('.phoneNoInput').keyup(function(e) {

			if (isEmpty(phoneNoField) || lessThan(phoneNoField, 11) != false) {
				$(".promptTxt_phoneNo").text("연락처를 입력해주세요")
				.css("color", "red").css("display", "block");
			}else {
				$(".promptTxt_phoneNo").empty();
			}
	
		});
		
		// 이메일 Event
		
		$('.emailFrontInput').keyup(function(e) {

			if (isEmpty(emailFrontField) || containsHangul(emailFrontField) != false) {
				$(".promptTxt_email").text("이메일을 입력해주세요")
				.css("color", "red").css("display", "block");
			}else {
				$(".promptTxt_email").empty();
			}

		});
		
}