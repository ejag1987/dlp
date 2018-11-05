$(function() {
    $('.boton-cargar-formulario').on('click', function() {
        var formulario;

        formulario = $('.formulario ', '#trabaja_con_nosotros');

        if (formulario.hasClass('hide')) {
            formulario.removeClass('hide');
            activarFormularioTrabajo();
        }

        doScrolling('#formulario', 1000);
    });
});

function activarFormularioTrabajo() {
    $('#boton-enviar-trabajo').on('click', function () {
        var nombre, telefono, correo, texto, error;

        error = $('#error-trabajo');

        nombre = $('#nom-trab').val();
        telefono = $('#fono-trab').val();
        correo = $('#corr-trab').val();
        texto = $('#text-trab').val();

        if (nombre.length === 0) {
            error.html('Debes ingresar tu nombre y apellidos');
            return;
        }

        if (telefono.length === 0) {
            error.html('Debes ingresar tu telefono');
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

        interior = $('#int-formulario');

        $.post(
            urlSitio + $('#idioma').val() + '/contacto',
            {
                ajax: true,
                accion: 'enviarFormTrabajo',
                nombre: nombre,
                telefono: telefono,
                correo: correo,
                mensaje: texto
            }, function (data) {
                interior.html('<div class="mensaje-trabajo">Formulario enviado con éxito.</div>');
            }, 'json'
        );
    });
}

/**
 *  Credits to Daniel Sawka
 *  https://stackoverflow.com/a/39494245
 */
function getElementY(query) {
    return window.pageYOffset + document.querySelector(query).getBoundingClientRect().top
}

function doScrolling(element, duration) {
    var startingY = window.pageYOffset;
    var elementY = getElementY(element) - $('.navbar').height();
    // If element is close to page's bottom then window will scroll only to some position above the element.
    var targetY = document.body.scrollHeight - elementY < window.innerHeight ? document.body.scrollHeight - window.innerHeight : elementY;
    var diff = targetY - startingY;
    // Easing function: easeInOutCubic
    // From: https://gist.github.com/gre/1650294
    var easing = function (t) { return t<.5 ? 4*t*t*t : (t-1)*(2*t-2)*(2*t-2)+1 };
    var start;

    if (!diff) return;

    // Bootstrap our animation - it will get called right before next frame shall be rendered.
    window.requestAnimationFrame(function step(timestamp) {
        if (!start) start = timestamp;
        // Elapsed miliseconds since start of scrolling.
        var time = timestamp - start;
        // Get percent of completion in range [0, 1].
        var percent = Math.min(time / duration, 1);
        // Apply the easing.
        // It can cause bad-looking slow frames in browser performance tool, so be careful.
        percent = easing(percent);

        window.scrollTo(0, startingY + diff * percent);

        // Proceed with animation as long as we wanted it to.
        if (time < duration) {
            window.requestAnimationFrame(step);
        }
    })
}