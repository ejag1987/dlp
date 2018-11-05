<?php

namespace Dlp\Sitio\Modules\Pagina\Views;

use ZCode\Lighting\View\BaseView;

class CifrasView extends BaseView
{
    public function cargarModulo($modulo, $cifras)
    {
        $tmpl = $this->loadTemplate('cifras');

        $alias = 'modulo-'.$modulo->id_modulo;
        if ($modulo->alias != '') {
            $alias = $modulo->alias;
        }

        $item = $this->cargarCuadros($cifras);

        $tmpl->addSearchReplace('{#CIFRAS#}', $item);
        $tmpl->addSearchReplace('{#ALIAS_MODULO#}', $alias);

        return $tmpl->getHtml();
    }

    private function cargarCuadros($cifras)
    {
        $html = '';
        $countItems = sizeof($cifras);

        if ($countItems > 0 && $cifras) {
            $j = 1;

            for ($i=0; $i<$countItems; $i++) {
                $tmpl = $this->loadTemplate('cifras_item');

                $clase = 'is-half';
                $titulo = '';
                $textoGrande = '';
                $textoMedio = '';
                $textoChico = '';

                if ($j > 0 && $j < 5) {
                    $clase = 'is-3';
                } else if ($j == 6) {
                    $j = 0;
                }

                if ($cifras[$i]->titulo != null) {
                    $titulo = nl2br($cifras[$i]->titulo);
                }
                if ($cifras[$i]->texto_grande != null) {
                    $textoGrande = nl2br($cifras[$i]->texto_grande);
                }
                if ($cifras[$i]->texto_medio != null) {
                    $textoMedio = nl2br($cifras[$i]->texto_medio);
                }
                if ($cifras[$i]->texto_chico != null) {
                    $textoChico = nl2br($cifras[$i]->texto_chico);
                }

                $tmpl->addSearchReplace('{#COLOR#}', $cifras[$i]->color);
                $tmpl->addSearchReplace('{#CLASE#}', $clase);
                $tmpl->addSearchReplace('{#TITULO#}', $titulo);
                $tmpl->addSearchReplace('{#TEXTO_GRANDE#}', $textoGrande);
                $tmpl->addSearchReplace('{#TEXTO_MEDIO#}', $textoMedio);
                $tmpl->addSearchReplace('{#TEXTO_CHICO#}', $textoChico);


                $j++;

                $html .= $tmpl->getHtml();
                $tmpl->resetTemplate();
            }
        }

        return $html;
    }
}