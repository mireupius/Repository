
function goRegisterC() {
	location.href = "customer.register.go"
}

//function goIdValidate() {
//	location.href = "customer.idvalidate.do"
//}

function goRegisterS() {
	location.href = "seller.register.go"
}

function goRegisterP() {
	location.href = "product.register.go"
}

function goShop(){
	alert("sdfs");
	location.href = "shopbag.get.do"
}

function goCancelOrder(sd_pno) {
	var ok = confirm("이 상품을 취소하시겠습니까?");
	
	if (ok) {
		
		location.href = "orderList.cancel.do?sd_delivery_pno=" + sd_pno;
	}
	
}

function goExchangeOrder(sd_pno) {
	var ok = confirm("이 상품을 교환하시겠습니까?");
	
	if (ok) {
		
		location.href = "orderList.exchange.do?sd_delivery_pno=" + sd_pno;
	}
	
}

function goReturnOrder(sd_pno) {
	var ok = confirm("이 상품을 반품하시겠습니까?");
	
	if (ok) {
		
		location.href = "orderList.return.do?sd_delivery_pno=" + sd_pno;
	}
	
}

function goWritingReview(sd_pno) {
	
	location.href = "productReview.writing.go?sd_delivery_pno=" + sd_pno;

}

