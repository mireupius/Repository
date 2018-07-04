
function saveContent() {
	opApplyView();
    Editor.save(); // 이 함수를 호출하여 글을 등록하면 된다.
}

function deleteGoods(){
	var ok =confirm("이 상품을 정말 삭제 하시겠습니까?");
	if(ok){
		var form = document.createElement("form");
	    form.setAttribute("method", "POST");
	    form.setAttribute("action", "goods.delete");
	    
	    var gdno=$("input[name=gd_no]").val();
		var imgl=$("input[name=gd_imgl]").val();
		var imgm=$("input[name=gd_imgm]").val();
		var imgs=$("input[name=gd_imgs]").val();
		var imgss=$("input[name=gd_imgss]").val();
		var sellerid=$("input[name=gd_sellerid]").val();
	    
	    var param= {'gd_no':gdno, 'gd_imgl':imgl, 'gd_imgm':imgm, 'gd_imgs':imgs, 'gd_imgss':imgss, 'gd_sellerid':sellerid};
	    
		for(var key in param) {
	        var hiddenField = document.createElement("input");
	        hiddenField.setAttribute("type", "hidden");
	        hiddenField.setAttribute("name", key);
	        hiddenField.setAttribute("value", param[key]);
	        form.appendChild(hiddenField);
		}
		
	    document.body.appendChild(form);
	    form.submit();
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
	// db에 저장된 옵션 사이즈저장 --> 추가 버튼 클릭시 옵션 번호증가
	
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

// 삭제 버튼 클릭시 체크박스 선택여부 확인
// 옵션번호가 단순번호로 되어있으면 체크박스 임의 숫자로도 삭제가 가능한 황당한 경우가 생김
// 대책필요 -- > 상품번호 조건에 넣어서 해결
function opSelCheck(){
	var vals = document.getElementsByName("opChk");
	var cnt =0;
	$.each(vals, function(i, s){
		if(s.checked){
			cnt++;
		}
	});
	if(cnt >0 ){
		return true;
	}
	alert("삭제할 옵션을 선택해 주세요.");
	return false;
}

function opDelete(){
	var ok =confirm("정말 삭제 하시겠습니까?");
	if(ok && opSelCheck()){
		// ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼선택한 옵션들을 배열에 저장 ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼
		// 체크한 옵션 번호를 가져옴
		var values = document.getElementsByName("opChk");
		
		var opl_no = [];
		var gd_no = $("input[name=gd_no]").val();
		
		$.each(values, function(i, s){
			if(s.checked){
				opl_no.push(s.value);
			}
		});
		// ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲선택한 옵션들을 배열에 저장 ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
		$.ajaxSettings.traditional = true;
		$.ajax({ 
			url : "option.delete",
			data : {opl_no : opl_no, op_gdno : gd_no},
			success : function(json){
				var ar = json.option;
				var warnMessage = json.warnMessage;

				$(".opUl").empty();
				$.each(ar, function(i, s){
					
					var opInputN = $("<input>").attr("class","inpWidth").attr("name", "op_name"+i).attr("maxlength","20").val(s.op_name);
					var opInputNo = $("<input>").attr("type","hidden").attr("name", "op_no"+i).val(s.op_no);
					var opSpanN = $("<span></span>").append(opInputN, opInputNo);
					
					var opInputP = $("<input>").attr("class","inpWidth").attr("name", "op_price"+i).attr("maxlength","7").val(s.op_price);
					var opSpanP = $("<span></span>").append(opInputP);
					
					var opInputS = $("<input>").attr("class","inpWidth").attr("name", "op_stock"+i).attr("maxlength","4").val(s.op_stock);
					var opSpanS = $("<span></span>").append(opInputS);
					
					var opLi = $("<li></li>").attr("class","opTb").attr("id","opLi"+i).append(opSpanN, opSpanP, opSpanS);
					
					var opInputChk = $("<input>").attr("type","checkbox").attr("name","opChk").val(s.op_no);
					var opLiChk = $("<li></li>").attr("class","opChkLi").attr("id","ch"+i).append(opInputChk);
					
					$(".opUl").append(opLi, opLiChk);
				});
				
				if(warnMessage=="no"){
					alert("선택된 옵션중 바르지 못한 옵션번호가 있었습니다.");
				}
			}
		});
	}
}

//옵션 박스값 적용
function opApplyView(){
	var values = document.getElementsByName("opChk");
	var r = values.length;
	var opl_no = [];
	var opl_name = [];
	var opl_price = [];
	var opl_stock = [];
	var end = values[r-1].value;

	// 데이터 검증을 해서 필수 항목에 값이 꼭들어가 있는 상태에서 들어와야함
	for(var i = 0 ; i <= end; i++){
		if($("input[name=op_name"+i+"]").val() !="" || $("input[name=op_name"+i+"]").val()!=null){
			
			if($("input[name=op_no"+i+"]").val()==""){
				opl_no[i] = "insert";
			}else{
				opl_no[i] = $("input[name=op_no"+i+"]").val();
			}
			opl_name[i] = $("input[name=op_name"+i+"]").val();
			opl_price[i] = $("input[name=op_price"+i+"]").val();
			opl_stock[i] = $("input[name=op_stock"+i+"]").val();
		}
	}
	
	$("input[name=opl_no]").val(opl_no);
	$("input[name=opl_name]").val(opl_name);
	$("input[name=opl_price]").val(opl_price);
	$("input[name=opl_stock]").val(opl_stock);
	alert("옵션 적용");
}

//옵션 박스 제거
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