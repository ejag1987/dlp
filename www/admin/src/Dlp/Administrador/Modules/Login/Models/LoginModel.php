<?php

namespace Dlp\Administrador\Modules\Login\Models;

use ZCode\Lighting\Database\Mysql\MysqlProvider;
use ZCode\Lighting\Model\BaseModel;

class LoginModel extends BaseModel
{
    /**
     * @param $usuario
     * @return mixed|null|object|\stdClass
     */
    public function obtenerUsuario($usuario)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');

        $query = "
            SELECT id_usuario, login, contrasena, nombre, apellido
            FROM usuario 
            WHERE login = '$usuario' AND eliminado = 0;
        ";

        //echo $query;
        $database->setQuery($query);
        $usuario = $database->loadObject();

        return $usuario;
    }
}