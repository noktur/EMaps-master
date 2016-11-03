


/* -------- Owl Carousel MTCH -------- */
$(".quote-carousel").owlCarousel({
	slideSpeed : 300,
	autoPlay : true,
	paginationSpeed : 400,
	singleItem : true,		
});
// End Owl Carousel


/* -------- Counter Up -------- */
$('.counter').counterUp({
	delay: 10,
	time: 1000
});
// End Counter Up


/*	Count Down
/*---------------------------------------------------- MTCH*/
function count(elem){
    var $e = $(elem);
	if($e.length==0){
		return 0;
	};

	//CountDown
    var dateOfBeginning = new Date(),
        dateOfEnd = $e.closest('[data-end-date]').attr('data-end-date') || new Date((new Date()).getTime() + 3*30*24*3600*1000);

    countDown(dateOfBeginning, dateOfEnd); 

}


/* -------- Isotope Filtering -------- */
var $container = $('.isotope-gallery-container');
var $filter = $('.filter');
$(window).load(function () {
    // Initialize Isotope
    $container.isotope({
        itemSelector: '.gallery-item-wrapper'
    });
    $('.filter a').click(function () {
        var selector = $(this).attr('data-filter');
        var $iso_container = $(this).closest('.content-block,body').find('.isotope-gallery-container');
        $iso_container.isotope({ filter: selector });

        var $iso_filter = $(this).closest('.filter');
        $iso_filter.find('a').parent().removeClass('active');
        $(this).parent().addClass('active');
        return false;
    });
  /*  $filter.find('a').click(function () {
        var selector = $(this).attr('data-filter');
        $filter.find('a').parent().removeClass('active');
        $(this).parent().addClass('active');
    });*/
});
$(window).smartresize(function () {
    $container.isotope('reLayout');
});
// End Isotope Filtering


/* -------- Gallery Popup -------- */
$(document).ready(function(){
	$('.gallery-zoom').magnificPopup({ 
		type: 'image'
		// other options
	});
});
// End Gallery Popup



/* -------- Header 1 Nav -------- */
$(".headroom").headroom({
});

/* Soft scroll */
$(function() {
    $('.soft-scroll a[href^="#"], a[href^="#"].soft-scroll').bind('click', function(event) {
        var $anchor = $(this);
        var href = $anchor.attr('href');
        try {
            var elem = $(href);
            if(elem.length) {
                $('html, body').stop().animate({
                    scrollTop: elem.offset().top
                }, 1000);

                event.preventDefault();
            }
        }
        catch(err) {}
    });
});

    
/* -------- Header 3 Nav -------- MTCH */

function initHeader3() {
    $('.nav-slide-btn').click(function() {
        $('.pull').slideToggle();
    });

    $('#nav-toggle').click(function(e) {
        $(this).toggleClass('active');
        e.preventDefault();
    })
}
$(function() {
    initHeader3();
});

