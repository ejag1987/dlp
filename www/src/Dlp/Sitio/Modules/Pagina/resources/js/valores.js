$(function() {
    var maximum = null;

    $.each($('.titulo-valores'), function() {
        var value = $(this).height();

        maximum = (value > maximum) ? value : maximum;
    });

    $('.titulo-valores').css('height', maximum);
});
