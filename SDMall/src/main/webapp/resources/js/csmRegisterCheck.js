// 구매자 회원등록 event
function connectCSMRegisterCheckEvent() {

		var idField = document.regCSMForm.csm_id;
		var pwField = document.regCSMForm.csm_pw;	
		var pwOKField = document.regCSMForm.csm_pwOK;
		var nameField = document.regCSMForm.csm_name;
		var phoneNoField = document.regCSMForm.csm_phoneNo;
		var birthdayField = document.regCSMForm.csm_birthday;
		var emailFrontField = document.regCSMForm.csm_emailFront;

		// keyup이니까 키보드가 눌러있을 때는 그냥 다 반복시켜버림
		// 클릭도 keyup적용되니 별도의 메소드로..
			
		
		// 아이디 Event	
		$(".idInput").keyup(function(e) {
			
			var id = $(".idInput").val();
			
				if (id != null) {
					$('.promptTxt_id').text("중복확인버튼을 눌러주십시오")
					.css("color", "red").css("display", "block");
				}
				
				if (isEmpty(idField) || containsHangul(idField) != false) {
					$(".promptTxt_id").text("아이디 필수, 한글 금지")
					.css("color", "red").css("display", "block");
					$(".idInput").focus();
					
				}
				
		});

		$(".validateBtn").click(function() {
				var id = $(".idInput").val();
				
				$.ajax({
					
					url : "customer.validCheck",
					data : {csm_id : id},
					success : function(json) {
							
						var ok = json.customer.length;
						
						if (ok == 1) {
							$('.promptTxt_id').text("중복된 아이디 입니다")
							.css("color", "red").css("display", "block");;
						}else if (ok == 0) {
							$('.promptTxt_id').text("사용가능한 아이디 입니다")
							.css("color", "blue").css("display", "block");
						}
	
					}
							
				});

			});
		
		$(".idInput").click(function() {
			$(".promptTxt_id").empty();
		});
		
		
		// 비밀번호 Event
		
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
					$(".promptTxt_pw").text("처음 입력하신 비밀번호와 일치하지 않습니다")
					.css("color", "red").css("display", "block");
				}else {
					$(".promptTxt_pw").text("처음 입력하신 비밀번호와 일치합니다")
					.css("color", "blue").css("display", "block");
				}	
				
		});
		
		
		// 이름 Event
		
		$('.nameInput').keyup(function(e) {

			if (isEmpty(nameField) || lessThan(nameField, 2) != false) {
				$(".promptTxt_name").text("이름을 입력해주세요")
				.css("color", "red").css("display", "block");
			}else {
				$(".promptTxt_name").empty();
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