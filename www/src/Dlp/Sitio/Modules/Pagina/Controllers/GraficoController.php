<?php

namespace Dlp\Sitio\Modules\Pagina\Controllers;

use Dlp\Sitio\Modules\Pagina\Models\GraficoModel;
use Dlp\Sitio\Modules\Pagina\Views\GraficoView;
use ZCode\Lighting\Controller\BaseController;
use ZCode\Lighting\Http\Request;

class GraficoController extends BaseController
{
    public function run()
    {
        // Implement run() method.
    }

    public function runAjax()
    {
        $accion = $this->request->getPostVar('accion', Request::STRING);

        if ($accion !== null && strlen($accion) > 0) {
            switch ($accion) {
                case 'cargarDatos':
                    $this->cargarDatos();
                    break;
            }

            return $this->response;
        }

        return false;
    }

    public function cargarModulo($modulo)
    {
        /** @var GraficoModel $model */
        $model = $this->createModel('GraficoModel');
        $graficos = $model->cargarGraficos($modulo->id_modulo);

        /** @var GraficoView $view */
        $view = $this->createView('GraficoView');
        $html = $view->cargarGrafico($modulo, $graficos);

        return $html;
    }

    private function cargarDatos()
    {
        $idGrafico  = $this->request->getPostVar('idGrafico', Request::INTEGER);
        $idioma     = $this->request->getPostVar('idioma', Request::INTEGER);

        /** @var GraficoModel $model */
        $model = $this->createModel('GraficoModel');
        $datos = $model->cargarDatos($idGrafico);

        $json['datos'] = $datos;

        $this->generateJsonResponse(true, '', $json);
    }
}