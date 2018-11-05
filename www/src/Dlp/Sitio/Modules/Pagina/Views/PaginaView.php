<?php

namespace Dlp\Sitio\Modules\Pagina\Views;

use ZCode\Lighting\View\BaseView;

class PaginaView extends BaseView
{
    public function cargarPagina($pagina, $datos)
    {
        $tmpl = $this->loadTemplate('pagina');

        if (sizeof($datos['tipos']) > 0) {
            foreach ($datos['tipos'] as $tipo) {
                switch ($tipo) {
                    case 1: // Slide
                        $this->addGlobalCss('owl.carousel');
                        $this->addCss('slide');

                        $this->addGlobalJs('owl.carousel.min');
                        $this->addJs('slide');
                        break;
                    case 2: // Caluga portada
                        $this->addCss('caluga');
                        break;
                    case 3: // Header
                        $this->addCss('header');
                        break;
                    case 4: // Imagen lateral color
                        $this->addCss('lateral');
                        break;
                    case 5: // Separador
                        $this->addCss('separador');
                        break;
                    case 6: // Imagen cuadro
                        $this->addCss('imagencuadro');
                        break;
                    case 7: // Cuadro de texto
                        $this->addCss('cuadro');
                        $this->addJs('bulma-steps.min');
                        $this->addJs('cuadro');
                        break;
                    case 8: // Valores
                        $this->addCss('valores');
                        $this->addJs('valores');
                        break;
                    case 9: // Galeria
                        $this->addGlobalCss('owl.carousel');
                        $this->addCss('galeria');

                        $this->addGlobalJs('owl.carousel.min');
                        $this->addJs('galeria');
                        break;
                    case 10: // Cifras
                        $this->addCss('cifras');
                        break;
                    case 11: // Gráfico
                        $this->addCss('grafico');
                        $this->addGlobalJs('d3.min');
                        $this->addJs('grafico');
                        break;
                }
            }
        }

        $tmpl->addSearchReplace('{#TITULO_PAGINA#}', $pagina->titulo);
        $tmpl->addSearchReplace('{#IDIOMA#}', $pagina->codigo);
        $tmpl->addSearchReplace('{#MODULOS#}', $datos['html']);

        return $tmpl->getHtml();
    }
}