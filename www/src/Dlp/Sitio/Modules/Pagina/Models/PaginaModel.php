<?php

namespace Dlp\Sitio\Modules\Pagina\Models;

use ZCode\Lighting\Database\Mysql\MysqlProvider;
use ZCode\Lighting\Model\BaseModel;

class PaginaModel extends BaseModel
{
    public function cargarPagina($idioma, $pagina)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $where = "AND P.alias = '$pagina'";

        if (!$pagina) {
            $where = "AND P.principal = 1";
        }

        $query = "
            SELECT P.id_pagina, P.id_idioma, P.titulo, P.alias, I.codigo
            FROM pagina AS P 
            LEFT OUTER JOIN idioma AS I ON I.id_idioma = P.id_idioma
            WHERE I.codigo = '$idioma' $where;
        ";

        $database->setQuery($query);
        $pagina = $database->loadObject();

        return $pagina;
    }

    public function cargarModulos($id_pagina)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT M.id_modulo, M.id_tipo_modulo, TM.tabla, M.nombre, M.alias, M.color
            FROM modulo AS M
            LEFT OUTER JOIN pagina AS P ON M.id_pagina = P.id_pagina
            LEFT OUTER JOIN tipo_modulo AS TM ON TM.id_tipo_modulo = M.id_tipo_modulo
            WHERE P.id_pagina = $id_pagina
            AND M.eliminado = 0
            ORDER BY orden ASC;
        ";

        $database->setQuery($query);
        $modulos = $database->loadObjectList();

        return $modulos;
    }
}