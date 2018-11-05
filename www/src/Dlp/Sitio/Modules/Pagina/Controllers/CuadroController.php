<?php

namespace Dlp\Sitio\Modules\Pagina\Controllers;

use Dlp\Sitio\Modules\Pagina\Models\CuadroModel;
use Dlp\Sitio\Modules\Pagina\Views\CuadroView;
use ZCode\Lighting\Controller\BaseController;

class CuadroController extends BaseController
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
        /** @var CuadroModel $model */
        $model = $this->createModel('CuadroModel');
        $cuadros = $model->cargarCuadro($modulo->id_modulo);

        /** @var CuadroView $view */
        $view = $this->createView('CuadroView');
        $html = $view->cargarCuadro($modulo, $cuadros);

        return $html;
    }
}