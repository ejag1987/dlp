<?php

namespace Dlp\Sitio\Modules\Pagina\Views;

use ZCode\Lighting\View\BaseView;

class HeaderView extends BaseView
{
    public function cargarHeader($modulo, $header)
    {
        $tmpl = $this->loadTemplate('header');

        $imagen = $this->serverInfo->getBaseUrl().'uploads/header/'.$header->imagen;
        $posicion = 'right-header';

        $alias = 'modulo-'.$modulo->id_modulo;
        if ($modulo->alias != '') {
            $alias = $modulo->alias;
        }

        $tmpl->addSearchReplace('{#ALIAS_MODULO#}', $alias);

        $tmpl->addSearchReplace('{#NOMBRE#}', $header->titulo);
        $tmpl->addSearchReplace('{#TITULO#}', $header->titulo);
        $tmpl->addSearchReplace('{#TEXTO#}', nl2br($header->texto));
        $tmpl->addSearchReplace('{#IMAGEN#}', $imagen);

        $tmpl->addSearchReplace('{#COLOR#}', $header->color);
        $tmpl->addSearchReplace('{#POSICION#}', $posicion);


        return $tmpl->getHtml();
    }

}