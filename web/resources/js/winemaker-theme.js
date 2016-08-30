jQuery(function ($) {

$(document).ready(function() {

/* SIDE MENU */
$(function () {

	$(".toggle-side-menu").click(function(e) {
		$("#side-nav").toggleClass('push-left');
		$("#main-container").toggleClass('push-left');
		e.stopPropagation();
	});
	
	$("#main-container").click(function(e) {
		reset();
	});
	
	$(document).keyup(function(e) {
		if (e.keyCode === 27) {
		reset();
		}
	});
	
	function reset() {
		$("#main-container").removeClass('push-left');
		$("#side-nav").removeClass('push-left');
	}
	
	
});   

/* BS TOOLTIP */
$(function () {
$('[data-toggle="tooltip"]').tooltip();
});   

/* ENABLE PARALAX ON NON TOUCH DEVICES */
$(function () {

if(!Modernizr.touch){ 
$.stellar({
    horizontalScrolling: false,
    responsive: true,
    verticalOffset: 100
});
}

});

/* SWIPER + ANIMATE.CSS */
$(function () {

function doAnimations( elems ) {

	var animEndEv = 'webkitAnimationEnd animationend';
	
	elems.each(function () {
		var $this = $(this),
		$animationType = $this.data('animation');
		$this.addClass($animationType).one(animEndEv, function () {
			$this.removeClass($animationType);
		});
	});
}

	var swiper1 = new Swiper ('#swiper-1.swiper-container', {
	effect: 'coverflow',
	grabCursor: true,
	loop: true,
	speed: 1000,
	pagination: '.swiper-pagination',
	nextButton: '.swiper-button-next',
	prevButton: '.swiper-button-prev',
	onSlideChangeStart: function (swiper) {
		var $animatingElems = $(".swiper-slide-active").find("[data-animation ^= 'animated']");
		doAnimations($animatingElems);
	},
	ontouchStart: function (swiper) {
		var $animatingElems = $(".swiper-slide-next, .swiper-slide-prev").find("[data-animation ^= 'animated']");
		doAnimations($animatingElems);
	},
	coverflow: {
            rotate: 50,
            stretch: 0,
            depth: 100,
            modifier: 1,
            slideShadows : true
        }
	});


    var galleryTop = new Swiper('.gallery-top', {
 		nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',
        spaceBetween: 10,
    });
    
    
    var galleryThumbs = new Swiper('.gallery-thumbs', {
        spaceBetween: 0,
        centeredSlides: true,
        slidesPerView: 'auto',
        touchRatio: 0.2,
        slideToClickedSlide: true
    });
    galleryTop.params.control = galleryThumbs;
    galleryThumbs.params.control = galleryTop;


    var swiperDemo = new Swiper('#swiper-demo', {
		grabCursor: true,
		loop: true,
		speed: 1000,
		pagination: '.swiper-pagination',
		nextButton: '.swiper-button-next',
		prevButton: '.swiper-button-prev'
    });



});
	
/* EFFECTS ON IN VIEW */
$(function () {
function onScrollInit( items, trigger ) {
  items.each( function() {
    var osElement = $(this),
        osAnimationClass = osElement.attr('data-os-animation'),
        osAnimationDelay = osElement.attr('data-os-animation-delay');
      
        osElement.css({
          '-webkit-animation-delay':  osAnimationDelay,
          '-moz-animation-delay':     osAnimationDelay,
          'animation-delay':          osAnimationDelay,
          '-webkit-transition-delay': osAnimationDelay,
          '-moz-transition-delay': 	  osAnimationDelay,
          'transition-delay':		  osAnimationDelay

        });

        var osTrigger = ( trigger ) ? trigger : osElement;
        
        osTrigger.waypoint(function() {
          osElement.addClass('animated').addClass(osAnimationClass);
          },{
              triggerOnce: true,
              offset: '90%'
        });
  });
}

onScrollInit( $('.os-animation') );
onScrollInit( $('.staggered-animation'), $('.staggered-animation-container') );
});

/* STORE VIEW OPTIONS */
$(function () {
$("#view-option button").click( function () {
$("#view-option button").removeClass("active");
$(this).addClass("active");
var view = $(this).data("view");
var elms = $("#product-gallery .shop-item");
elms.removeClass();
elms.addClass("shop-item");
elms.addClass(view);
}
);

});

/* SCROLL TO SECTION + SCROLL SPY */
$(function () {
    $("#secondary-nav li a").click(function () {
        if (location.pathname.replace(/^\//, "") === this.pathname.replace(/^\//, "") && location.hostname === this.hostname) {
            var target = $(this.hash);
            target = target.length ? target : $("[name=" + this.hash.slice(1) + "]");
            if (target.length) {
                $("html,body").animate({
                    scrollTop: (target.offset().top - $("#section-nav").height()+1)
                }, 700, 'swing');
                return false;
            }
        }
    });

$('body').scrollspy({ target: '#secondary-nav-bar' });

});

}); /* END DOCUMENT READY */

$(window).load( function() {

/* STICKY NAV */ 
$(function () {
if ($("#secondary-nav-bar").length) {
	var sticky = new Waypoint.Sticky({
	  element: $('#secondary-nav-bar')[0],
	  offset: 0
	});
	}
});   

}); /* END WINDOW LOAD */

});

