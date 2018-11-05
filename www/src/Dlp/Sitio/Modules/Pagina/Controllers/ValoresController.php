<?php

namespace Dlp\Sitio\Modules\Pagina\Controllers;

use Dlp\Sitio\Modules\Pagina\Models\ValoresModel;
use Dlp\Sitio\Modules\Pagina\Views\ValoresView;
use ZCode\Lighting\Controller\BaseController;

class ValoresController extends BaseController
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
        /** @var ValoresModel $model */
        $model = $this->createModel('ValoresModel');
        $items = $model->cargarModulo($modulo->id_modulo);

        /** @var ValoresView $view */
        $view = $this->createView('ValoresView');
        $html = $view->cargarValores($modulo, $items);

        return $html;
    }

}