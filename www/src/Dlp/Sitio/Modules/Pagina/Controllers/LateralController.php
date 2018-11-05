<?php

namespace Dlp\Sitio\Modules\Pagina\Controllers;

use Dlp\Sitio\Modules\Pagina\Models\LateralModel;
use Dlp\Sitio\Modules\Pagina\Views\LateralView;
use ZCode\Lighting\Controller\BaseController;

class LateralController extends BaseController
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
        /** @var LateralModel $model */
        $model = $this->createModel('LateralModel');
        $caluga = $model->cargarModulo($modulo->id_modulo);

        /** @var LateralView $view */
        $view = $this->createView('LateralView');
        $html = $view->cargarModulo($modulo, $caluga);

        return $html;
    }
}