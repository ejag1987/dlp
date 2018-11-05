<?php

namespace Dlp\Sitio\Modules\Pagina\Models;

use ZCode\Lighting\Database\Mysql\MysqlProvider;
use ZCode\Lighting\Model\BaseModel;

class HeaderModel extends BaseModel
{
    public function cargarHeader($idModulo)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT id_header, imagen, titulo, texto, color
            FROM header
            WHERE id_modulo = $idModulo AND eliminado = 0
            ORDER BY orden ASC;
        ";

        $database->setQuery($query);
        $header = $database->loadObject();

        return $header;
    }
}