<?php

namespace Dlp\Sitio\Modules\Pagina\Models;

use ZCode\Lighting\Database\Mysql\MysqlProvider;
use ZCode\Lighting\Model\BaseModel;

class LateralminiModel extends BaseModel
{
    public function cargarModulo($idModulo)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT id_texto, titulo, texto, color, orden
            FROM textos 
            WHERE id_modulo = $idModulo AND eliminado = 0
            ORDER BY orden ASC;
        ";

        $database->setQuery($query);
        $datos['textos'] = $database->loadObjectList();

        $query = "
            SELECT id_caluga, titulo1, titulo2, texto, imagen, color, orden
            FROM caluga 
            WHERE id_modulo = $idModulo AND eliminado = 0
            ORDER BY orden ASC;
        ";

        $database->setQuery($query);
        $datos['calugas'] = $database->loadObjectList();

        return $datos;
    }
}