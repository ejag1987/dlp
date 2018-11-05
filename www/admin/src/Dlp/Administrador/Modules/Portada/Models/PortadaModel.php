<?php
namespace  Dlp\Administrador\Modules\Portada\Models;


use ZCode\Lighting\Database\Mysql\MysqlProvider;
use ZCode\Lighting\Model\BaseModel;

class PortadaModel extends BaseModel
{
    public function cargarCaluga()
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');


        $query = "SELECT id_caluga, titulo1, titulo2, texto, imagen, link, color FROM caluga WHERE id_modulo = 2 AND eliminado = 0 ORDER BY orden ASC;";

        $database->setQuery($query);
        $caluga = $database->loadObjectList();


        return $caluga;
    }

    public function  cargarSlide()
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');

        $query = "SELECT id_slide, nombre, imagen, texto1, texto2 FROM slide WHERE eliminado = 0 ORDER BY orden ASC;";

        $database->setQuery($query);
        $slider = $database->loadObjectList();

        return $slider;
    }

    public function crearSlide()
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');

        $query ="SELECT MAX(orden) AS total 
            FROM slide 
            WHERE eliminado = 0;";

        $database->setQuery($query);
        $indice = $database->loadField('total') + 1;

        $datos = [
            'id_modulo' => 1,
            'eliminado' => 0,
            'orden' => $indice,
            'logo' => 'DLP-logo.svg'
        ];


        $tipos = 'iiis';

        if (!$database->insertRow('slide', $datos, $tipos)) {
            return false;

        }

        $query = "
            SELECT id_slide, id_modulo, nombre, imagen, texto1, texto2, orden
            FROM slide
            WHERE id_slide = $database->lastId;
        ";

        $database->setQuery($query);
        $slide = $database->loadObject();


        return $slide;

    }

    public function crearCaluga()
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');

        $query = "SELECT MAX(orden) AS total FROM caluga WHERE eliminado = 0 AND id_modulo = 2;";

        $database->setQuery($query);
        $indice = $database->loadField('total') + 1;

        $j = $indice % 3;
        if ($j == 1){
            $color = 'fondo-verde';
        }
        elseif ($j == 2) {
            $color = 'fondo-darkgrey';
        }
        else {
            $color = 'fondo-rojo';
        }


        $datos = [
            'id_modulo' => 2,
            'eliminado' => 0,
            'orden' => $indice,
            'color' =>$color

        ];

        $tipos = 'iiis';

        if (!$database->insertRow('caluga', $datos, $tipos)) {
            return false;
        }

        $query = "
            SELECT id_caluga, imagen, titulo1, titulo2, texto, color, link
            FROM caluga
            WHERE id_caluga = $database->lastId;
        ";

        $database->setQuery($query);
        $caluga = $database->loadObject();

        return $caluga;
    }

    public function guardarImagen ($id, $bloque, $nombreArchivo)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');

        $idTabla = 'id_'.$bloque;
        $datos = ['imagen'=> $nombreArchivo];
        $tipos = 's';
        $key = ['field' => $idTabla, 'value' => $id, 'type' => 'i'];

        if (!$database->updateRow($bloque, $datos, $tipos, $key)) {
            return false;
        }

        $query = "
            SELECT $idTabla, id_modulo, imagen, orden
            FROM $bloque
            WHERE $idTabla = $id;
        ";

        $database->setQuery($query);
        $reponse = $database->loadObject();

        return $reponse;

    }
    public function guardar($id_caluga, $titulo1, $titulo2, $link, $texto, $bloque)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');

        $idTabla = 'id_'.$bloque;



        $datos = ['titulo1' => $titulo1, 'titulo2' => $titulo2, 'texto' =>$texto, 'link' => $link];
        $tipos = 'ssss';
        $key   = ['field' => $idTabla, 'value' => $id_caluga, 'type' => 'i'];


        if (!$database->updateRow($bloque, $datos, $tipos, $key)) {
            return false;
        }

        return $id_caluga;
    }
    public function guardarSlide($idSlide, $nombre, $texto1, $texto2, $bloque)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');

        $idTabla = 'id_'.$bloque;

        $datos = ['nombre' => $nombre, 'texto1' => $texto1, 'texto2' => $texto2];
        $tipos = 'sss';
        $key   = ['field' => $idTabla, 'value' => $idSlide, 'type' => 'i'];

        if (!$database->updateRow($bloque, $datos, $tipos, $key)) {
            return false;
        }

        return $idSlide;
    }

    public  function borrarImagen($id, $bloque)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');

        $idTabla = 'id_'.$bloque;

        $query = "
            SELECT $idTabla, imagen, orden
            FROM $bloque
            WHERE $idTabla = $id;
        ";

        $database->setQuery($query);
        $imagen = $database->loadObject();

        $datos = ['imagen' => null];
        $tipos = 's';
        $key   = ['field' => $idTabla, 'value' => $id, 'type' => 'i'];

        if (!$database->updateRow($bloque, $datos, $tipos, $key)) {
            return false;
        }

        return $imagen;
    }
    public function cambiarEstado($id, $bloque)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');

        $idTabla = 'id_'.$bloque;

        $datos = ['eliminado' => 1];
        $tipos = 'i';
        $key   = ['field' => $idTabla, 'value' => $id, 'type' => 'i'];

        if (!$database->updateRow($bloque, $datos, $tipos, $key)) {
            return false;
        }

        return $id;
    }

    public function actualizarOrden($idCaja, $orden, $bloque)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('administrador');

        $idTabla = 'id_'.$bloque;

        $datos = [
            'orden' => $orden
        ];

        $tipos = 'i';

        $key = ['field' => $idTabla, 'value' => $idCaja, 'type' => 'i'];

        if (!$database->updateRow($bloque, $datos, $tipos, $key)) {
            return false;
        }

        return $idCaja;
    }

}