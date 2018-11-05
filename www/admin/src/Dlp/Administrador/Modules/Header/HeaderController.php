<?php

namespace Dlp\Administrador\Modules\Header;

use Dlp\Administrador\Modules\Header\Views\HeaderView;
use ZCode\Lighting\Controller\BaseController;
use ZCode\Lighting\Http\ServerInfo;

class HeaderController extends BaseController
{
    public function run()
    {
        $modulo     = $this->serverInfo->getData(ServerInfo::MODULE);
        $html       = '';

        if ($modulo !== 'Login') {
            $html = $this->generarHeader();
        }

        $this->response = $html;

    }

    public function runAjax()
    {
        // Implement runAjax() method.
    }

    private function generarHeader()
    {
        $idUsuario   = $this->session->getString('idUsuario');
        $usuario     = $this->session->getString('nombre');

        /** @var HeaderView $view */
        $view = $this->createView('HeaderView');
        $html = $view->cargarHeader($usuario, $idUsuario);
        $this->response = $html;

        return $html;
    }
}