$(function() {
    var body = document.body,
        overlay = document.querySelector('.lightbox'),
        overlayBtts = document.querySelectorAll('[class$="overlay"]');

    [].forEach.call(overlayBtts, function(btt) {
        btt.addEventListener('click', function() {
            /* Detect the button class name */
            //var overlayOpen = this.className === 'open-overlay';
            var overlayOpen = this.classList.contains("open-overlay");

            /* Toggle the aria-hidden state on the overlay and the
             no-scroll class on the body */
            console.log(this.className);
            overlay.setAttribute('aria-hidden', !overlayOpen);
            body.classList.toggle('noscroll', overlayOpen);

            /* On some mobile browser when the overlay was previously
             opened and scrolled, if you open it again it doesn't
             reset its scrollTop property after the fadeout */
            setTimeout(function() {
                overlay.scrollTop = 0;
            }, 300)

        }, false);

    });

    if (mobile) {
        // init respond owl carousel images
        owlRespond('420');

        // dynamic carousel status check for orientation switch/window resize
        $(window).resize(function(){
            waitForFinalEvent(function(){
                owlRespond('500')
            }, 500);
        });

        $('.galeria').owlCarousel({
            items:1,
            lazyLoad:true,
            loop:true,
            margin:10
        });
    } else {
        var galeria = $('.titulo-categoria', '.galeria-item').parents('.galeria');

        $.each(galeria, function() {
            var maximum = null,
                cuadro = $(this).find('.titulo-categoria');

            $.each(cuadro, function() {
                var value = $(this).outerHeight();
                maximum = (value > maximum) ? value : maximum;
            });

            cuadro.css('height', maximum);
        });
    }

    $('.imagen-destacada').on('click', function() {
        var idProyecto = $(this).data('id');

        cargarProyectoItem(idProyecto);
    });

    $('.galeria-item').on('click', function() {
        var idCategoria = $(this).data('id'),
            idioma = $('#idioma').val(),
            tipo = $(this).closest('.modulo-galeria').data('tipo'),
            idSeccion = 0;

        switch (tipo) {
            case 1:
                cargarProyectoItem(idCategoria);
                break;
            case 2:
                cargarGaleria(idCategoria, idioma, tipo, idSeccion);
                break;
        }
    });

    $('.galeria-ver-mas').on('click', function() {
        var idCategoria = $(this).data('id'),
            idioma = $('#idioma').val(),
            tipo = $(this).closest('.modulo-galeria').data('tipo'),
            idSeccion = $(this).data('id-seccion');

        cargarGaleria(idCategoria, idioma, tipo, idSeccion);
    });

    /*$('.modal-close').on('click', function() {
        var contenido = $('#content');
        contenido.empty();
        var lightbox = $('#lightbox');
        lightbox.removeClass('is-active');

        //$('body').removeClass('bloqueo-scroll');
    });*/
});

function cargarPaginador() {
    $('div', '#paginador-categoria').on('click', function() {
        var idCategoria = $(this).data('categoria'),
            idioma = $('#idioma').val(),
            tipo = $(this).closest('.modulo-galeria').data('tipo'),
            idSeccion = 0;

        cargarGaleria(idCategoria, idioma, tipo, idSeccion);
    });
}

function cargarProyecto() {
    $('.proyecto-item').on('click', function() {
        var idProyecto = $(this).data('id');

        cargarProyectoItem(idProyecto);
    });
}

function activarVolver() {
    $('.volver').on('click', function() {
        var idCategoria = $(this).data('categoria'),
            idioma = $('#idioma').val(),
            tipo = $(this).closest('.modulo-galeria').data('tipo'),
            idSeccion = 0;

        cargarGaleria(idCategoria, idioma, tipo, idSeccion);
    });
}

function activarPaginaProyecto() {
    $('div', '#paginador-proyecto').on('click', function() {
        var idProyecto = $(this).data('proyecto');

        $.post(
            urlSitio + idioma + '/pagina',
            {
                ajax: true,
                accion: 'proyectoItem',
                controller: 'Galeria',
                idProyecto: idProyecto
            }, function (data) {
                if (!data.success) {

                }

                var contenido = $('#content');
                contenido.empty();
                contenido.html(data.html);

                activarPaginaProyecto();
                activarVolver();
            }, 'json'
        );
    });
}

function cargarGaleria(idCategoria, idioma, tipo, idSeccion) {
    $.post(
        urlSitio + idioma + '/pagina',
        {
            ajax: true,
            accion: 'cargarProyectos',
            controller: 'Galeria',
            idCategoria: idCategoria,
            idioma: idioma,
            tipo: tipo,
            idSeccion: idSeccion
        }, function (data) {
            if (!data.success) {

            }

            var lightbox = $('#lightbox');
            if (!lightbox.hasClass('is-active')) {
                lightbox.addClass('is-active');

                //$('body').addClass('bloqueo-scroll');
            }

            var contenido = $('#content');
            contenido.empty();
            contenido.html(data.html);

            if (mobile) {
                $( '.columns', '.proyectos' ).owlCarousel( {
                    items: 1,
                    lazyLoad: true,
                    loop: true,
                    margin: 10
                } );
            }

            cargarPaginador();
            cargarProyecto();
        }, 'json'
    );
}

function cargarProyectoItem(idProyecto) {
    $.post(
        urlSitio + idioma + '/pagina',
        {
            ajax: true,
            accion: 'proyectoItem',
            controller: 'Galeria',
            idProyecto: idProyecto
        }, function (data) {
            if (!data.success) {

            }

            var lightbox = $('#lightbox');
            if (!lightbox.hasClass('is-active')) {
                lightbox.addClass('is-active');
                //$('body').addClass('bloqueo-scroll');
            }

            var contenido = $('#content');
            contenido.empty();
            contenido.html(data.html);

            activarPaginaProyecto();
            activarVolver();
        }, 'json'
    );
}

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
