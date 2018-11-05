<?php

namespace Dlp\Sitio\Modules\Pagina\Controllers;

use Dlp\Sitio\Modules\Pagina\Models\GaleriaModel;
use Dlp\Sitio\Modules\Pagina\Views\GaleriaView;
use Dlp\Sitio\System\FuncionesGlobales;
use ZCode\Lighting\Controller\BaseController;
use ZCode\Lighting\Http\Request;

class GaleriaController extends BaseController
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
                case 'cargarProyectos':
                    $this->cargarProyectos();
                    break;
                case 'proyectoItem':
                    $this->proyectoItem();
                    break;
            }

            return $this->response;
        }

        return false;
    }

    public function cargarModulo($modulo)
    {
        /** @var GaleriaModel $model */
        $model = $this->createModel('GaleriaModel');
        $item = $model->cargarGalerias($modulo->id_modulo);

        $categorias = [];

        switch ($item->id_galeria_tipo) {
            case 1: // por proyecto
                $categorias = $model->buscarProyectos($item->id_seccion);
                break;
            case 2: // por categoria
                $categorias = $model->buscarCategorias($item->id_seccion);
                break;
        }

        /** @var GaleriaView $view */
        $view = $this->createView('GaleriaView');
        $html = $view->cargarSeccion($modulo, $item, $categorias);

        return $html;
    }

    private function cargarProyectos()
    {
        $idCategoria = $this->request->getPostVar('idCategoria', Request::INTEGER);
        $idSeccion   = $this->request->getPostVar('idSeccion', Request::INTEGER);

        /** @var GaleriaModel $model */
        $model = $this->createModel('GaleriaModel');

        if ($idSeccion > 0) {
            $proyectos = $model->proyectosPorSeccion($idSeccion);
        } else {
            $proyectos = $model->cargarProyectos($idCategoria);
        }

        $categorias = $model->buscarCategorias($proyectos['seccion']->id_seccion);
        $posicion = FuncionesGlobales::buscaIndiceObjeto($categorias, $idCategoria, 'id')['indice'];

        /** @var GaleriaView $view */
        $view = $this->createView('GaleriaView');
        $lightbox = $view->cargarLightbox($proyectos, $posicion, $categorias);

        $json['html'] = $lightbox;

        $this->generateJsonResponse(true, '', $json);
    }

    private function proyectoItem()
    {
        $idProyecto = $this->request->getPostVar('idProyecto', Request::INTEGER);

        /** @var GaleriaModel $model */
        $model = $this->createModel('GaleriaModel');
        $proyecto = $model->cargarProyecto($idProyecto);

        /** @var GaleriaView $view */
        $view = $this->createView('GaleriaView');
        $htmlProyecto = $view->cargarProyecto($proyecto);

        $json['html'] = $htmlProyecto;

        $this->generateJsonResponse(true, '', $json);
    }

}