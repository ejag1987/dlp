<?php

namespace Dlp\Sitio\Modules\Pagina\Models;

use ZCode\Lighting\Database\Mysql\MysqlProvider;
use ZCode\Lighting\Model\BaseModel;

class CalugaModel extends BaseModel
{
    public function cargarCalugas($idModulo)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT id_caluga, titulo1, titulo2, imagen, color, texto, posicion, link
            FROM caluga 
            WHERE id_modulo = $idModulo AND eliminado = 0
            ORDER BY orden ASC
        ";

        $database->setQuery($query);
        $calugas = $database->loadObjectList();

        return $calugas;
    }
}