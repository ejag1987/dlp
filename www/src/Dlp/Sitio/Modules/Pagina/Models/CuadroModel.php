<?php

namespace Dlp\Sitio\Modules\Pagina\Models;

use ZCode\Lighting\Database\Mysql\MysqlProvider;
use ZCode\Lighting\Model\BaseModel;

class CuadroModel extends BaseModel
{
    public function cargarCuadro($idModulo)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT id_caluga_texto, imagen, posicion, color, posicion_movil
            FROM caluga_texto
            WHERE id_modulo = $idModulo
              AND eliminado = 0
        ";

        $database->setQuery($query);
        $cuadros['modulo'] = $database->loadObject();

        $query = "
            SELECT id_texto, titulo, texto, orden
            FROM textos
            WHERE id_modulo = $idModulo
              AND eliminado = 0
        ";

        $database->setQuery($query);
        $cuadros['textos'] = $database->loadObjectList();

        return $cuadros;
    }
}