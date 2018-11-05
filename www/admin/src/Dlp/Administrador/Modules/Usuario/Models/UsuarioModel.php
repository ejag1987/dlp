<?php

namespace Dlp\Administrador\Modules\Usuario\Models;

use ZCode\Lighting\Database\Mysql\MysqlProvider;
use ZCode\Lighting\Model\BaseModel;

class UsuarioModel extends BaseModel
{
    public function buscarUsuarios()
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');

        $query = "
            SELECT id_usuario, login, nombre, apellido FROM usuario WHERE eliminado = 0
            ORDER BY nombre ASC, apellido ASC;
        ";

        $database->setQuery($query);
        $usuarios = $database->loadObjectList();

        return $usuarios;
    }
    public function buscarUsuario($idUsuario)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');

        $query = "SELECT id_usuario, login, nombre, apellido, rut, contrasena, fecha_creacion, eliminado
            FROM usuario WHERE id_usuario = $idUsuario;";

        $database->setQuery($query);
        $usuarios = $database->loadObject();

        return $usuarios;
    }

    public function guardarUsuario($idUsuario, $nombre, $apellido, $rut, $login, $pass)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');

        $datos = [
            'login' => $login,
            'nombre' => $nombre,
            'apellido' => $apellido,
            'rut' => $rut,
        ];

        $tipos = 'ssss';

        if ($pass != '') {
            $datos['contrasena'] = $pass;
            $tipos .= 's';
        }

        if ($idUsuario > 0) {
            $key   = [
                'field' => 'id_usuario',
                'value' => $idUsuario,
                'type' => 'i'
            ];

            if (!$database->updateRow('usuario', $datos, $tipos, $key)) {
                return false;
            }

            return $this->buscarUsuario($idUsuario);
        }

        $fecha = date('Y-m-d H:i:s');

        $datos['eliminado']  = 0;
        $datos['fecha_creacion'] = $fecha;

        $tipos .= 'is';

        if (!$database->insertRow('usuario', $datos, $tipos)) {
            return false;
        }

        return $this->buscarUsuario($database->lastId);
    }

    public function buscarUsuarioRegistrado($login)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');

        $query = "
            SELECT id_usuario 
            FROM usuario
            WHERE login = '$login';
        ";

        $database->setQuery($query);
        $usuario = $database->loadField('id_usuario');

        return $usuario;
    }

    public function borrarUsuario($idUsuario)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');

        $datos = ['eliminado' => 1];
        $tipos = 'i';
        $key   = ['field' => 'id_usuario','value' => $idUsuario,'type' => 'i'];

        if (!$database->updateRow('usuario', $datos, $tipos, $key)) {
            return false;
        }

        return $idUsuario;
    }

}