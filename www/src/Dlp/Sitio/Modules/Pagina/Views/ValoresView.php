<?php

namespace Dlp\Sitio\Modules\Pagina\Views;

use ZCode\Lighting\View\BaseView;

class ValoresView extends BaseView
{
    public function cargarValores($modulo, $items)
    {
        $tmpl = $this->loadTemplate('valores');

        $valores = $this->cargarItems($items);

        $tmpl->addSearchReplace('{#TITULO_MODULO#}', $modulo->nombre);
        $tmpl->addSearchReplace('{#VALORES#}', $valores);

        return $tmpl->getHtml();
    }

    private function cargarItems($items)
    {
        $html = '';

        if (sizeof($items) > 0 && $items) {
            foreach ($items as $item) {
                $tmpl = $this->loadTemplate('valores_item');

                $icono = $item->orden.'.';

                if ($item->icono) {
                    $icono = '<img class="" src="'.$this->serverInfo->getBaseUrl().'uploads/iconos/'.$item->icono.'" alt="'.$item->titulo.'">';
                }

                $tmpl->addSearchReplace('{#ICONO#}', $icono);
                $tmpl->addSearchReplace('{#TITULO#}', nl2br($item->titulo));
                $tmpl->addSearchReplace('{#TEXTO#}', nl2br($item->texto));

                $html .= $tmpl->getHtml();
                $tmpl->resetTemplate();
            }
        }

        return $html;
    }
}