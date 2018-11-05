<?php

namespace Dlp\Sitio\Modules\Pagina\Controllers;

use Dlp\Sitio\Modules\Pagina\Models\SlideModel;
use Dlp\Sitio\Modules\Pagina\Views\SlideView;
use ZCode\Lighting\Controller\BaseController;

class SlideController extends BaseController
{
    public function run()
    {
        // Implement run() method.
    }

    public function runAjax()
    {
        // Implement runAjax() method.
    }

    public function cargarModulo($modulo)
    {
        /** @var SlideModel $model */
        $model = $this->createModel('SlideModel');
        $slide = $model->cargarSlides($modulo->id_modulo);

        /** @var SlideView $view */
        $view = $this->createView('SlideView');
        $html = $view->cargarSlide($modulo, $slide);

        return $html;
    }
}