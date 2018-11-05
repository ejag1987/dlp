<?php

namespace Dlp\Sitio\Modules\Pagina\Models;

use ZCode\Lighting\Database\Mysql\MysqlProvider;
use ZCode\Lighting\Model\BaseModel;

class ValoresModel extends BaseModel
{
    public function cargarModulo($idModulo)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT id_valores, icono, titulo, texto, orden
            FROM valores
            WHERE id_modulo = $idModulo 
              AND eliminado = 0
            ORDER BY orden ASC;
        ";

        $database->setQuery($query);
        $valores = $database->loadObjectList();

        return $valores;
    }
}