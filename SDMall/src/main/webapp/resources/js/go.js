// 구매자 회원가입 컨트롤러 요청
function goRegisterC() {
	location.href = "customer.register.go"
}

// 판매자 회원가입 컨트롤러 요청
function goRegisterS() {
	location.href = "seller.register.go"
}

// 주문취소 요청
function goCancelOrder(sd_pno) {
	var ok = confirm("이 상품을 취소하시겠습니까?");
	
	if (ok) {
		
		location.href = "orderList.cancel.do?sd_delivery_pno=" + sd_pno;
	}
	
}

// 교환요청
function goExchangeOrder(sd_pno) {
	var ok = confirm("이 상품을 교환하시겠습니까?");
	
	if (ok) {
		
		location.href = "orderList.exchange.do?sd_delivery_pno=" + sd_pno;
	}
	
}

// 반품요청
function goReturnOrder(sd_pno) {
	var ok = confirm("이 상품을 반품하시겠습니까?");
	
	if (ok) {
		
		location.href = "orderList.return.do?sd_delivery_pno=" + sd_pno;
	}
	
}

// 수취확인
function goCompleteDelivery(sd_pno) {
	var ok = confirm("수취확인하시겠습니까?");
	
	if (ok) {
		
		location.href = "orderList.completeDelivery.do?sd_delivery_pno=" + sd_pno;
	}
	
}
// 구매확정
function goCompleteBuy(sd_pno) {
	var ok = confirm("이 상품을 구매확정하시겠습니까?");
	
	if (ok) {
		
		location.href = "orderList.completeBuy.do?sd_delivery_pno=" + sd_pno;
	}
	
}

// 판매자에게 질문하기
function goQuestionSeller(sd_pno) {
	alert("sdf");
	location.href = "question.writing.go?sd_delivery_pno=" + sd_pno;
	
}

// 상품평작성하러가기
function goWritingReview(sd_pno) {
	
	location.href = "productReview.writing.go?sd_delivery_pno=" + sd_pno;

}

// 홈화면으로 돌아가기
function goHome() {
	location.href = "/mall"
}

// 마이페이지로 돌아가기
function goCustomerPage() {
	location.href = "customer.myHome.go"
}
// 판매자 페이지로 돌아가기
function goSellerPage() {
	location.href = "sale.delivery.go"
}


