<?php
namespace Dlp\Administrador\Modules\Configuracion;

use Dlp\Administrador\Modules\Configuracion\Views\ConfiguracionView;
use Dlp\Administrador\Modules\Configuracion\Models\ConfiguracionModel;
use ZCode\Lighting\Controller\BaseController;
use ZCode\Lighting\Http\Request;

class ConfiguracionController extends BaseController
{
    public function run ()
    {

        /** @var ConfiguracionModel $model */
        $model = $this->createModel('ConfiguracionModel');
        $header   = $model->cargarHeader();
        $footer = $model->cargarFooter();
        $direccion = $model->cargarDireccion();

        /** @var ConfiguracionView $view */
        $view = $this->createView('ConfiguracionView');
        $html = $view->cargarPagina($header, $footer, $direccion);

        $this->response = $html;
    }
    public function runAjax()
    {
        $accion = $this->request->getPostVar('accion', Request::STRING);

        if (strlen($accion) > 0) {
            switch ($accion) {
                case 'nuevoTitulo':
                    $this->nuevoTitulo();
                    break;
                case 'guardarDatosTitulo':
                    $this->guardarDatosTitulo();
                    break;
            }
        }
    }
    private function nuevoTitulo()
    {
        /** @var configuracionModel $model */
        $model = $this->createModel('configuracionModel');
        $titulo = $model->crearTitulo();


        /** @var configuracionView $view */
        $view = $this->createView('configuracionView');
        $html = $view->htmlHeader($titulo);

        $datos['html']  = $html;
        $datos['id_menu'] = $titulo->id_menu;
        $this->generateJsonResponse(true, '', $datos);
    }
    private function guardarDatosTitulo()
    {
        $id_menu  = $this->request->getPostVar('id_menu', Request::INTEGER);
        $titulo   = $this->request->getPostVar('titulo-'.$id_menu, Request::STRING);
        $bloque = $this->request->getPostVar('databloque', Request::STRING);

        /** @var PortadaModel $model */
        $model = $this->createModel('ConfiguracionModel');
        $guardar = $model->guardarTitulo($id_menu, $titulo, $bloque);

        if (!$guardar) {
            $this->generateJsonResponse(false, 'No se ha podido actualizar.');
            return;
        }

        $this->generateJsonResponse(true, 'Listo!! guardado.');
    }
}