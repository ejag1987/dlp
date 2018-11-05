<?php
namespace Dlp\Administrador\Modules\Menusitio\Models;

use ZCode\Lighting\Database\Mysql\MysqlProvider;
use ZCode\Lighting\Model\BaseModel;

class MenusitioModel extends BaseModel
{
    /**
     * @param $alias
     * @return mixed|null|object|\stdClass
     */
    public function cargarColor()
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');

        $query ="SELECT id_color, nombre FROM color WHERE eliminado = 0 ";

        $database->setQuery($query);
        $color = $database->loadObjectList();

        return $color;

    }
    public function cargarHeader($alias)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');


        $query = "SELECT m.id_modulo, m.id_pagina, m.alias, h.id_header, h.titulo, h.texto, h.color, h.imagen from modulo as m 
                  INNER JOIN header as h 
                  ON m.id_modulo = h.id_modulo where alias = '$alias' AND h.eliminado = 0;";

        $database->setQuery($query);
        $header = $database->loadObject();

        return $header;
    }

    public function cargarTitulos($alias) {

        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');
        $query = "SELECT id_menu FROM menu WHERE alias = '$alias';";

        $database->setQuery($query);
        $padre = $database->loadField('id_menu');


        if ($padre) {
            $query = "SELECT id_menu, id_idioma, nombre, alias, link, tipo_link, orden FROM menu WHERE id_padre = $padre AND eliminado = 0 ORDER BY orden ASC;";
            $database->setQuery($query);
            $titulo = $database->loadObjectList();

        }

        return $titulo;

    }
    public function CargarTipo()
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');
        $query = "SELECT id_tipo_modulo, nombre FROM tipo_modulo WHERE eliminado = 0";
        $database->setQuery($query);
        $tipo = $database->loadObjectList();

        return $tipo;

    }

    public function cargarTituloCaluga($alias) {

        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');
        $query = "SELECT id_pagina from modulo where alias = '$alias';";

        $database->setQuery($query);
        $padre = $database->loadField('id_pagina');


        if ($padre) {
            $query = "SELECT id_modulo, id_tipo_modulo, id_pagina, nombre, alias, color FROM modulo WHERE id_pagina = $padre AND eliminado = 0 AND id_tipo_modulo !=3 ORDER BY orden ASC;";
            $database->setQuery($query);
            $tituloCaluga = $database->loadObjectList();

        }

        return $tituloCaluga;

    }

    public function CargarTexto($alias)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');
        $query = "SELECT m.id_modulo, t.id_texto, t.titulo, t.texto, t.color as colortexto from modulo as m 
                INNER JOIN textos AS t ON m.id_modulo = t.id_modulo WHERE m.alias = '$alias';";
        $database->setQuery($query);
        $texto = $database->loadObjectList();

        return $texto;
    }
    public function CargarCaluga($alias)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');
        $query = "SELECT m.id_modulo, c.id_caluga, c.titulo1, c.titulo2, c.texto, c.color, c.imagen, c.link from modulo as m 
                INNER JOIN caluga AS c ON m.id_modulo = c.id_modulo WHERE m.alias = '$alias';";
        $database->setQuery($query);
        $caluga = $database->loadObjectList();


        return $caluga;
    }

}