<?php

namespace Dlp\Administrador\Modules\Menu\Views;


use ZCode\Lighting\View\BaseView;

class MenuView extends BaseView
{
    public function cargarIdiomas($idioma){
        $tmpl= $this-> loadTemplate('menu');
        $optionSelect = '';
        $tmpl->addSearchReplace('{#IDIOMAS#}', $optionSelect);

        return $tmpl -> getHtml();
    }

    public function cargarMenu ($menu)
    {

        $tmpl= $this -> loadTemplate('menu');
        // SELECT2
        $this->addGlobalCss('select2');
        $this->addGlobalCss('layout');
        $this->addGlobalJs('select2.full.min');
        $this->addGlobalJs('es');

        $this->addCss('menu');
        $this->addJs('menu');

        $htmlItem = '';
        if($menu) {
            foreach ($menu as $lista) {
                $htmlItem .= $this->listado($lista);
            }
        }
        $tmpl->addSearchReplace('{#MENU#}', $htmlItem);

        return $tmpl->getHtml();
    }

    public function listado($lista)
    {
        $tmpl = $this->loadTemplate('listado');

        $nombre = strtolower($lista->nombre);
        $nombre = ucfirst($nombre);

        $tmpl->addSearchReplace('{#ID_MENU#}', $lista->id_menu);
        $tmpl->addSearchReplace('{#IDIOMA#}', $lista->id_idioma);
        $tmpl->addSearchReplace('{#NOMBRE#}', $nombre);
        $tmpl->addSearchReplace('{#ALIAS#}', $lista->alias);

        return $tmpl->getHtml();
    }
}
