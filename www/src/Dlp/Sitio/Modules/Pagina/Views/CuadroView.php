<?php

namespace Dlp\Sitio\Modules\Pagina\Views;

use ZCode\Lighting\View\BaseView;

class CuadroView extends BaseView
{
    public function cargarCuadro($modulo, $cuadros)
    {
        $tmpl = $this->loadTemplate('cuadro');

        $alias = 'modulo-'.$modulo->id_modulo;
        if ($modulo->alias != '') {
            $alias = $modulo->alias;
        }

        $posicion = 'left-cuadro';

        $color = $cuadros['modulo']->color;
        $imagen = '<img class="" src="'.$this->serverInfo->getBaseUrl().'uploads/lateral/'.$cuadros['modulo']->imagen.'" 
            alt="'.$modulo->nombre.'">';

        $textos = $this->cargarTextos($cuadros['textos'], $alias);

        switch ($cuadros['modulo']->posicion) {
            case 1:
                $posicion = 'left-cuadro';
                break;
            case 2:
                $posicion = 'right-cuadro';
                break;
        }

        $claseMovil = '';
        switch ($cuadros['modulo']->posicion_movil) {
            case 1: // arriba foto
                $claseMovil = 'primero-foto';
                break;
            case 2: // arriba texto
                $claseMovil = 'primero-texto';
                break;
            case 3: // sin foto
                $claseMovil = 'sin-foto';
                break;
        }

        $boton = '';
        $form = '';
        if ($alias == 'trabaja_con_nosotros') {
            $boton = '<div class="boton-cargar-formulario">Ingresar formulario</div>';

            $tmplForm = $this->loadTemplate('formulario');

            $form = $tmplForm->getHtml();
        }

        $tmpl->addSearchReplace('{#ALIAS_MODULO#}', $alias);
        $tmpl->addSearchReplace('{#COLOR#}', $color);
        $tmpl->addSearchReplace('{#POSICION#}', $posicion);
        $tmpl->addSearchReplace('{#IMAGEN#}', $imagen);
        $tmpl->addSearchReplace('{#TEXTO#}', $textos);
        $tmpl->addSearchReplace('{#BOTON#}', $boton);
        $tmpl->addSearchReplace('{#FORMULARIO#}', $form);
        $tmpl->addSearchReplace('{#CLASE_MOVIL#}', $claseMovil);

        return $tmpl->getHtml();
    }

    private function cargarTextos($textos, $alias)
    {
        $html = '';

        if (sizeof($textos) > 0 && $textos) {
            foreach ($textos as $texto) {
                $tmpl = $this->loadTemplate('cuadro_item');

                $tmpl->addSearchReplace('{#TITULO#}', nl2br($texto->titulo));
                $tmpl->addSearchReplace('{#TEXTO#}', nl2br($texto->texto));

                $html .= $tmpl->getHtml();
            }
        }

        return $html;
    }
}