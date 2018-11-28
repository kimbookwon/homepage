var bxSliderList = [];
//$(document).ready(function(){


function h_banner(){
	jQuery('#header_banner').slideUp();
}

jQuery(function($){

$('#issueSlider > .issuItem').show();
$('#issueSlider').FlowSlider({
	marginStart:0,
	marginEnd:0,
	//position:0.0,
	startPosition:0.55
});

$('.issuItem').mouseenter(function(){
	$(this).find('.imgOverV15 em').show();
});
$('.issuItem').mouseleave(function(){
	$(this).find('.imgOverV15 em').hide();
});


$('.tab a').click(function(i){this.i=i}).click(function(){
	if ( $(this).data('link') ||
	     $(this).prop('href').substr(0,4) == 'http' ) {
		return true;
	}

	var idx = $(this).index();
	$(this).parent().parent().find('.hiddenarea').removeClass('on');
	$(this).parent().parent().find('.tab a').removeClass('on');
	$(this).addClass('on');
	$(this).parent().parent().find('.hiddenarea:eq('+idx+')').addClass('on');
	return false;
});


// makepage.444

	$('.event_ing a.tab01').click(function(){
		$('.event_pass').css('display', 'block');
		$('.event_ing').css('display', 'none');
		return false;
	});
	$('.event_pass a.tab02').click(function(){
		$('.event_ing').css('display', 'block');
		$('.event_pass').css('display', 'none');
		return false;
	});


$('#gnb > div > ul > li').mouseover(function(i){this.i=i}).mouseover(function(){
	var idx = $(this).index();
	if(idx+2 < $('#gnb > div > ul > li').length){
		$(this).parent().parent().parent().parent().parent().find('.m_over').removeClass('over');
		$(this).parent().parent().parent().parent().find('#gnb > ul > li > a').removeClass('over');
		$(this).parent().parent().parent().parent().parent().find('#gnb').addClass('over');
		$(this).parent().parent().parent().parent().parent().parent().find('.gnbview').fadeIn();
		$(this).parent().parent().parent().parent().find('.m_over:eq('+idx+')').addClass('over');
	}else{
		$('#gnb > div > ul > li > ul').removeClass('over');
		$('.gnbview').fadeOut();
	}
	return false;
});


$('#gnb').mouseleave(function(){
	$('.gnbview').fadeOut();
	$('#gnb > div > ul > li > ul').removeClass('over');
});

/* Top*/
window.btnTop = function (){
	$(window).scroll( function(){
		if($(document).scrollTop() > 300){
			$('#quick').css({'position':'fixed','top':200})
		}else{
			$('#quick').css({'position':'absolute','top':510})
		}
	});
	$('#top').click(function(){
		$('html, body').animate({scrollTop:0}); return false
	});
}


function bxslider(){
	$('.bxslider01 li').show();
	bxSliderList['bxslider01'] = $('.bxslider01').bxSlider({
		auto: true,
		autoHover: true,
		speed: 700,
		controls: true,
	});
	$('.bxslider02 > li').show();
	bxSliderList['bxslider02'] = $('.bxslider02').bxSlider({
		auto: false,
		autoHover: true,
		speed: 700,
		controls: true,
		pager: false,
	});
	bxSliderList['bxslider03'] = $('.bxslider03').bxSlider({
		auto: true,
		autoHover: true,
		speed: 2000,
		controls: false,
		pager: false,
		moveSlides: 1,
		slideWidth: 181,
		maxSlides: 5,
		slideMargin: 10,
		pause: 800,
	});
	bxSliderList['bxslider04'] = $('.bxslider04').bxSlider({
		auto: true,
		autoHover: true,
		speed: 2000,
		controls: false,
		pager: false,
		moveSlides: 1,
		slideWidth: 259,
		maxSlides: 5,
		slideMargin: 10,
		pause: 800,
	});
	bxSliderList['bxslider05'] = $('.bxslider05').bxSlider({
		auto: true,
		autoHover: true,
		speed: 700,
		controls: false,
	});
	$('.bxslider06 > li').show();
	bxSliderList['bxslider06'] = $('.bxslider06').bxSlider({
		auto: true,
		autoHover: true,
		speed: 1500,
		controls: true,
		pager: false,
	});

	var numOfTodayItems = $('.bxslider07').data('noItems');
	if ( numOfTodayItems ) {
		bxSliderList['bxslider07'] = $('.bxslider07').bxSlider({
			mode: 'vertical',
			auto: false,
			autoHover: true,
			infiniteLoop: true,
			adaptiveHeight: true, 
			useCSS:false,
			speed: 800,
			controls: true,
			pager: false,
			moveSlides: 1,
			slideWidth: 100,
			maxSlides: 3, //numOfTodayItems > 3 ? 3: numOfTodayItems,
			//slideMargin: 10,
		});
	}
/**
 * DON'T INIT HERE!
 * 
	bxSliderList['bxslider08'] = $('.bxslider08').bxSlider({
		auto: true,
		autoHover: true,
		speed: 2000,
		controls: false,
		pager: false,
		moveSlides: 1,
		slideWidth: 300,
		maxSlides: 4,
		slideMargin: 1,
		pause: 800,
	});
*/
	var bxc = $(".bx-pager").outerWidth()/2;
	$(".bx-pager").css({'margin-left' : -bxc});
}

	btnTop();
	bxslider()
	$('.select_st1').customSelect();
});