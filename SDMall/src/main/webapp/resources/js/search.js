function setSearch(name) {//input에 li의 text를 입력
	$('.header_search_input').val(name);
//	setTimeout(function  () {
	$('.header_search_input').focus();
//	}, 101);
};

$(function() {
	$('.header_search_input').focus(function() {
		var name = $('.header_search_input').val();
		var ul = $('.header_search_dropdown');
		
		if($('.header_search_input').val()!=""){
			$.ajax({
				url : "search.name",// 요청주소
				data : {
					gd_name : name
				},// {파라메터명:값,파라메터명:값}
				success : function(json) {
					ul.empty();
					// 데이터 있는 배열까지 찾아 들어가서
					var ar = json.goods;
					$.each(ar, function(i, goods) {
						var li = $("<li></li>").text(goods.gd_name);
						li.attr('onclick','setSearch("'+goods.gd_name+'")');//onclick setSearch를 가진 li 생성
						ul.append(li);
					});
				}
			});
		}
	});
	
	$('.header_search_input').keyup(function(e) {
		$('.header_search_input').trigger("focus");
	});
	
//	$('.header_search_form').focusout(function(e) {
//		setTimeout(function  () {
//		$('.header_search_dropdown').empty();
//		}, 100);
		$('html').click(
			function(e) {
				if (!$(e.target).hasClass("header_search_input")
						&& !$(e.target).hasClass("header_search_dropdown")) {
					// 클릭한 곳이 input,dropdown이 아니면
					$(".header_search_dropdown").empty();
				}
			});
	
});
