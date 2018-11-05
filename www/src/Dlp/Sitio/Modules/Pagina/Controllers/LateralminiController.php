<?php

namespace Dlp\Sitio\Modules\Pagina\Controllers;

use Dlp\Sitio\Modules\Pagina\Models\LateralminiModel;
use Dlp\Sitio\Modules\Pagina\Views\LateralminiView;
use ZCode\Lighting\Controller\BaseController;

class LateralminiController extends BaseController
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
        /** @var LateralminiModel $model */
        $model = $this->createModel('LateralminiModel');
        $caluga = $model->cargarModulo($modulo->id_modulo);

        /** @var LateralminiView $view */
        $view = $this->createView('LateralminiView');
        $html = $view->cargarModulo($modulo, $caluga);

        return $html;
    }
}