<?php

namespace Dlp\Administrador\Modules\Usuario;

use Dlp\Administrador\Modules\Usuario\Models\UsuarioModel;
use Dlp\Administrador\Modules\Usuario\Views\UsuarioView;
use ZCode\Lighting\Controller\BaseController;
use ZCode\Lighting\Http\Request;


class UsuarioController extends BaseController
{
    public function run()
    {
        $html     = '';

        /** @var UsuarioModel $model */
        $model = $this->createModel('UsuarioModel');
        $usuarios = $model->buscarUsuarios();


        /** @var UsuarioView $view */
        $view = $this->createView('UsuarioView');
        $html = $view->cargarListado($usuarios);

        $this->response = $html;
    }

    public function runAjax()
    {
        $accion = $this->request->getPostVar('accion', Request::STRING);

        if (strlen($accion) > 0) {
            switch ($accion) {
                case 'editarUsuario':
                    $this->editarUsuario();
                    break;
                case 'guardarDatos':
                    $this->guardarDatos();
                    break;
                case 'borrarUsuario':
                    $this->borrarUsuario();
                    break;
            }
        }
    }

    private function editarUsuario()
    {
        $idUsuario = $this->request->getPostVar('idUsuario', Request::INTEGER);

        /** @var UsuarioModel $model */
        $model = $this->createModel('UsuarioModel');
        $usuario = $model->buscarUsuario($idUsuario);

        /** @var UsuarioView $view */
        $view = $this->createView('UsuarioView');
        $html = $view->cargarUsuario($usuario);

        $datos['html']  = $html;

        $this->generateJsonResponse(true, '', $datos);
    }

    private function guardarDatos()
    {
        $idUsuario  = $this->request->getPostVar('idUsuario', Request::INTEGER);
        $nombre     = $this->request->getPostVar('nombre', Request::STRING);
        $apellido   = $this->request->getPostVar('apellido', Request::STRING);
        $rut        = $this->request->getPostVar('rut', Request::STRING);
        $login       = $this->request->getPostVar('login', Request::STRING);
        $contrasena = $this->request->getPostVar('contrasena', Request::STRING);

        /** @var UsuarioModel $model */
        $model = $this->createModel('UsuarioModel');

        // validar usuarios
        if (strlen(trim($nombre)) == 0 && strlen(trim($apellido)) == 0 && strlen(trim($login)) == 0 ) {
            $this->generateJsonResponse(false, 'Existen campos no validos y/o vacíos.');
            return;
        }

        $usuarioBD = $model->buscarUsuarioRegistrado($login);

        if ($idUsuario == 0) {
            if ($usuarioBD) {
                $this->generateJsonResponse(false, 'El usuario ya está registrado.');
                return;
            }

            if ($idUsuario == 0) {
                if ($contrasena == '') {
                    $this->generateJsonResponse(false, 'Debe registrar una contraseña para el usuario.');
                    return;
                }
            }
        }

        $pass = '';

        if ($contrasena != '') {
            $pass = password_hash($contrasena, PASSWORD_BCRYPT);
        }

        $usuario = $model->guardarUsuario($idUsuario, $nombre, $apellido, $rut, $login, $pass);
        if (!$usuario) {
            $this->generateJsonResponse(false, 'No se ha podido guardar el usuario.');
            return;
        }

        /** @var UsuarioView $view */
        $view = $this->createView('UsuarioView');
        $html = $view->listadoUsuario($usuario);

        $datos['html'] = $html;
        $datos['idUsuario'] = $usuario->id_usuario;

        $this->generateJsonResponse(true, 'Usuario guardado.', $datos);
    }

    private function borrarUsuario()
    {
        $idUsuario = $this->request->getPostVar('idUsuario', Request::INTEGER);

        if (!($idUsuario > 0)) {
            $this->generateJsonResponse(false, 'No se ha podido borrar el usuario.');
            return;
        }

        /** @var UsuarioModel $model */
        $model = $this->createModel('UsuarioModel');
        $usuario = $model->borrarUsuario($idUsuario);

        if (!$usuario) {
            $this->generateJsonResponse(false, 'No se ha podido borrar el usuario.');
            return;
        }

        $datos['idUsuario'] = $idUsuario;

        $this->generateJsonResponse(true, 'Usuario borrado.', $datos);
    }

}