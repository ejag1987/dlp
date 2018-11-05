<?php

namespace Dlp\Sitio\Modules\Pagina\Models;

use ZCode\Lighting\Database\Mysql\MysqlProvider;
use ZCode\Lighting\Model\BaseModel;

class SlideModel extends BaseModel
{
    public function cargarSlides($idModulo)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT id_slide, nombre, imagen, texto1, texto2, logo, imagen_movil
            FROM slide
            WHERE id_modulo = $idModulo AND eliminado = 0
            ORDER BY orden ASC;
        ";

        $database->setQuery($query);
        $slides = $database->loadObjectList();

        return $slides;

    }
}