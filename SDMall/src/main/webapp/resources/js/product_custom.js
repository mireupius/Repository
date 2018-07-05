/* JS Document */

/******************************

[Table of Contents]

1. Vars and Inits
2. Set Header
4. Init Page Menu
5. Init Recently Viewed Slider
6. Init Brands Slider
7. Init Quantity
8. Init Color
9. Init Favorites
10. Init Image


******************************/

function opChange(){
	overQuantity();//재조정
	limitQuantity();//수량제한
	
	getOp_name();//옵션명 추출
	getOp_price();//옵션가 추출
	getQuantity();//수량 추출
	setTotal_price();//총가격 계산
	calcDlvchrg();//배송비 계산
}

//총액 계산
function setTotal_price() {
	
	var price = $('#send_price').val()*1;
	
	price += getOp_price();
	price *= getQuantity();	
	
	$('#view_total_price').text(price);
	$('#send_total_price').val(price);
	return price;
}

//선택된 옵션명을 반환하는 함수
function getOp_name(){
	var optionSelected = $('option:selected').text();
	var opName = optionSelected.split(" (");
	
	$('#send_option_name').val(opName[0]);
	
	return opName[0];	
}

//선택된 옵션가를 반환하는 함수
function getOp_price(){
	var optionSelected = $('option:selected').text();
	var price = optionSelected.split("+");
	price = price[1].split(")");
	
	$('#send_option_price').val(price[0]);
	
	
	return price[0] *= 1;
}

//선택된 옵션의 재고를 반환하는 함수
function limitQuantity(){
	var optionSelected = $('option:selected').text();
	var stock = optionSelected.split("/");
	
	return stock[1]*=1;	
}

//수량 반환
function getQuantity(){
	var quantity =  $('#quantity_input').val();
	$('#send_quantity').val(quantity);
	
	return quantity;
}

//quantity_input에 재고 이상 입력된 경우 수량을 재고로 맞춤
function overQuantity(){
	var quantityInput = $('#quantity_input');
	
	if(quantityInput.val()*1>limitQuantity()){
		quantityInput.val(limitQuantity());
	}
}

//배송비 계산
function calcDlvchrg() {
	var chrg = $('#chrg').val();
	var terms= $('#terms').val();
	if(terms>0){
		chrg = setTotal_price()>terms?0:chrg;
	}
	$('#send_dlvchrg').val(chrg);
	return chrg;
}

$(document).ready(function()
{
	"use strict";

	opChange();
	
	/* 

	1. Vars and Inits

	*/
	
	var menuActive = false;
	var header = $('.header');
	var opQuantity = 0;

	setHeader();

	initPageMenu();
	initViewedSlider();
	initBrandsSlider();
	initQuantity();
	initColor();
	initFavs();
	initImage();

	$(window).on('resize', function()
	{
		setHeader();
	});

	/* 

	2. Set Header

	*/

	function setHeader()
	{
		//To pin main nav to the top of the page when it's reached
		//uncomment the following

		// var controller = new ScrollMagic.Controller(
		// {
		// 	globalSceneOptions:
		// 	{
		// 		triggerHook: 'onLeave'
		// 	}
		// });

		// var pin = new ScrollMagic.Scene(
		// {
		// 	triggerElement: '.main_nav'
		// })
		// .setPin('.main_nav').addTo(controller);

		if(window.innerWidth > 991 && menuActive)
		{
			closeMenu();
		}
	}


	/* 

	4. Init Page Menu

	*/

	function initPageMenu()
	{
		if($('.page_menu').length && $('.page_menu_content').length)
		{
			var menu = $('.page_menu');
			var menuContent = $('.page_menu_content');
			var menuTrigger = $('.menu_trigger');

			//Open / close page menu
			menuTrigger.on('click', function()
			{
				if(!menuActive)
				{
					openMenu();
				}
				else
				{
					closeMenu();
				}
			});

			//Handle page menu
			if($('.page_menu_item').length)
			{
				var items = $('.page_menu_item');
				items.each(function()
				{
					var item = $(this);
					if(item.hasClass("has-children"))
					{
						item.on('click', function(evt)
						{
							evt.preventDefault();
							evt.stopPropagation();
							var subItem = item.find('> ul');
						    if(subItem.hasClass('active'))
						    {
						    	subItem.toggleClass('active');
								TweenMax.to(subItem, 0.3, {height:0});
						    }
						    else
						    {
						    	subItem.toggleClass('active');
						    	TweenMax.set(subItem, {height:"auto"});
								TweenMax.from(subItem, 0.3, {height:0});
						    }
						});
					}
				});
			}
		}
	}

	function openMenu()
	{
		var menu = $('.page_menu');
		var menuContent = $('.page_menu_content');
		TweenMax.set(menuContent, {height:"auto"});
		TweenMax.from(menuContent, 0.3, {height:0});
		menuActive = true;
	}

	function closeMenu()
	{
		var menu = $('.page_menu');
		var menuContent = $('.page_menu_content');
		TweenMax.to(menuContent, 0.3, {height:0});
		menuActive = false;
	}

	/* 

	5. Init Recently Viewed Slider

	*/

	function initViewedSlider()
	{
		if($('.viewed_slider').length)
		{
			var viewedSlider = $('.viewed_slider');

			viewedSlider.owlCarousel(
			{
				loop:true,
				margin:30,
				autoplay:true,
				autoplayTimeout:6000,
				nav:false,
				dots:false,
				responsive:
				{
					0:{items:1},
					575:{items:2},
					768:{items:3},
					991:{items:4},
					1199:{items:6}
				}
			});

			if($('.viewed_prev').length)
			{
				var prev = $('.viewed_prev');
				prev.on('click', function()
				{
					viewedSlider.trigger('prev.owl.carousel');
				});
			}

			if($('.viewed_next').length)
			{
				var next = $('.viewed_next');
				next.on('click', function()
				{
					viewedSlider.trigger('next.owl.carousel');
				});
			}
		}
	}

	/* 

	6. Init Brands Slider

	*/

	function initBrandsSlider()
	{
		if($('.brands_slider').length)
		{
			var brandsSlider = $('.brands_slider');

			brandsSlider.owlCarousel(
			{
				loop:true,
				autoplay:true,
				autoplayTimeout:5000,
				nav:false,
				dots:false,
				autoWidth:true,
				items:8,
				margin:42
			});

			if($('.brands_prev').length)
			{
				var prev = $('.brands_prev');
				prev.on('click', function()
				{
					brandsSlider.trigger('prev.owl.carousel');
				});
			}

			if($('.brands_next').length)
			{
				var next = $('.brands_next');
				next.on('click', function()
				{
					brandsSlider.trigger('next.owl.carousel');
				});
			}
		}
	}

	/* 

	7. Init Quantity

	*/

	//수량을 재고 1 이상 재고 이하로 제한하는 함수
	function initQuantity()
	{
		
		// Handle product quantity input
		if($('.product_quantity').length)
		{
			var input = $('#quantity_input');
			var incButton = $('#quantity_inc_button');
			var decButton = $('#quantity_dec_button');

			var originalVal;
			var endVal;

			incButton.on('click', function()
			{
				originalVal = input.val();
				if(originalVal < limitQuantity()){
					endVal = parseFloat(originalVal) + 1;
					input.val(endVal);
					
					opChange()
				}
			});

			decButton.on('click', function()
			{
				originalVal = input.val();
				if(originalVal > 1)
				{
					endVal = parseFloat(originalVal) - 1;
					input.val(endVal);
					
					opChange()
				}
			});
		}
	}
	

	/* 

	8. Init Color

	*/

	function initColor()
	{
		if($('.product_color').length)
		{
			var selectedCol = $('#selected_color');
			var optionItems = $('.color_list li');
			optionItems.each(function()
					{
				var optionItems = $(this);
				optionItems.on('click', function()
						{
					var option = optionItems.text();
					selectedCol.text(option);
						});
					});
		}
	}
	 

	/* 

	9. Init Favorites

	*/

	function initFavs()
	{
		// Handle Favorites
		var fav = $('.product_fav');
		fav.on('click', function()
		{
			fav.toggleClass('active');
		});
	}

	/* 

	10. Init Image

	*/

	function initImage()
	{
		var images = $('.image_list li');
		var selected = $('.image_selected img');

		images.each(function()
		{
			var image = $(this);
			image.on('click', function()
			{
				var imagePath = new String(image.data('image'));
				selected.attr('src', imagePath);
			});
		});
	}
	
	function quantityLimit()
	{
		alert("aa");
		alert(goodsDtl1.gd_price);
			var input = $('#quantity_input');
			var option = $('styledSelect1 option');

			var originalVal;
			var endVal;
			
			

			option.on('click', function()
			{
				originalVal = input.val();
				endVal = parseFloat(originalVal) + 1;
				input.val(endVal);
			});

			decButton.on('click', function()
			{
				originalVal = input.val();
				if(originalVal > 0)
				{
					endVal = parseFloat(originalVal) - 1;
					input.val(endVal);
				}
			});
	}
});