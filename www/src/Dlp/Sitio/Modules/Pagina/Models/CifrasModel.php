<?php

namespace Dlp\Sitio\Modules\Pagina\Models;

use ZCode\Lighting\Database\Mysql\MysqlProvider;
use ZCode\Lighting\Model\BaseModel;

class CifrasModel extends BaseModel
{
    public function cargarItems($idModulo)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT id_cifras, titulo, texto_chico, texto_grande, texto_medio, color
            FROM cifras 
            WHERE id_modulo = $idModulo AND eliminado = 0
            ORDER BY orden ASC;
        ";

        $database->setQuery($query);
        $items = $database->loadObjectList();

        return $items;
    }
}