<?php

namespace Dlp\Sitio\Modules\Pagina\Views;

use ZCode\Lighting\View\BaseView;

class SlideView extends BaseView
{
    public function cargarSlide($modulo, $slides)
    {
        $tmpl = $this->loadTemplate('slide');

        $item = $this->itemSlides($slides);

        $alias = 'modulo-'.$modulo->id_modulo;
        if ($modulo->alias != '') {
            $alias = $modulo->alias;
        }

        $tmpl->addSearchReplace('{#IMAGENES#}', $item);
        $tmpl->addSearchReplace('{#ALIAS_MODULO#}', $alias);

        return $tmpl->getHtml();
    }

    private function itemSlides($slides)
    {
        $html = '';

        if (sizeof($slides) && $slides) {
            foreach ($slides as $item) {
                $tmpl = $this->loadTemplate('slide_item');

                $logo = $this->serverInfo->getBaseUrl().'uploads/slide/'.$item->logo;
                $imagen = $this->serverInfo->getBaseUrl().'uploads/slide/'.$item->imagen;
                $imagen_movil = $this->serverInfo->getBaseUrl().'uploads/slide/'.$item->imagen_movil;

                $tmpl->addSearchReplace('{#LOGO#}', $logo);
                $tmpl->addSearchReplace('{#NOMBRE#}', $item->nombre);
                $tmpl->addSearchReplace('{#TITULO_1#}', $item->texto1);
                $tmpl->addSearchReplace('{#TITULO_2#}', $item->texto2);
                $tmpl->addSearchReplace('{#IMAGEN#}', $imagen);
                $tmpl->addSearchReplace('{#IMAGEN_MOVIL#}', $imagen_movil);

                $html .= $tmpl->getHtml();
            }
        }

        return $html;
    }
}