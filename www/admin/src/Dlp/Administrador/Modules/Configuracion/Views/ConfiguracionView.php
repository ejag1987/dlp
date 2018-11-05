<?php

namespace Dlp\Administrador\Modules\Configuracion\Views;


use ZCode\Lighting\View\BaseView;

class ConfiguracionView extends BaseView
{
    /**
     * @param $header
     * @return mixed
     */

    public function cargarPagina($titulo, $footer, $direccion)
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

        $this->addCss('configuracion');
        $this->addJs('configuracion');

        $htmlTitulo = '';
        $htmlFooter = '';
        $htmlDireccion = '';

        if ($titulo) {
            foreach ($titulo as $tituloHeader) {
                $htmlTitulo .= $this->htmlHeader($tituloHeader);
            }
        }
        if ($footer) {
            foreach ($footer as $iconosFooter) {
                $htmlFooter .= $this->htmlFooter($iconosFooter);
            }
        }
        if($direccion){
            foreach ($direccion as $ubicacion) {
                $htmlDireccion .= $this->htmlDireccion($ubicacion);
            }
        }

        $tmpl->addSearchReplace('{#TITULOS#}', $htmlTitulo);
        $tmpl->addSearchReplace('{#FOOTER#}', $htmlFooter);
        $tmpl->addSearchReplace('{#DIRECCION#}', $htmlDireccion);

        return $tmpl->getHtml();
    }

    public function  htmlHeader($tituloHeader) {

        $tmpl = $this->loadTemplate('header');

        $tmpl->addSearchReplace('{#ID_MENU#}', $tituloHeader->id_menu);
        $tmpl->addSearchReplace('{#TITULO#}', $tituloHeader->nombre);

        return $tmpl->getHtml();
    }
    public function  htmlFooter($iconosFooter) {

        $tmpl = $this->loadTemplate('footer');

        $tmpl->addSearchReplace('{#ID_FOOTER#}', $iconosFooter->id_menu_footer);
        $tmpl->addSearchReplace('{#MENU#}', $iconosFooter->menu);
        $tmpl->addSearchReplace('{#LINK#}', $iconosFooter->link);


        return $tmpl->getHtml();
    }
    public function  htmlDireccion($ubicacion) {

        $tmpl = $this->loadTemplate('direccion');

        $tmpl->addSearchReplace('{#ID_CONFIGURACION#}', $ubicacion->id_configuracion);
        $tmpl->addSearchReplace('{#CONFIGURACION#}', $ubicacion->configuracion);
        $tmpl->addSearchReplace('{#VALOR#}', $ubicacion->valor);

        return $tmpl->getHtml();


    }

    public function htmlNuevoTitulo($titulo)
    {
        $tmpl = $this->loadTemplate('header');

        var_dump($titulo);


        $tmpl->addSearchReplace('{#ID_MENU#}', $titulo->id_menu);
        $tmpl->addSearchReplace('{#TITULO#}', $titulo->nombre);

        return $tmpl->getHtml();
    }
}