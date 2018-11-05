<?php

namespace Dlp\Administrador\Modules\Usuario\Views;

use Dlp\Administrador\System\Variables;
use ZCode\Lighting\View\BaseView;

class UsuarioView extends BaseView
{
    public function cargarListado($usuarios)
    {
        $tmpl = $this->loadTemplate('listado');

        $this->addGlobalJs('inputmask');
        $this->addGlobalJs('jquery.inputmask');

        $this->addGlobalCss('select2');
        $this->addGlobalJs('select2.full.min');
        $this->addGlobalJs('es');

        $this->addGlobalCss('jquery-confirm');
        $this->addGlobalJs('jquery-confirm');

        $this->addGlobalJs('validacion');

        $this->addCss('usuarios');
        $this->addJs('usuario');

        $htmlItem = '';
        if($usuarios) {
            foreach ($usuarios as $usuario) {
                $htmlItem .= $this->listadoUsuario($usuario);
            }
        }

        $tmpl->addSearchReplace('{#USUARIOS#}', $htmlItem);

        return $tmpl->getHtml();
    }

    public function listadoUsuario($usuario)
    {
        $tmpl = $this->loadTemplate('usuario_item');

        $tmpl->addSearchReplace('{#ID_USUARIO#}', $usuario->id_usuario);
        $tmpl->addSearchReplace('{#LOGIN#}', $usuario->login);
        $tmpl->addSearchReplace('{#NOMBRE#}', $usuario->nombre);
        $tmpl->addSearchReplace('{#APELLIDO#}', $usuario->apellido);

        return $tmpl->getHtml();
    }

    public function cargarUsuario($usuario)
    {
        $tmpl = $this->loadTemplate('edicion');

        $idUsuario         = 0;
        $accion            = 'Nuevo usuario';
        $nombre            = '';
        $apellido          = '';
        $rut               = '';
        $login              = '';
        $registro          = '';
        $contrasena        = '';

        if ($usuario) {
            $idUsuario = $usuario->id_usuario;
            $accion    = 'Editar usuario';
            $nombre    = $usuario->nombre;
            $apellido  = $usuario->apellido;
            $rut       = $usuario->rut;
            $login      = $usuario->login;
            $contrasena  = $usuario->contrasena;
            $fechaRegistro = date('d-m-Y', strtotime($usuario->fecha_creacion));
            $registro  = "Usuario registrado el $fechaRegistro";

        }


        $tmpl->addSearchReplace('{#ID_USUARIO#}', $idUsuario);
        $tmpl->addSearchReplace('{#ACCION#}', $accion);
        $tmpl->addSearchReplace('{#NOMBRE#}', $nombre);
        $tmpl->addSearchReplace('{#APELLIDO#}', $apellido);
        $tmpl->addSearchReplace('{#RUT#}', $rut);
        $tmpl->addSearchReplace('{#LOGIN#}', $login);
        $tmpl->addSearchReplace('{#REGISTRO#}', $registro);
        $tmpl->addSearchReplace('{#PASS#}', $contrasena);

        return $tmpl->getHtml();
    }

}