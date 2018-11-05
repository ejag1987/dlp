<?php

namespace Dlp\Sitio\Modules\Pagina\Views;

use ZCode\Lighting\View\BaseView;

class GraficoView extends BaseView
{
    public function cargarGrafico($modulo, $graficos)
    {
        $tmpl = $this->loadTemplate('grafico');

        $alias = 'modulo-'.$modulo->id_modulo;
        if ($modulo->alias != '') {
            $alias = $modulo->alias;
        }

        $htmlGrafico = $this->cargarItem($graficos);

        $tmpl->addSearchReplace('{#ALIAS_MODULO#}', $alias);
        $tmpl->addSearchReplace('{#GRAFICO#}', $htmlGrafico);

        return $tmpl->getHtml();
    }

    private function cargarItem($graficos)
    {
        $html = '';

        if(sizeof($graficos)>0 && isset($graficos)) {
            foreach ($graficos as $grafico) {

                $tmpl = $this->loadTemplate('grafico_item');

                $tmpl->addSearchReplace('{#ID_GRAFICO#}', $grafico->id_grafico);
                $tmpl->addSearchReplace('{#TITULO#}', $grafico->titulo);
                $tmpl->addSearchReplace('{#COLOR#}', $grafico->color);
                $tmpl->addSearchReplace('{#LEYENDA#}', $grafico->leyenda);

                $html .= $tmpl->getHtml();
                $tmpl->resetTemplate();
            }
        }

        return $html;
    }
}
