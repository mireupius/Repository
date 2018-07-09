// 판매자 회원가입 Event처리
function connectSLRegisterCheckEvent() {

		var idField = document.regSLForm.sl_id;
		var pwField = document.regSLForm.sl_pw;	
		var pwOKField = document.regSLForm.sl_pwOK;
		var coNameField = document.regSLForm.sl_coName;
		var coRegNoField = document.regSLForm.sl_coRegNo;
		var phoneNoField = document.regSLForm.sl_phoneNo;
		var emailFrontField = document.regSLForm.sl_emailFront;

		// keyup이니까 키보드가 눌러있을 때는 그냥 다 반복시켜버림
		// 클릭도 keyup적용되니 별도의 메소드로..
		
		// 아이디 중복검사 여부 판단
		var idvalidateCheck = 0;
			
		// 아이디 Event	
		$(".idInput").keyup(function(e) {
			
			var id = $(".idInput").val();
			
			
				if (id != null) {
					$('.promptTxt_id').text("중복확인버튼을 눌러주십시오")
					.css("color", "red").css("display", "block");
				}
				
				if (isEmpty(idField) || containsHangul(idField) != false) {
					$(".promptTxt_id").text("아이디 필수, 한글 금지");
					
				}
				
		});

		$(".validateBtn").click(function() {
				var id = $(".idInput").val();
				
				$.ajax({
					
					url : "seller.validCheck",
					data : {sl_id : id},
					success : function(json) {

						var ok = json.seller.length;
						if (ok == 1) {
							$('.promptTxt_id').text("중복된 아이디 입니다")
							.css("color", "red").css("display", "block");;
						}else if (ok == 0) {
							
							$('.promptTxt_id').text("사용가능한 아이디 입니다")
							.css("color", "blue").css("display", "block");
							idvalidateCheck = 1;
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
		
		// 회원가입 버튼 중복검사여부  Event
		$('.regBtn').click(function() {
			
			if (idvalidateCheck == 0) {
				
				alert('아이디 중복체크버튼 눌러주세요');
				return false;
			
			} else {
				return true;
			}
			
			
		});
		
}