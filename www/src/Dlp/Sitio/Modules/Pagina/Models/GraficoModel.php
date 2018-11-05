<?php

namespace Dlp\Sitio\Modules\Pagina\Models;

use ZCode\Lighting\Database\Mysql\MysqlProvider;
use ZCode\Lighting\Model\BaseModel;

class GraficoModel extends BaseModel
{
    public function cargarGraficos($idModulo)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
           SELECT id_grafico, titulo, color, leyenda
           FROM grafico
           WHERE id_modulo = $idModulo
           AND eliminado = 0;
        ";

        $database->setQuery($query);
        $grafico = $database->loadObjectList();

        return $grafico;
    }

    public function cargarDatos($idGrafico)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT label, dato as value
            FROM grafico_item
            WHERE id_grafico = $idGrafico
            AND eliminado = 0;
        ";

        $database->setQuery($query);
        $datos = $database->loadObjectList();

        return $datos;
    }
}