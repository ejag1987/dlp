$(function () {
    cargarModulo();
    mostrarTipos();
});

function cargarModulo() {

    var boton = $('.menu');

    boton.on('click', function() {
        var id = $(this).data('id');
            alias = $(this).data('alias');
        $.post(
            urlSitio + 'menusitio',
            {
                ajax: true,
                accion: 'cargarModulo',
                id_menu: id,
                alias: alias
            }, function(data) {
                console.log(data);
                if (data.success) {
                    var bloque = $('#contenido');
                    bloque.append(data.html);
                    bloque.html(data.html);
                }
            }, 'json'
        );
    });
}
function mostrarTipos() {

    var boton = $('#nueva-caluga');
    var titulo = $('.titulos');

    titulo.on('click', function () {
    boton.show();
    });

    boton.on('click', function() {
        $('.tipos').show();
    });
}