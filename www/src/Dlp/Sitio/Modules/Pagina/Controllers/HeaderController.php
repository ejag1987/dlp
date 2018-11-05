<?php

namespace Dlp\Sitio\Modules\Pagina\Controllers;

use Dlp\Sitio\Modules\Pagina\Models\HeaderModel;
use Dlp\Sitio\Modules\Pagina\Views\HeaderView;
use ZCode\Lighting\Controller\BaseController;

class HeaderController extends BaseController
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
        /** @var HeaderModel $model */
        $model = $this->createModel('HeaderModel');
        $header = $model->cargarHeader($modulo->id_modulo);

        /** @var HeaderView $view */
        $view = $this->createView('HeaderView');
        $html = $view->cargarHeader($modulo, $header);

        return $html;
    }
}