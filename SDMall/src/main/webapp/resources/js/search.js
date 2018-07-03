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
						var a = $("<a></a>").text(goods.gd_name);
						a.attr('href','shop.search?gd_name='+goods.gd_name);
						var li = $("<li></li>").append(a);
						ul.append(li);
						
					});
				}
			});
		}
	});
	
	$('.header_search_input').keyup(function(e) {
		$('.header_search_input').trigger("focus");
	});
	
//	$('.header_search_input').focusout(function(e) {
//		$('.header_search_dropdown').empty();
//	});
	
});