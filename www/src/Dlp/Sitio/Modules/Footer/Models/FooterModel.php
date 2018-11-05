<?php

namespace Dlp\Sitio\Modules\Footer\Models;

use ZCode\Lighting\Database\Mysql\MysqlProvider;
use ZCode\Lighting\Model\BaseModel;

class FooterModel extends BaseModel
{
    public function cargarMenu($idioma)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT M.id_menu, M.id_padre, M.id_idioma, M.nombre, M.alias, M.link, M.tipo_link, I.codigo
            FROM menu AS M
            LEFT OUTER JOIN idioma AS I ON I.id_idioma = M.id_idioma
            WHERE M.eliminado = 0 AND I.codigo = '$idioma'
            ORDER BY M.id_padre ASC, M.orden ASC;
        ";

        $database->setQuery($query);
        $menu = $database->loadObjectList();

        return $menu;
    }

    public function cargarAnexosMenus($idioma)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT M.id_menu_footer, M.menu, M.link, M.tipo_link, M.icono, I.codigo
            FROM menu_footer AS M
            LEFT OUTER JOIN idioma AS I ON M.id_idioma = I.id_idioma
            WHERE I.codigo = '$idioma'
            ORDER BY M.orden ASC;
        ";

        $database->setQuery($query);
        $menu = $database->loadObjectList();

        return $menu;
    }

    public function cargarInfo($idioma)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT C.configuracion, C.valor
            FROM configuracion AS C
            LEFT OUTER JOIN idioma AS I ON C.id_idioma = I.id_idioma
            WHERE C.eliminado = 0 AND I.codigo = '$idioma'; 
        ";

        $database->setQuery($query);
        $menu = $database->loadObjectList();

        return $menu;
    }
}