<?php
namespace Dlp\Administrador\Modules\Portada\Views;

use ZCode\Lighting\View\BaseView;

class PortadaView extends BaseView
{

    /**
     * @param $calugas
     * * @param $slider
     * @return mixed
     */

    public  function cargarPortada ($calugas, $slider)
    {
        $tmpl = $this->loadTemplate('portada');

        $this->addGlobalCss('upload');
        $this->addGlobalJs('jquery.ui.widget');
        $this->addGlobalJs('load-image.all.min');
        $this->addGlobalJs('canvas-to-blob.min');
        $this->addGlobalJs('jquery.iframe-transport');
        $this->addGlobalJs('jquery.fileupload');
        $this->addGlobalJs('jquery.fileupload-process');
        $this->addGlobalJs('jquery.fileupload-image');
        $this->addGlobalJs('jquery.fileupload-validate');

        $this->addGlobalCss('jquery-confirm');
        $this->addGlobalJs('jquery-confirm');

        $this->addGlobalJs('jquery-ui.min');

        $this->addGlobalJs('validacion');

        $this->addCss('portada');
        $this->addJs('portada');


        $htmlCaluga = '';
        $htmlSlide = '';

        if ($calugas) {
            foreach ($calugas as $caluga) {
                $htmlCaluga .= $this->htmlCaluga($caluga);
            }
        }

        if ($slider) {
            foreach ($slider as $slide) {
                $htmlSlide .= $this->htmlSlide($slide);
            }
        }

        $tmpl->addSearchReplace('{#CALUGA#}', $htmlCaluga);
        $tmpl->addSearchReplace('{#SLIDER#}', $htmlSlide);

        return $tmpl->getHtml();
    }

    public function htmlSlide($slide)
    {
        $tmpl = $this->loadTemplate('slide');

        $htmlAccionIcono = $this->htmlSubirImagen($slide->id_slide, 'slide');

        if ($slide->imagen != '') {
            $imagen= $this->serverInfo->getBaseUrl2().'/uploads/slide/'.$slide->imagen;
            $htmlAccionIcono = $this->htmlImagen($imagen, $slide->id_slide);
        }

        $tmpl->addSearchReplace('{#ID_SLIDE#}', $slide->id_slide);
        $tmpl->addSearchReplace('{#NOMBRE#}', $slide->nombre);
        $tmpl->addSearchReplace('{#TEXTO1#}', $slide->texto1);
        $tmpl->addSearchReplace('{#TEXTO2#}', $slide->texto2);
        $tmpl->addSearchReplace('{#HTML_ACCION_ICONO#}', $htmlAccionIcono);

        return $tmpl->getHtml();
    }

    public function htmlCaluga ($caluga)
    {
        $tmpl = $this->loadTemplate('caluga');

        $htmlAccionIcono = $this->htmlSubirImagen($caluga->id_caluga, 'slide');

        if ($caluga->imagen != '') {
            $imagen= $this->serverInfo->getBaseUrl2().'/uploads/caluga/'.$caluga->imagen;
            $htmlAccionIcono = $this->htmlImagen($imagen, $caluga->id_caluga);
        }


        $tmpl->addSearchReplace('{#ID_CALUGA#}', $caluga->id_caluga);
        $tmpl->addSearchReplace('{#TITULO1#}', $caluga->titulo1);
        $tmpl->addSearchReplace('{#TITULO2#}', $caluga->titulo2);
        $tmpl->addSearchReplace('{#TEXTO#}', $caluga->texto);
        $tmpl->addSearchReplace('{#COLOR#}', $caluga->color);
        $tmpl->addSearchReplace('{#LINK#}', $caluga->link);
        $tmpl->addSearchReplace('{#HTML_ACCION_ICONO#}', $htmlAccionIcono);


        return $tmpl->getHtml();
    }

    public function htmlImagen($imagen, $id_imagen)
    {
        $tmpl = $this->loadTemplate('imagen');

        $tmpl->addSearchReplace('{#IMAGEN#}', $imagen);
        $tmpl->addSearchReplace('{#ID#}', $id_imagen);

        return $tmpl->getHtml();
    }
    public function htmlNuevoSlide($slide)
    {
        $tmpl = $this->loadTemplate('slide');


        $htmlAccionIcono = $this->htmlSubirImagen($slide->id_slide, 'slide');

        $tmpl->addSearchReplace('{#ID_SLIDE#}', $slide->id_slide);
        $tmpl->addSearchReplace('{#NOMBRE#}', $slide->nombre);
        $tmpl->addSearchReplace('{#TEXTO1#}', $slide->texto1);
        $tmpl->addSearchReplace('{#TEXTO2#}', $slide->texto2);
        $tmpl->addSearchReplace('{#HTML_ACCION_ICONO#}', $htmlAccionIcono);

        return $tmpl->getHtml();
    }

    public function htmlNuevaCaluga($caluga)
    {
        $tmpl = $this->loadTemplate('caluga');

        $htmlAccionIcono = $this->htmlSubirImagen($caluga->id_caluga, 'caluga');

        $tmpl->addSearchReplace('{#ID_CALUGA#}', $caluga->id_caluga);
        $tmpl->addSearchReplace('{#COLOR#}', $caluga->color);
        $tmpl->addSearchReplace('{#TITULO1#}', $caluga->titulo1);
        $tmpl->addSearchReplace('{#TITULO2#}', $caluga->titulo2);
        $tmpl->addSearchReplace('{#TEXTO#}', $caluga->texto);
        $tmpl->addSearchReplace('{#LINK#}', $caluga->link);
        $tmpl->addSearchReplace('{#HTML_ACCION_ICONO#}', $htmlAccionIcono);

        return $tmpl->getHtml();
    }

    public function htmlSubirImagen($idSlide, $bloque)
    {
        $tmpl = $this->loadTemplate('subir_imagen');

        $tmpl->addSearchReplace('{#ID#}', $idSlide);
        $tmpl->addSearchReplace('{#BLOQUE#}', $bloque);

        return $tmpl->getHtml();
    }

}