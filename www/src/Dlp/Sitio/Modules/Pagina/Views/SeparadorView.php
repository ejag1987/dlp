<?php

namespace Dlp\Sitio\Modules\Pagina\Views;

use ZCode\Lighting\View\BaseView;

class SeparadorView extends BaseView
{
    public function cargarSeparador($modulo, $item)
    {
        $tmpl = $this->loadTemplate('separador');

        $imagenHtml = '';
        $color = 'transparent';

        if ($item->imagen != '') {
            $imagen = $this->serverInfo->getBaseUrl().'uploads/separador/'.$item->imagen;

            $imagenHtml = '<img class="" src="'.$imagen.'" alt="'.$item->nombre.'">';
        }

        if ($item->color != '') {
            $color = $item->color;
        }

        $alias = 'modulo-'.$modulo->id_modulo;
        if ($modulo->alias != '') {
            $alias = $modulo->alias;
        }

        $tmpl->addSearchReplace('{#COLOR#}', $color);
        $tmpl->addSearchReplace('{#IMAGEN#}', $imagenHtml);
        $tmpl->addSearchReplace('{#ALIAS_MODULO#}', $alias);

        return $tmpl->getHtml();
    }
}