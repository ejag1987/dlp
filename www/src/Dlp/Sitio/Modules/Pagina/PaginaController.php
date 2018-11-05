<?php

namespace Dlp\Sitio\Modules\Pagina;

use Dlp\Sitio\Modules\Pagina\Controllers\CalugaController;
use Dlp\Sitio\Modules\Pagina\Controllers\HeaderController;
use Dlp\Sitio\Modules\Pagina\Controllers\LateralController;
use Dlp\Sitio\Modules\Pagina\Controllers\LateralminiController;
use Dlp\Sitio\Modules\Pagina\Controllers\SeparadorController;
use Dlp\Sitio\Modules\Pagina\Controllers\SlideController;
use Dlp\Sitio\Modules\Pagina\Models\PaginaModel;
use Dlp\Sitio\Modules\Pagina\Views\PaginaView;
use Dlp\Sitio\System\Variables;
use ZCode\Lighting\Controller\BaseController;
use ZCode\Lighting\Http\Request;

class PaginaController extends BaseController
{
    public function run()
    {
        $idioma = $this->request->getUrlVar(0);
        $pagina = $this->request->getUrlVar(2);

        if (!$idioma) {
            $idioma = Variables::DEF_IDIOMA;
        }

        /** @var PaginaModel $model */
        $model = $this->createModel('PaginaModel');
        $pagina = $model->cargarPagina($idioma, $pagina);

        $modulos = $model->cargarModulos($pagina->id_pagina);
        $datosModulos = $this->cargarModulos($modulos);

        /** @var PaginaView $view */
        $view = $this->createView('PaginaView');
        $html = $view->cargarPagina($pagina, $datosModulos);

        $this->response = $html;
    }

    public function runAjax()
    {
        $controller = $this->request->getPostVar('controller', Request::STRING);

        $controlador = $this->createController($controller.'Controller');

        $this->response = $controlador->runAjax();
    }

    private function cargarModulos($modulos)
    {
        $contarModulos = sizeof($modulos);
        $html = '';
        $tipoModulo = [];

        if ($contarModulos > 0 && $modulos) {
            for ($i=0; $i<$contarModulos; $i++) {
                if (!in_array($modulos[$i]->id_tipo_modulo, $tipoModulo, true)) {
                    $tipoModulo[] = $modulos[$i]->id_tipo_modulo;
                }

                $controller = ucfirst($modulos[$i]->tabla).'Controller';

                /** @var SlideController $controlador */
                /** @var CalugaController $controlador */
                /** @var HeaderController $controlador */
                /** @var SeparadorController $controlador */
                /** @var LateralController $controlador */
                /** @var LateralminiController $controlador */
                $controlador = $this->createController($controller);
                $html .= $controlador->cargarModulo($modulos[$i]);
            }
        }

        $datos = [
            'html'=> $html,
            'tipos' => $tipoModulo
        ];

        return $datos;
    }
}