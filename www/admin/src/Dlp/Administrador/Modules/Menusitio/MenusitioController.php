<?php
namespace Dlp\Administrador\Modules\Menusitio;

use Dlp\Administrador\Modules\Menusitio\Models\MenusitioModel;
use Dlp\Administrador\Modules\Menusitio\Views\MenusitioView;
use ZCode\Lighting\Controller\BaseController;
use ZCode\Lighting\Http\Request;



class MenusitioController extends BaseController
{

    public function run ()
    {
    $alias = $this->request->getUrlVar(1);
        $html = '';

        /** @var MenusitioModel $model */
        $model = $this->createModel('MenusitioModel');
        $color = $model->cargarColor();
        $header   = $model->cargarHeader($alias);
        $titulo   = $model->cargarTitulos($alias);
        $tipoMenu = $model->CargarTipo();


        /** @var MenusitioView $view */
        $view = $this->createView('MenusitioView');
        $html = $view->cargarPagina($header, $titulo, $color, $tipoMenu);

        $this->response = $html;
    }

    public function runAjax()
    {
        $accion = $this->request->getPostVar('accion', Request::STRING);


        if (strlen($accion) > 0) {
            switch ($accion) {
                case 'cargarModulo':
                    $this->cargarModulo();
                    break;
                case 'nuevaCaluga':
                    $this->nuevaCaluga();
                    break;
            }
        }
    }

    private  function cargarModulo()
    {
        $alias = $this->request->getPostVar('alias', Request::STRING);
        $id_menu = $this->request->getPostVar('id_menu', Request::STRING);

        /** @var PortadaModel $model */
        $model = $this->createModel('MenusitioModel');
        $tituloCaluga = $model->cargarTituloCaluga($alias);
        $texto = $model->CargarTexto($alias);
        $caluga = $model->CargarCaluga($alias);

        var_dump($tituloCaluga);



        /** @var PortadaView $view */
        $view = $this->createView('MenusitioView');
        $html= $view->htmlContenidoCalugas($tituloCaluga, $texto);


        $datos['html']  = $html;
        $datos['idCaluga'] = $calugasite->id_portada_caluga;
        $this->generateJsonResponse(true, '', $datos);

    }

    private function nuevaCaluga()
    {

    }

}


