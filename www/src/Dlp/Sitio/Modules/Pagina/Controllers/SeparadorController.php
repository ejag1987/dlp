<?php

namespace Dlp\Sitio\Modules\Pagina\Controllers;

use Dlp\Sitio\Modules\Pagina\Models\SeparadorModel;
use Dlp\Sitio\Modules\Pagina\Views\SeparadorView;
use ZCode\Lighting\Controller\BaseController;

class SeparadorController extends BaseController
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
        /** @var SeparadorModel $model */
        $model = $this->createModel('SeparadorModel');
        $items = $model->cargarSeparador($modulo->id_modulo);

        /** @var SeparadorView $view */
        $view = $this->createView('SeparadorView');
        $html = $view->cargarSeparador($modulo, $items);

        return $html;
    }
}