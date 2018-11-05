<?php
namespace Dlp\Administrador\Modules\Configuracion\Models;

use ZCode\Lighting\Database\Mysql\MysqlProvider;
use ZCode\Lighting\Model\BaseModel;

class ConfiguracionModel extends BaseModel
{
    /**
     * @param
     * @return mixed|null|object|\stdClass
     */
    public function cargarHeader()
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');


        $query = "SELECT id_menu, nombre FROM menu WHERE eliminado = 0 AND id_padre = 0 AND id_idioma = 1;";

        $database->setQuery($query);
        $header = $database->loadObjectList();

        return $header;
    }

    public  function cargarFooter ()
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');

        $query = "SELECT id_menu_footer, menu, link from menu_footer WHERE id_idioma = 1 ORDER BY orden ASC;";

        $database->setQuery($query);
        $footer = $database->loadObjectList();

        return $footer;
    }

    public  function  cargarDireccion()
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');

        $query = "select id_configuracion, configuracion, valor from configuracion where eliminado = 0 AND id_idioma = 1;";

        $database->setQuery($query);
        $direccion = $database->loadObjectList();

        return $direccion;

    }
    public  function crearTitulo(){
        {
            /** @var MysqlProvider $database */
            $database = $this->getDatabase('administrador');


            $query = "SELECT MAX(orden) AS total 
            FROM menu where id_padre = 0 AND id_idioma = 1 AND eliminado = 0;";

            $database->setQuery($query);
            $menu = $database->loadField('total') + 1;


            $datos = [
                'id_padre' => 0,
                'id_idioma' => 1,
                'eliminado' =>0,
                'orden' => $menu
            ];

            $tipos= 'iiii';

            if (!$database->insertRow('menu', $datos, $tipos)) {
                return false;
            }

            $query = "
            SELECT id_menu, nombre, alias
            FROM menu
            WHERE id_menu = $database->lastId;
        ";

            $database->setQuery($query);
            $titulo = $database->loadObject();

            return $titulo;

        }
    }

    public function guardarTitulo($id_menu, $titulo, $bloque) {
            /** @var MysqlProvider $database */
            $database = $this->getDatabase('administrador');

        var_dump($id_menu);

            $idTabla = 'id_'.$bloque;

            $datos = ['nombre' => $nombre, 'texto1' => $texto1, 'texto2' => $texto2];
            $tipos = 'sss';
            $key   = ['field' => $idTabla, 'value' => $idSlide, 'type' => 'i'];

            if (!$database->updateRow($bloque, $datos, $tipos, $key)) {
                return false;
            }

            return $idSlide;

    }
}