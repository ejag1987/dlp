$(function() {
    activarNuevoTitulo();
    activarGuardarTitulo();
});

function activarNuevoTitulo() {
    var boton = $('#nuevo-titulo');

    boton.on('click', function() {
        boton.off('click');
        $.post(
            urlSitio + 'configuracion', {
                ajax: true,
                accion: 'nuevoTitulo'
            }, function (data) {
                if (!data.success) {
                    $.alert({
                        title: 'Crear titulo',
                        icon: 'fa fa-warning text-danger',
                        content: data.message,
                        boxWidth: '30%',
                        useBootstrap: false,
                        autoClose: 'confirm|4000',
                        buttons: {
                            confirm: {
                                text: 'Listo',
                                action: function () {
                                    activarNuevoTitulo();
                                }
                            }
                        }
                    });
                    return;
                }
                var bloque = $('#bloque-titulo');
                bloque.append(data.html);

                activarNuevoTitulo();
                activarGuardar();
            }, 'json'
        );
    });
}

function activarGuardarTitulo() {
    var boton = $('.guardatitulo');

    boton.off('click');

    boton.on('click', function() {
        boton.off('click');
        console.log($(this).parents('.botones-titulo').first().data('bloque'));

        var id_header, databloque, datos, result, error;

        id_header    = $(this).data('id');
        databloque = $(this).parents('.botones-titulo').first().data('bloque');
        error      = $('#error-'+databloque+'-'+id_header);
        datos      = camposValidar(databloque+'-'+id_header);
        result     = $.parseJSON(datos);

        error.empty();
        error.removeClass('text-danger');
        error.removeClass('text-success');

        if (result.error) {
            error.html('Existen campos no validos y/o vacíos.');
            error.addClass('text-danger');
            activarGuardarTitulo();

            return;
        }

        result.datos.ajax       = true;
        result.datos.accion     = 'guardarDatosTitulo';
        result.datos.id_header    = id_header;
        result.datos.databloque = databloque;

        $.post(
            urlSitio + 'configuracion', result.datos, function (data) {
                error.html(data.message);

                if (!data.success) {
                    error.addClass('text-danger');
                    activarGuardarTitulo();

                    return;
                }

                error.addClass('text-success');

                setTimeout( function () {
                    error.empty();
                }, 1000 );

                activarGuardarTitulo();

            }, 'json'
        );
    });
}
