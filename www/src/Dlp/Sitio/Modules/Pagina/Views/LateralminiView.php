<?php

namespace Dlp\Sitio\Modules\Pagina\Views;

use ZCode\Lighting\View\BaseView;

class LateralminiView extends BaseView
{
    public function cargarModulo($modulo, $caluga)
    {
        $tmpl = $this->loadTemplate('imagen_lateral');

        $descripcion = $this->cargarDescripcion($caluga['textos']);
        $grilla      = $this->cargarGrilla($caluga['calugas']);

        $alias = 'modulo-'.$modulo->id_modulo;
        if ($modulo->alias != '') {
            $alias = $modulo->alias;
        }

        $tmpl->addSearchReplace('{#ALIAS_MODULO#}', $alias);

        $tmpl->addSearchReplace('{#TEXTOS#}', $descripcion);
        $tmpl->addSearchReplace('{#GRILLA#}', $grilla);
        $tmpl->addSearchReplace('{#COLOR#}', $caluga['textos'][0]->color);

        return $tmpl->getHtml();
    }

    private function cargarDescripcion($textos)
    {
        $html = '';

        if (sizeof($textos) > 0 && $textos) {
            for ($i=0; $i<sizeof($textos); $i++) {
                $tmpl = $this->loadTemplate('imagen_lateral_texto');

                $tmpl->addSearchReplace('{#ORDEN#}', $textos[$i]->orden);

                $tmpl->addSearchReplace('{#COLOR#}', $textos[$i]->color);
                $tmpl->addSearchReplace('{#TITULO#}', $textos[$i]->titulo);
                $tmpl->addSearchReplace('{#TEXTO#}', $textos[$i]->texto);

                $html .= $tmpl->getHtml();
            }
        }

        return $html;
    }

    private function cargarGrilla($calugas)
    {
        $html = '';

        if (sizeof($calugas) > 0 && $calugas) {
            for ($i=0; $i<sizeof($calugas); $i++) {

                $tmpl = $this->loadTemplate('imagen_grilla');

                $imagen = $this->serverInfo->getBaseUrl().'uploads/lateral/'.$calugas[$i]->imagen;

                $tmpl->addSearchReplace('{#ORDEN#}', $calugas[$i]->orden);

                $tmpl->addSearchReplace('{#COLOR#}', $calugas[$i]->color);
                $tmpl->addSearchReplace('{#IMAGEN#}', $imagen);
                $tmpl->addSearchReplace('{#NOMBRE#}', $calugas[$i]->titulo1.' '.$calugas[$i]->titulo2);
                $tmpl->addSearchReplace('{#TITULO1#}', $calugas[$i]->titulo1);
                $tmpl->addSearchReplace('{#TITULO2#}', $calugas[$i]->titulo2);
                $tmpl->addSearchReplace('{#TEXTO#}', $calugas[$i]->texto);

                $html .= $tmpl->getHtml();
            }
        }

        return $html;
    }
}