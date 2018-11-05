<?php

namespace Dlp\Sitio\Modules\Pagina\Views;

use ZCode\Lighting\View\BaseView;

class GaleriaView extends BaseView
{
    public function cargarSeccion($modulo, $item, $categorias)
    {
        $tmpl = $this->loadTemplate('galeria_seccion');

        $alias = 'modulo-'.$modulo->id_modulo;
        if ($modulo->alias != '') {
            $alias = $modulo->alias;
        }

        $posicion = 'left-cuadro';

        switch ($item->posicion) {
            case 1:
                $posicion = 'left-cuadro';
                break;
            case 2:
                $posicion = 'right-cuadro';
                break;
        }

        $imagen = '<img class="" src="'.$this->serverInfo->getBaseUrl().'uploads/galerias/'.$item->alias.'/'.$item->foto_principal.'" 
            alt="'.$item->proyecto.'">';

        $tmpl->addSearchReplace('{#ALIAS_MODULO#}', $alias);
        $tmpl->addSearchReplace('{#POSICION#}', $posicion);
        $tmpl->addSearchReplace('{#COLOR#}', $item->color);
        $tmpl->addSearchReplace('{#TITULO#}', $item->seccion);
        $tmpl->addSearchReplace('{#IMAGEN#}',$imagen);
        $tmpl->addSearchReplace('{#ID_SECCION#}',$item->id_seccion);
        $tmpl->addSearchReplace('{#TIPO_GALERIA#}',$item->id_galeria_tipo);

        $tmpl->addSearchReplace('{#TITULO2#}',$item->proyecto);
        $tmpl->addSearchReplace('{#TITULO1#}',$item->subtitulo);
        $tmpl->addSearchReplace('{#COMUNA#}',$item->comuna);
        $tmpl->addSearchReplace('{#CATEGORIA#}',$item->categoria);
        $tmpl->addSearchReplace('{#ID_PROYECTO#}',$item->id_galeria);

        $galeria = $this->cargarGaleria($item, $categorias);

        $tmpl->addSearchReplace('{#GALERIA#}',$galeria);

        return $tmpl->getHtml();
    }

    private function cargarGaleria($item, $categorias)
    {
        $html = '';

        if (sizeof($categorias) > 1 && $categorias) {
            foreach ($categorias as $categoria) {
                $tmpl = $this->loadTemplate('galeria_item');

                $src = $this->serverInfo->getBaseUrl().'uploads/galerias/imagen.jpg';

                if ($categoria->foto != '') {
                    $src = $this->serverInfo->getBaseUrl().'uploads/galerias/'.$categoria->alias.'/'.$categoria->foto;
                }

                $imagen = '<img class="" src="'.$src.'" alt="'.$categoria->titulo.'">';

                $tmpl->addSearchReplace('{#IMAGEN#}',$imagen);
                $tmpl->addSearchReplace('{#ID_CATEGORIA#}',$categoria->id);
                $tmpl->addSearchReplace('{#CATEGORIA#}',$categoria->titulo);

                $html .= $tmpl->getHtml();
                $tmpl->resetTemplate();
            }

            if ($item->id_galeria_tipo == 1) {
                $tmpl = $this->loadTemplate('galeria_mas');

                $tmpl->addSearchReplace('{#ID_SECCION#}',$item->id_seccion);

                $html .= $tmpl->getHtml();
                $tmpl->resetTemplate();
            }
        }

        return $html;
    }

    public function cargarLightbox($proyectos, $posicion, $categorias)
    {
        $tmpl = $this->loadTemplate('lightbox_galeria');

        $datosSeccion   = $proyectos['seccion'];
        $datosProyectos = $proyectos['proyectos'];

        $html = $this->cargarProyectos($datosProyectos);

        $oculto = '';

        switch ($datosSeccion->tipo) {
            case 1:
                $oculto = 'hide';
                $tipo = 'PROYECTO';
                break;
            case 2:
                $tipo = 'CATEGORÍA';
                break;
        }

        $tmpl->addSearchReplace('{#SECCION#}',str_replace("<br>", " ", $datosSeccion->seccion));
        $tmpl->addSearchReplace('{#CATEGORIA#}',$datosSeccion->categoria);
        $tmpl->addSearchReplace('{#OCULTO#}',$oculto);
        $tmpl->addSearchReplace('{#TIPO#}',$tipo);
        $tmpl->addSearchReplace('{#PROYECTOS#}',$html);

        $cantCategorias = sizeof($categorias);

        $anterior  = $posicion-1;
        $siguiente = $posicion+1;

        if ($posicion == 0) {
            $anterior = $cantCategorias-1;
        } else if ($posicion == $cantCategorias-1) {
            $siguiente = 0;
        }

        $tmpl->addSearchReplace('{#ID_CATEGORIA_PREV#}',$categorias[$anterior]->id);
        $tmpl->addSearchReplace('{#ID_CATEGORIA_NEXT#}',$categorias[$siguiente]->id);

        return $tmpl->getHtml();
    }

    private function cargarProyectos($proyectos)
    {
        $html = '';

        if ($proyectos) {
            foreach ($proyectos as $proyecto) {
                $tmpl = $this->loadTemplate('lightbox_galeria_proyectos');

                $src = $this->serverInfo->getBaseUrl().'uploads/galerias/imagen.jpg';

                if ($proyecto->foto_principal != '') {
                    $src = $this->serverInfo->getBaseUrl().'uploads/galerias/'.$proyecto->alias.'/'.$proyecto->foto_principal;
                }

                $imagen = '<img class="" src="'.$src.'" alt="'.$proyecto->titulo.'">';

                /*$imagen = '<img class="" src="'.$this->serverInfo->getBaseUrl().'uploads/galerias/'.$proyecto->alias.'/'.$proyecto->foto_principal.'"
                    alt="'.$proyecto->titulo.'">';*/

                $tmpl->addSearchReplace('{#ID_PROYECTO#}',$proyecto->id_galeria);
                $tmpl->addSearchReplace('{#IMAGEN#}',$imagen);
                $tmpl->addSearchReplace('{#TITULO#}',$proyecto->titulo);
                $tmpl->addSearchReplace('{#COMUNA#}',$proyecto->comuna);

                $html .= $tmpl->getHtml();
                $tmpl->resetTemplate();
            }
        }

        return $html;
    }

    public function cargarProyecto($proyecto)
    {
        $tmpl = $this->loadTemplate('lightbox_galeria_proyecto');

        $imagen = '';

        if ($proyecto->fotos) {
            foreach ($proyecto->fotos as $foto) {
                $tmplFoto = $this->loadTemplate('lightbox_galeria_fotos');

                $imagenPath = $this->serverInfo->getBaseUrl() . 'uploads/galerias/';
                $imagen = $imagenPath . $proyecto->alias . '/' . $foto->foto;

                if ($foto->foto == '') {
                    $imagen = $imagenPath.'under_construction.jpg';
                }

                $tmplFoto->addSearchReplace('{#IMAGEN#}',$imagen);
                $tmplFoto->addSearchReplace('{#NOMBRE#}',$foto->titulo);

                $imagen = $tmplFoto->getHtml();
            }
        }

        $inmobiliariaLink = '';

        if ($proyecto->inmobiliaria != '') {
            $inmobiliaria = $proyecto->inmobiliaria;

            if ($proyecto->link != '') {
                $inmobiliariaLink = '<a class="link-inmobiliaria" href="'.$proyecto->link.'" target="_blank">
                <img src="'.$this->serverInfo->getBaseUrl().'resources/img/link.svg" alt="Flecha volver">
                <span>'.$inmobiliaria.'</span></a>';
            }
        }

        $tmpl->addSearchReplace('{#BASE_URL#}', $this->serverInfo->getBaseUrl());
        $tmpl->addSearchReplace('{#ID_PROYECTO#}',$proyecto->id_galeria);
        $tmpl->addSearchReplace('{#SECCION#}', str_replace("<br>", " ", $proyecto->seccion));
        $tmpl->addSearchReplace('{#PROYECTO#}',$proyecto->titulo);
        $tmpl->addSearchReplace('{#COMUNA#}',$proyecto->comuna);
        $tmpl->addSearchReplace('{#CATEGORIA#}',$proyecto->categoria);
        $tmpl->addSearchReplace('{#ID_CATEGORIA#}',$proyecto->id_categoria);
        $tmpl->addSearchReplace('{#IMAGEN#}',$imagen);
        $tmpl->addSearchReplace('{#ID_PROYECTO_ANTERIOR#}',$proyecto->anterior);
        $tmpl->addSearchReplace('{#ID_PROYECTO_SIGUIENTE#}',$proyecto->siguiente);
        $tmpl->addSearchReplace('{#INMOBILIARIA#}',$inmobiliariaLink);

        return $tmpl->getHtml();
    }
}