<?php

namespace Dlp\Sitio\Modules\Pagina\Controllers;

use Dlp\Sitio\Modules\Pagina\Models\CifrasModel;
use Dlp\Sitio\Modules\Pagina\Views\CifrasView;
use ZCode\Lighting\Controller\BaseController;

class CifrasController extends BaseController
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
        /** @var CifrasModel $model */
        $model = $this->createModel('CifrasModel');
        $cifras = $model->cargarItems($modulo->id_modulo);

        /** @var CifrasView $view */
        $view = $this->createView('CifrasView');
        $html = $view->cargarModulo($modulo, $cifras);

        return $html;
    }
}