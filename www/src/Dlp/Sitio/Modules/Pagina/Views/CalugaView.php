<?php

namespace Dlp\Sitio\Modules\Pagina\Views;

use ZCode\Lighting\View\BaseView;

class CalugaView extends BaseView
{
    public function cargarCalugas($modulo, $calugas)
    {
        $tmpl = $this->loadTemplate('calugas');

        $item = $this->itemCalugas($calugas);

        $alias = 'modulo-'.$modulo->id_modulo;
        if ($modulo->alias != '') {
            $alias = $modulo->alias;
        }

        $tmpl->addSearchReplace('{#CALUGAS#}', $item);
        $tmpl->addSearchReplace('{#ALIAS_MODULO#}', $alias);

        return $tmpl->getHtml();
    }

    private function itemCalugas($calugas)
    {
        $html = '';

        if (sizeof($calugas) && $calugas) {
            foreach ($calugas as $item) {
                $tmpl = $this->loadTemplate('calugas_item');

                $imagen = $this->serverInfo->getBaseUrl().'uploads/caluga/'.$item->imagen;
                $posicion = 'left';

                switch ($item->posicion) {
                    case 1:
                        $posicion = 'left';
                        break;
                    case 2:
                        $posicion = 'right';
                        break;
                }

                $boton = '';

                if ($item->link != '') {
                    $boton = '<a class="boton-portada" href="'.$this->serverInfo->getBaseUrl().$item->link.'">Ver más</a>';
                }

                $tmpl->addSearchReplace('{#NOMBRE#}', $item->titulo1.$item->titulo2);
                $tmpl->addSearchReplace('{#TITULO_BLACK#}', $item->titulo1);
                $tmpl->addSearchReplace('{#TITULO_LIGHT#}', $item->titulo2);
                $tmpl->addSearchReplace('{#TEXTO#}', $item->texto);
                $tmpl->addSearchReplace('{#IMAGEN#}', $imagen);

                $tmpl->addSearchReplace('{#CLASE#}', $item->color);
                $tmpl->addSearchReplace('{#POSICION#}', $posicion);
                $tmpl->addSearchReplace('{#BOTON#}', $boton);

                $html .= $tmpl->getHtml();
            }
        }

        return $html;
    }
}