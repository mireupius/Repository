function goRegisterC() {
	location.href = "customer.register.go"
}

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
function go_cart_delete(cseq){
    if(confirm("정말 삭제하시겠습니까?")){
        location.href="MacaronicsServlet?command=cart_delete&cseq="+cseq;       
    }   
}