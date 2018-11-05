<?php

namespace Dlp\Administrador\Modules\Menu\Models;

use ZCode\Lighting\Database\Mysql\MysqlProvider;
use ZCode\Lighting\Model\BaseModel;

class MenuModel extends BaseModel
{

    public function CargarMenu()
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');

        $query = "SELECT id_menu, id_idioma, nombre, alias FROM menu WHERE id_padre = 0 AND eliminado = 0 and id_idioma = 1 ORDER BY orden ASC;";

        $database->setQuery($query);
        $menu = $database->loadObjectList();

        return $menu;
    }

    public function  CargarUsuarios ()
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');
        $query= "SELECT id_usuario, email, nombre, apellido FROM usuario WHERE eliminado = 0 ORDER BY nombre ASC;";

        $database->setQuery($query);
        $usuario = $database->loadObjectList();

        return $usuario;
    }
}