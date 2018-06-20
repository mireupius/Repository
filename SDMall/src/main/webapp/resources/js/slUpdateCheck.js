function connectSLUpdateCheckEvent() {

		var pwField = document.updateSLForm.sl_pw;	
		var pwOKField = document.updateSLForm.sl_pwOK;
		var coNameField = document.updateSLForm.sl_coName;
		var coRegNoField = document.updateSLForm.sl_coRegNo;
		var phoneNoField = document.updateSLForm.sl_phoneNo;
		var emailFrontField = document.updateSLForm.sl_emailFront;
		
		// 비밀번호 Event
		$('.originPwInput').keyup(function(e) {
			
			var id = $('.idInput').val();
			var originPw = $(".originPwInput").val();
			
			$.ajax({
				url : "seller.validCheck",
				data : {sl_id : id},
				success : function(json) {
					
					var ok = json.seller.length;
					
					 if (ok == 1) {
							var sl_id = json.seller[0].sl_id;
							var sl_pw = json.seller[0].sl_pw;
							
							if(originPw == sl_pw){
								
								$(".promptTxt_originPw").text("현재 비밀번호와 일치합니다")
								.css("color", "blue").css("display", "block");
								
							}else if (originPw != sl_pw) {
								
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
		
		
		// 상호명 Event
		
		$('.nameInput').keyup(function(e) {

			if (isEmpty(coNameField) || lessThan(coNameField, 2) != false) {
				$(".promptTxt_name").text("이름을 입력해주세요")
				.css("color", "red").css("display", "block");
			}else {
				$(".promptTxt_name").empty();
			}
	
		});
		
		// 사업자등록번호 Event
		
		$('.coRegNoInput').keyup(function(e) {

			if (isEmpty(coRegNoField)|| lessThan(coRegNoField, 10) != false) {
				$(".promptTxt_coRegNo").text("사업자등록번호를 입력해주세요")
				.css("color", "red").css("display", "block");
			}else {
				$(".promptTxt_coRegNo").empty();
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

			if (isEmpty(emailFrontField) != false) {
				$(".promptTxt_email").text("이메일을 입력해주세요")
				.css("color", "red").css("display", "block");
			}else {
				$(".promptTxt_email").empty();
			}

		});
		
}