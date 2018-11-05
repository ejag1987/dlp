<?php

namespace Dlp\Sitio\Modules\Contacto\Views;

use ZCode\Lighting\View\BaseView;

class ContactoView extends BaseView
{
    public function cargarHtmlMail($nombres, $email, $mensaje)
    {
        $tmpl = $this->loadTemplate('contacto');

        $tmpl->addSearchReplace('{#NOMBRE#}', $nombres);
        $tmpl->addSearchReplace('{#CORREO#}', $email);
        $tmpl->addSearchReplace('{#MENSAJE#}', $mensaje);

        return $tmpl->getHtml();
    }

    public function cargarHtmlMailTrabajo($nombres, $email, $telefono, $mensaje)
    {
        $tmpl = $this->loadTemplate('trabajo');

        $tmpl->addSearchReplace('{#NOMBRE#}', $nombres);
        $tmpl->addSearchReplace('{#CORREO#}', $email);
        $tmpl->addSearchReplace('{#TELEFONO#}', $telefono);
        $tmpl->addSearchReplace('{#MENSAJE#}', $mensaje);

        return $tmpl->getHtml();
    }
}