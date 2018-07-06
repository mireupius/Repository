function saveContent() {
 		opApplyReg();

 		var clflField = document.tx_editor_form.gd_clfl;
 		var clfmField = document.tx_editor_form.gd_clfm;
 		var gdNameField = document.tx_editor_form.gd_name;
 		var mdlnameField = document.tx_editor_form.gt_mdlname;
 		var csmpriceField = document.tx_editor_form.gd_csmprice;
 		var priceField = document.tx_editor_form.gd_price;
 		var opNameField = document.tx_editor_form.op_name0;
 		var opPriceField = document.tx_editor_form.op_price0;
 		var opStockField = document.tx_editor_form.op_stock0;
 		var gdFileField = document.tx_editor_form.gd_file1;
 		var makerField = document.tx_editor_form.gt_maker;
 		var brandField = document.tx_editor_form.gt_brand;
 		var mdfField = document.tx_editor_form.gt_mfd;
 		var expField = document.tx_editor_form.gt_exp;
 		var materialField = document.tx_editor_form.gt_material;
 		var weightField = document.tx_editor_form.gt_weight;
 		var volumeField = document.tx_editor_form.gt_volume;
 		var originField = document.tx_editor_form.gt_origin;
 		var dlvchrgField = document.tx_editor_form.gd_dlvchrg;
 		var outareaField = document.tx_editor_form.gd_outarea;
 	
 		
 		if (clflField==null) {
 			alert("상품 대분류 를 선택해주세요.");
 			$("body").scrollTop(0);
 		}else if(clfmField==null){
 			alert("상품 중분류 를 선택해주세요.");
 		}else if(isEmpty(gdNameField)){
 			alert("상품명을 입력해주세요.");
 			gdNameField.value = "";
 			gdNameField.focus();
 		}else if(isEmpty(mdlnameField)){
 			alert("모델명을 입력해주세요.");
 			mdlnameField.value = "";
 			mdlnameField.focus();
 		}else if(isEmpty(csmpriceField)){
 			alert("소비자가를 입력해주세요.");
 			csmpriceField.value = "";
 			csmpriceField.focus();
 			
 		}else if(isEmpty(priceField)){
 			alert("판매가를 입력해주세요.");
 			priceField.value = "";
 			priceField.focus();
 			
 		}else if(isEmpty(opNameField)){
 			alert("옵션명를 입력해주세요.");
 			opNameField.value = "";
 			opNameField.focus();
 			
 		}else if(isEmpty(opPriceField)){
 			alert("옵션가를 입력해주세요.");
 			opPriceField.value = "";
 			opPriceField.focus();
 			
 		}else if(isEmpty(opStockField)){
 			alert("옵션재고를 입력해주세요.");
 			opStockField.value = "";
 			opStockField.focus();

 		}else if(isEmpty(gdFileField)){
 			alert("이미지를 등록해주세요.");
 			
 		}else if(isNotNumber(mdfField)){
 			alert("숫자만 입력 해주세요.");
 			mdfField.value = "";
 			mdfField.focus();
 		}else if(isNotNumber(expField)){
 			alert("숫자만 입력 해주세요.");
 			expField.value = "";
 			expField.focus();
 		}else if(isNotNumber(weightField)){
 			alert("숫자만 입력 해주세요.");
 			expField.value = "";
 			expField.focus();
 			
 		}else if(isNotNumber(volumeField)){
 			alert("숫자만 입력 해주세요.");
 			expField.value = "";
 			expField.focus();
 		}else if(isEmpty(dlvchrgField)){
 			alert("배송비를 입력 해주세요.");
 			
 		}else if(isEmpty(outareaField)){
 			alert("출고지를 입력 해주세요.");
 		}else{
 			  Editor.save(); // 이 함수를 호출하여 글을 등록하면 된다.
 		}
}

$(function(){

//구버전	$(".ct1").click(function() {
	$(document).on("click",".ct1",function(){
		var cn = $(this).attr("category_num");
		var clfname = $(this).text();
		var clf = "2";

		$.ajax({
			url : "category.get",
			data : {ct_no : cn, ct_clf : clf},
			success : function(json) {
				var ar = json.category;
				
				$("#ct12").empty();
				$("#ct13").empty();
				$("#category_select1").empty();
				$("#category_select2").empty();
				$("#category_select3").empty();
				
				if(ar.length > 0){
					$.each(ar, function(i, c){
						
						var fname = $("<li></li>").text(c.ct_clfname);
						fname.attr("class","ct2");
						fname.attr("category_num", c.ct_no);
						$("#ct12").append(fname);
						// 카테고리 선택 표시 영역
						$("#category_select1").text(clfname + " > ");
						var input = $("#ctgry1").val(cn);
		                input.attr("name", "gd_clfl");
					});
				
				}else{
				
					// 카테고리 선택 표시 영역
					$("#category_select1").text(clfname + " > ");
					var input = $("#ctgry1").val(cn);
	                input.attr("name", "gd_clfl");
				}
			}
		});
	});
	
	// 동적으로 생성된 태그에 이벤트 주기 $(document).on("click",".ct2",function(){
	$(document).on("click",".ct2",function(){
		var cn = $(this).attr("category_num");
		var clfname = $(this).text();
		var clf = "3";
		
		$.ajax({
			url : "category.get",
			data : {ct_no : cn, ct_clf : clf},
			success : function(json) {
				var ar = json.category;
				
				$("#ct13").empty();
				$("#category_select2").empty();
				$("#category_select3").empty();
				
				if(ar.length > 0){
					$.each(ar, function(i, c){
						
						var fname = $("<li></li>").text(c.ct_clfname);
						fname.attr("class","ct3");
						fname.attr("category_num", c.ct_no);
						$("#ct13").append(fname);
						
						// 카테고리 선택 표시 영역
						$("#category_select2").text(clfname);
						var input = $("#ctgry2").val(cn);
		                input.attr("name", "gd_clfm");
		                
					});
				}else{
					// 카테고리 선택 표시 영역
					$("#category_select2").text(clfname);
					var input = $("#ctgry2").val(cn);
	                input.attr("name", "gd_clfm");
				}
			}
		});
	});
	
	// 동적으로 생성된 태그에 이벤트 주기 $(document).on("click",".ct2",function(){
	$(document).on("click",".ct3",function(){
		var cn = $(this).attr("category_num");
		var clfname = $(this).text();
		
		$("#category_select3").empty();
		// 카테고리 선택 표시 영역
		$("#category_select3").text(" > "+clfname);
		var input = $("#ctgry3").val(cn);
        input.attr("name", "gd_clfs");
	});
	   
	// ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ 옵션값 배열로 저장 input hidden으로 넘기기 ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
	$(document).on("click","#opPlus",function(){
		var values = document.getElementsByName("opChk");
		var opN = values.length;

		var opInputN = $("<input>").attr("class","inpWidth").attr("name", "op_name"+opN).attr("maxlength","20");
		var opInputNo = $("<input>").attr("type","hidden").attr("name", "op_no"+opN);
		var opSpanN = $("<span></span>").append(opInputN, opInputNo);
		
		var opInputP = $("<input>").attr("class","inpWidth").attr("name", "op_price"+opN).attr("maxlength","7");
		var opSpanP = $("<span></span>").append(opInputP);
		
		var opInputS = $("<input>").attr("class","inpWidth").attr("name", "op_stock"+opN).attr("maxlength","4");
		var opSpanS = $("<span></span>").append(opInputS);
		
		var opLi = $("<li></li>").attr("class","opTb").attr("id","opLi"+opN).append(opSpanN, opSpanP, opSpanS);
		
		var opInputChk = $("<input>").attr("type","checkbox").attr("name","opChk").val(opN);
		var opLiChk = $("<li></li>").attr("class","opChkLi").attr("id","ch"+opN).append(opInputChk);

		$(".opUl").append(opLi, opLiChk);
	});

	// 적용 버튼 클릭으로 옵션값 히든에 저장
	
//	$(document).on("keyup","[name=op_stock"+(opN-1)+"]",function(){
//	$(document).on("click","#opSave",function(){
//	});
	// ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲ 옵션값 배열로 저장 input hidden으로 넘기기 ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
	
});

var sel_file;

$(document).ready(function(){  
	$("#input_img").on("change", handleImgFileSelect);
});

function handleImgFileSelect(e){
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	filesArr.forEach(function(f){
		if(!f.type.match("image.*")){alert("확장자는 이미지 확장자만 가능")
			return;
		}
		
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e){
			$("#img1").attr("src", e.target.result); 
			$("#img2").attr("src", e.target.result);
			$("#img3").attr("src", e.target.result);
			$("#img4").attr("src", e.target.result);
		}
		
		reader.readAsDataURL(f);
	});
}

// 옵션 박스값 적용( 그냥 for문은 안됨 추가 삭제시 문제 발생)
function opApplyReg(){
	var values = document.getElementsByName("opChk");
	var r = values.length;
	var opl_name = [];
	var opl_price = [];
	var opl_stock = [];
	
	$.each(values, function(i,s){
		opl_name[i] = $("input[name=op_name"+s.value+"]").val();
		opl_price[i] = $("input[name=op_price"+s.value+"]").val();
		opl_stock[i] = $("input[name=op_stock"+s.value+"]").val();
	});
	
	$("input[name=opl_name]").val(opl_name);
	$("input[name=opl_price]").val(opl_price);
	$("input[name=opl_stock]").val(opl_stock);
	alert("옵션 적용");
}

// 옵션 박스 제거
function opBoxDelete(){
	var values = document.getElementsByName("opChk");
	var a=[];
	//var a = new Array();
	
	$.each(values, function(i, s){
		if(s.checked){
			a.push(values[i].value);
		}
	});
	
	$.each(a, function(i, s){
			$("#opLi"+s).empty();
			$("#opLi"+s).remove();
			
			$("#ch"+s).empty();
			$("#ch"+s).remove();
	});
}