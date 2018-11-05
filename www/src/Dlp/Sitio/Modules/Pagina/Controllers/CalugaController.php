<?php

namespace Dlp\Sitio\Modules\Pagina\Controllers;

use Dlp\Sitio\Modules\Pagina\Models\CalugaModel;
use Dlp\Sitio\Modules\Pagina\Views\CalugaView;
use ZCode\Lighting\Controller\BaseController;

class CalugaController extends BaseController
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
        /** @var CalugaModel $model */
        $model = $this->createModel('CalugaModel');
        $calugas = $model->cargarCalugas($modulo->id_modulo);

        /** @var CalugaView $view */
        $view = $this->createView('CalugaView');
        $html = $view->cargarCalugas($modulo, $calugas);

        return $html;
    }
}