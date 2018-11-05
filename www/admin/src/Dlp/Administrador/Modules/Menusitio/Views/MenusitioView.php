<?php
namespace Dlp\Administrador\Modules\Menusitio\Views;


use ZCode\Lighting\View\BaseView;


class MenusitioView extends BaseView
{
    /**
     * @param $header
     * * @param $titulos
     * @return mixed
     */

    public function cargarPagina($header, $titulos, $colores, $tipoMenu)
    {

        $tmpl = $this->loadTemplate('pagina');

        $this->addGlobalJs('inputmask');
        $this->addGlobalJs('jquery.inputmask');

        $this->addGlobalCss('select2');
        $this->addGlobalJs('select2.full.min');
        $this->addGlobalJs('es');

        $this->addGlobalCss('jquery-confirm');
        $this->addGlobalJs('jquery-confirm');

        $this->addGlobalJs('validacion');

        $this->addCss('menu');
        $this->addJs('menu');

        $htmlHeader = '';
        $htmlTitulo = '';
        $htmlTipo= '';

        if ($colores) {
            $optionSelect = $this->generarOption ($colores);
        }

        if ($tipoMenu) {
            foreach ($tipoMenu as $tipo) {
                $htmlTipo .= $this->htmlTipo($tipo);
            }
        }

        if ($header) {
            $htmlHeader .= $this->htmlHeader($header, $optionSelect);
            }

        if ($titulos) {
            foreach ($titulos as $titulo) {
                $htmlTitulo .= $this->htmlTitulo($titulo);
            }
        }

        $tmpl->addSearchReplace('{#HEADER#}', $htmlHeader);
        $tmpl->addSearchReplace('{#TITULOS#}', $htmlTitulo);
        $tmpl->addSearchReplace('{#TIPO#}', $htmlTipo);

        return $tmpl->getHtml();
    }

    public function htmlTipo($tipoMenu)
    {

        $tmpl = $this->loadTemplate('tipos');

        $tmpl->addSearchReplace('{#ID_TIPO#}', $tipoMenu->id_tipo_modulo);
        $tmpl->addSearchReplace('{#TIPO#}', $tipoMenu->nombre);

        return $tmpl->getHtml();
    }

    private function generarOption($colores)
    {
        $options = '';

        if($colores)
        {
            $numItems = sizeof($colores);

            for ($i=0; $i < $numItems; $i++) {
                $options .='<option value="'.$colores[$i]->id_color.'">';
                $options .= $colores[$i]->nombre;
                $options .='</option>';

            }
        }

        return $options;
    }

    /* Funcion para mostrar el header de la pagina */
    public function  htmlHeader($header, $opciones) {


        $tmpl = $this->loadTemplate('header');
        $htmlAccionIcono = $this->htmlImagen($header->id_modulo, 'header');

        if ($header->imagen != '') {
            $imagenIcono = $this->serverInfo->getBaseUrl2().'/uploads/header/'.$header->imagen;
            $htmlAccionIcono = $this->htmlImagen($imagenIcono, $header->id_header);
        }

        $tmpl->addSearchReplace('{#ID_MODULO#}', $header->id_modulo);
        $tmpl->addSearchReplace('{#OPCIONES#}', $opciones);
        $tmpl->addSearchReplace('{#TITULO#}', $header->titulo);
        $tmpl->addSearchReplace('{#TEXTO#}', $header->texto);
        $tmpl->addSearchReplace('{#COLOR#}', $header->color);
        $tmpl->addSearchReplace('{#IMAGEN#}', $htmlAccionIcono);

        return $tmpl->getHtml();
    }
    /* Funcion para mostrar imagenes */
    public function htmlImagen ($imagenIcono, $header)
    {
        $tmpl = $this->loadTemplate('imagen');

        $tmpl->addSearchReplace('{#IMAGEN#}', $imagenIcono);
        $tmpl->addSearchReplace('{#ID#}', $header);

        return $tmpl->getHtml();
    }

    /*Funcion para crear los botones de los titulos */
    public function  htmlTitulo ($titulo) {

        $tmpl = $this->loadTemplate('titulo');

        $tmpl->addSearchReplace('{#TITULO#}', $titulo->nombre);
        $tmpl->addSearchReplace('{#ALIAS#}', $titulo->alias);
        $tmpl->addSearchReplace('{#ID_MENU#}', $titulo->id_menu);

        return $tmpl->getHtml();
    }

    public function htmlContenidoCalugas($tituloCaluga, $texto) {


    }
}