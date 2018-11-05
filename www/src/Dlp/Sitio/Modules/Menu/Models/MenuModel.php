<?php

namespace Dlp\Sitio\Modules\Menu\Models;

use ZCode\Lighting\Database\Mysql\MysqlProvider;
use ZCode\Lighting\Model\BaseModel;

class MenuModel extends BaseModel
{
    public function cargarMenu($idioma, $pagina)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT M.id_menu, M.id_padre, M.id_idioma, M.nombre, M.alias, M.link, M.tipo_link, I.codigo
            FROM menu AS M
            LEFT OUTER JOIN idioma AS I ON I.id_idioma = M.id_idioma
            WHERE M.eliminado = 0 AND (M.id_padre = 0 OR M.id_padre IS NULL OR M.id_padre = (SELECT id_menu FROM menu WHERE alias = '$pagina')) AND I.codigo = '$idioma'
            ORDER BY M.id_padre ASC, M.orden ASC;
        ";

        $database->setQuery($query);
        $menu = $database->loadObjectList();

        return $menu;
    }

    public function buscarOtrosIdiomas($idioma)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT I.id_idioma, I.sigla, I.idioma, I.codigo, I.imagen
            FROM idioma AS I
            LEFT OUTER JOIN menu AS M ON M.id_idioma = I.id_idioma
            WHERE I.sigla NOT IN ('$idioma')
              AND M.id_idioma IS NOT NULL
              AND M.eliminado = 0
            GROUP BY I.id_idioma;
        ";

        $database->setQuery($query);
        $idiomas = $database->loadObjectList();

        return $idiomas;
    }

    public function buscarSubmenu($alias)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT id_menu, nombre, alias, tipo_link
            FROM menu
            WHERE id_padre = (SELECT id_menu FROM menu WHERE alias = '$alias') AND eliminado = 0
            ORDER BY orden ASC;

        ";

        $database->setQuery($query);
        $submenu = $database->loadObjectList();

        return $submenu;
    }

    public function cargarMenuMovil($idioma, $pagina)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT M.id_menu, M.id_padre, M.id_idioma, M.nombre, M.alias, M.link, M.tipo_link, I.codigo,
	          (SELECT U.alias FROM menu AS U WHERE U.id_menu = M.id_padre) AS alias_padre
            FROM menu AS M
            LEFT OUTER JOIN idioma AS I ON I.id_idioma = M.id_idioma
            WHERE M.eliminado = 0 AND I.codigo = '$idioma'
            ORDER BY M.id_padre ASC, M.orden ASC;
        ";

        $database->setQuery($query);
        $menu = $database->loadObjectList();

        return $menu;
    }

    public function cargarRealacionIdioma($idioma, $pagina)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT M.*
            FROM menu AS M
            LEFT OUTER JOIN idioma AS I
            WHERE M.relacion = (SELECT relacion FROM menu AS M WHERE M.alias = '$pagina') 
              AND M.eliminado = 0 
              AND M.id_idioma != '$idioma';
        ";

        //echo $query;
        $database->setQuery($query);
        $relacion = $database->loadObjectList();

        return $relacion;
    }
}