var urlSitio, mobile, altoHeader, contactoVisible, contactoMovilVisible, ancho;

$(function() {
    urlSitio = $('#site-url').data('url');
    mobile = false;
    contactoVisible = false;
    contactoMovilVisible = false;
    document.title = $('#titulo-pagina').data('titulo');
    ancho = $(window).width();

    /*if( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) {
        mobile = true;
    }*/

    if (ancho < 930) {
        mobile = true;
    }

    altoHeader = $('header').height();

    $('body').css('paddingTop', altoHeader);
    $('#form-contacto').css('top', altoHeader);

    $( window ).resize(function() {
        altoHeader = $('header').height();
        $('body').css('paddingTop', altoHeader);
    });

    menuSidebarActive();
    activarSubmenu();
    backtoTop();

    $('#btn-contacto-normal').on('click', function (event) {
        var form, anchoForm, pos;

        event.preventDefault();
        form = $('.form-contacto');
        anchoForm = form.width();

        if (!contactoVisible) {
            contactoVisible = true;
            pos = form.position();

            form.css('display', 'block');
            form.css('opacity', '0');
            form.css('right', -anchoForm);

            form.animate({
                opacity: 1,
                left: "-=" + anchoForm
            }, 300, function () {
                form.css('right', '0');
                form.css('left', 'auto');
            });
        } else {
            contactoVisible = false;

            form.animate({
                opacity: 0,
                left: "+=" + anchoForm
            }, 300);
        }
    });

    $('#btn-cerrar-contacto').on('click', function () {
        if (contactoVisible) {
            var form, anchoForm, pos;

            contactoVisible = false;
            form = $('.form-contacto');
            anchoForm = form.width();

            form.animate({
                opacity: 0,
                left: "+=" + anchoForm
            }, 300);
        }
    });

    $('#boton-contacto-movil').on('click', function (event) {
        event.preventDefault();

        if (!contactoMovilVisible) {
            var contenedor, menu, formContMovil;

            contenedor = $('#cont-menu-movil');
            formContMovil = $('#form-contacto-movil');
            contenedor.css('height', contenedor.height() + 'px');

            menu = $('#items-menu-movil');
            menu.css('position', 'absolute');
            formContMovil.css('left', ancho);
            formContMovil.css('display', 'block');

            contactoMovilVisible = true;

            menu.animate({
                left: "-=" + ancho
            }, { duration: 500, queue: false });

            formContMovil.animate({
                left: "-=" + ancho
            }, { duration: 500, queue: false });
        }
    });

    $('#btn-cerrar-contacto-movil').on('click', function (event) {
        event.preventDefault();

        if (contactoMovilVisible) {
            var contenedor, menu, formContMovil;

            contenedor = $('#cont-menu-movil');
            formContMovil = $('#form-contacto-movil');
            contenedor.css('height', contenedor.height() + 'px');

            menu = $('#items-menu-movil');

            contactoMovilVisible = false;

            menu.animate({
                left: "+=" + ancho
            }, { duration: 500, queue: false });

            formContMovil.animate({
                left: "+=" + ancho
            }, { duration: 500, queue: false });
        }
    });

    // Select all links with hashes
    $('a[href*="#"]')
    // Remove links that don't actually link to anything
        .not('[href="#"]')
        .not('[href="#0"]')
        .click(function(event) {
            // On-page links
            if (
                location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '')
                &&
                location.hostname == this.hostname
            ) {
                // Figure out element to scroll to
                var target = $(this.hash);

                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                //console.log(target);
                //console.log('hola');

                // Does a scroll target exist?
                if (target.length) {
                    // Only prevent default if animation is actually gonna happen
                    event.preventDefault();

                    var scroll = target.offset().top-altoHeader;
                    $('html,body').animate({
                        scrollTop: scroll
                    }, 1000, function() {
                        // Callback after animation
                        // Must change focus!
                        /*var $target = $(target);
                        $target.focus();
                        if ($target.is(":focus")) { // Checking if the target was focused
                            return false;
                        } else {
                            $target.attr('tabindex','-1'); // Adding tabindex for elements not focusable
                            $target.focus(); // Set focus again
                        };*/
                    });
                }
            }
        });

    activarFormulario();
});

$(window).resize(function() {
    altoHeader = $('header').height();
    $('#form-contacto').css('top', altoHeader);
});

function menuSidebarActive() {
    var params = window.location.pathname.split('/').slice(1),
        name = params[2];

    $('#'+name).addClass('is-active');
}

function activarSubmenu() {
    $('.item-submenu').on('click', function () {
        var hash = $(this).attr('href').split('#').slice(1)[0];

        $('.item-submenu').removeClass('is-active');

        if (hash) {
            $('#'+hash).addClass('is-active');
        }
    });
}

function backtoTop() {
    if ($('#back-to-top').length) {
        var scrollTrigger = 100, // px
            backToTop = function () {
                var scrollTop = $(window).scrollTop();
                if (scrollTop > scrollTrigger) {
                    $('#back-to-top').addClass('show');
                } else {
                    $('#back-to-top').removeClass('show');
                }
            };
        backToTop();
        $(window).on('scroll', function () {
            backToTop();
        });
        $('#back-to-top').on('click', function (e) {
            e.preventDefault();
            $('html,body').animate({
                scrollTop: 0
            }, 700);
        });
    }
}

function activarFormulario() {
    $('#btn-enviar-contacto').on('click', function () {
        var interior, nombre, correo, texto, error;
        error = $('#error-contacto');

        nombre = $('#nom-contact').val();
        correo = $('#corr-contact').val();
        texto = $('#text-contact').val();

        if (nombre.length === 0) {
            error.html('Debes ingresar tu nombre y apellidos');
            return;
        }

        if (correo.length === 0) {
            error.html('Debes ingresar tu correo');
            return;
        }

        if (texto.length === 0) {
            error.html('Debes ingresar el mensaje');
            return;
        }

        if (!validateEmail(correo)) {
            error.html('Debes ingresar un correo válido.');
            return;
        }

        error.html('');
        grecaptcha.execute();
    });
}

function validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

function enviarContacto(token)
{
    var nombre, correo, texto;

    nombre = $('#nom-contact').val();
    correo = $('#corr-contact').val();
    texto = $('#text-contact').val();

    interior = $('#interior-contacto');
    interior.css('height', interior.height() + 'px');

    $.post(
        urlSitio + $('#idioma').val() + '/contacto',
        {
            ajax: true,
            accion: 'enviarFormContacto',
            nombre: nombre,
            correo: correo,
            mensaje: texto,
            token: token
        }, function (data) {
            interior.html('<div class="mensaje-contacto">Formulario enviado con éxito.</div>');
        }, 'json'
    );
}
