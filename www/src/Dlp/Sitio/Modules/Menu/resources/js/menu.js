document.addEventListener('DOMContentLoaded', function () {
    // Get all "navbar-burger" elements
    var $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

    // Check if there are any navbar burgers
    if ($navbarBurgers.length > 0) {

        // Add a click event on each of them
        $navbarBurgers.forEach(function ($el) {
            $el.addEventListener('click', function () {

                // Get the target from the "data-target" attribute
                var target = $el.dataset.target;
                var $target = document.getElementById(target);

                // Toggle the class on both the "navbar-burger" and the "navbar-menu"
                $el.classList.toggle('is-active');
                $target.classList.toggle('is-active');

            });
        });
    }
});

$(function() {
    $('.marca-submenu').on('click', function() {
        var submenu = $(this).closest('.menu-movil').children('.navbar-dropdown'),
            iconoSubmenu = $(this);

        if ($(submenu).hasClass('active')) {
            $(submenu).slideUp( "slow", function() {
                $(this).removeClass('active');
            });

            $(iconoSubmenu).html('+');

        } else {
            $(submenu).slideDown( "slow", function() {
                $('.navbar-dropdown', '.navbar-dropdown').removeClass('active');
                $(this).addClass('active');
                //console.log($('.navbar-dropdown', '.navbar-dropdown'));
            });

            $(iconoSubmenu).html('-');
        }
    });

    $('.item-menu.navbar-item').on('click', function() {
        // Toggle the class on both the "navbar-burger" and the "navbar-menu"
        $('#menu').removeClass('is-active');
        $('.navbar-burger').removeClass('is-active');
    });
});
