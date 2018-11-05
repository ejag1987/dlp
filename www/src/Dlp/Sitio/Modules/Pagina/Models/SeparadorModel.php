<?php

namespace Dlp\Sitio\Modules\Pagina\Models;

use ZCode\Lighting\Database\Mysql\MysqlProvider;
use ZCode\Lighting\Model\BaseModel;

class SeparadorModel extends BaseModel
{
    public function cargarSeparador($idModulo)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT id_separador, imagen, color, nombre
            FROM separador
            WHERE id_modulo = $idModulo AND eliminado = 0;
        ";

        $database->setQuery($query);
        $separador = $database->loadObject();

        return $separador;
    }
}