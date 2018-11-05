<?php

namespace Dlp\Administrador\Modules\Header\Views;

use ZCode\Lighting\View\BaseView;

class HeaderView extends BaseView
{
    public function cargarHeader($usuario, $idUsuario)
    {
        $tmpl = $this->loadTemplate('header');

        $this->addCss('header');

        $tmpl->addSearchReplace('{#ID_USUARIO#}', $idUsuario);
        $tmpl->addSearchReplace('{#NOMBRE_USUARIO#}', $usuario);


        return $tmpl->getHtml();
    }
}