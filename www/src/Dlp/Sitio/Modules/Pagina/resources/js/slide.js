var waitForFinalEvent = (function () {
    var timers = {};
    return function (callback, ms, uniqueId) {
        if (!uniqueId) {
            uniqueId = "Don't call this twice without a uniqueId";
        }
        if (timers[uniqueId]) {
            clearTimeout (timers[uniqueId]);
        }
        timers[uniqueId] = setTimeout(callback, ms);
    };
})();

function owlRespond(breakpoint) {
    var width = $(window).width()
    $('.imagen-slide').each(function () {
        var img = (width > breakpoint) ? $(this).data('desktop-src') : $(this).data('mobile-src');
        $(this).attr('data-src', img).attr('src', img);
    });
}

$(window).ready(function () {
    // init respond owl carousel images
    owlRespond('768');

    // dynamic carousel status check for orientation switch/window resize
    $(window).resize(function(){
        waitForFinalEvent(function(){
            owlRespond('768')
        }, 500);
    });

    $('.owl-carousel').owlCarousel({
        items:1,
        lazyLoad:false,
        loop:true,
        margin:10,
        autoplay:true,
        autoplayHoverPause: true
    });
});


