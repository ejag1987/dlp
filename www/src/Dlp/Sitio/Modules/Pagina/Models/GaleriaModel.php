<?php

namespace Dlp\Sitio\Modules\Pagina\Models;

use ZCode\Lighting\Database\Mysql\MysqlProvider;
use ZCode\Lighting\Model\BaseModel;

class GaleriaModel extends BaseModel
{
    public function cargarGalerias($idModulo)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT GS.id_seccion, GS.id_galeria_tipo, GS.titulo AS seccion, GS.color, GS.posicion, G.id_galeria,
              G.id_categoria, G.titulo AS proyecto, G.subtitulo, G.comuna, GC.titulo AS categoria, G.foto_principal, G.alias
            FROM
                galeria_seccion AS GS
            LEFT OUTER JOIN galeria_categoria AS GC ON GC.id_galeria_seccion = GS.id_seccion
            LEFT OUTER JOIN galeria AS G ON G.id_categoria = GC.id_categoria
            WHERE GS.id_modulo = $idModulo 
              AND GS.eliminado = 0
              AND G.destacado = 1;
        ";

        $database->setQuery($query);
        $galerias = $database->loadObject();

        return $galerias;
    }

    public function buscarCategorias($idSeccion)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT id_categoria AS id, titulo, foto, 'categorias' AS alias
            FROM galeria_categoria 
            WHERE id_galeria_seccion = $idSeccion
              AND eliminado = 0
            ORDER BY orden ASC;
        ";

        $database->setQuery($query);
        $categorias = $database->loadObjectList();

        return $categorias;
    }

    public function buscarProyectos($idSeccion)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT G.id_galeria AS id, G.titulo, G.foto_principal AS foto, G.alias
            FROM galeria AS G 
            LEFT OUTER JOIN galeria_categoria AS GC ON G.id_categoria = GC.id_categoria
            WHERE GC.id_galeria_seccion = $idSeccion
              AND G.eliminado = 0 
              AND GC.eliminado = 0
            ORDER BY G.orden ASC
            LIMIT 7;
        ";

        $database->setQuery($query);
        $categorias = $database->loadObjectList();

        return $categorias;
    }

    public function cargarProyectos($idCategoria)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT GS.id_seccion, GS.titulo AS seccion, GS.id_galeria_tipo AS tipo,
              GC.id_categoria, GC.titulo AS categoria
            FROM galeria_categoria AS GC 
            LEFT OUTER JOIN galeria_seccion AS GS ON GC.id_galeria_seccion = GS.id_seccion
            WHERE GC.id_categoria = $idCategoria
              AND GS.eliminado = 0;
        ";

        $database->setQuery($query);
        $seccionCategoria = $database->loadObject();
        $proyectos = [];

        switch ($seccionCategoria->tipo) {
            case 1:
                $query = "
                    SELECT G.id_galeria, G.id_categoria, G.alias, G.titulo, G.foto_principal, G.comuna, G.anio, G.inmobiliaria, G.link
                    FROM galeria AS G 
                    WHERE G.id_categoria IN (
                            SELECT GC.id_categoria
                            FROM galeria_seccion AS GS
                            LEFT OUTER JOIN galeria_categoria AS GC ON GS.id_seccion = GC.id_galeria_seccion
                            WHERE GS.id_seccion = $seccionCategoria->id_seccion AND GC.eliminado = 0
                    )
                    AND G.eliminado = 0
                    ORDER BY G.orden ASC;
                ";

                $database->setQuery($query);
                $proyectos = $database->loadObjectList();

                break;
            case 2:
                $query = "
                    SELECT G.id_galeria, G.id_categoria, G.alias, G.titulo, G.foto_principal, G.comuna, G.anio, G.inmobiliaria, G.link
                    FROM galeria AS G
                    WHERE G.id_categoria = $idCategoria
                    AND G.eliminado = 0
                    ORDER BY G.orden ASC;
                ";

                $database->setQuery($query);
                $proyectos = $database->loadObjectList();

                break;
        }

        foreach ($proyectos as $categoria) {
            $query = "
                SELECT id_foto, id_galeria,titulo, foto
                FROM galeria_foto
                WHERE id_galeria = $categoria->id_galeria
                    AND eliminado = 0
                ORDER BY orden ASC;
            ";

            $database->setQuery($query);
            $categoria->fotos = $database->loadObjectList();
        }

        $datos['seccion'] = $seccionCategoria;
        $datos['proyectos'] = $proyectos;

        return $datos;
    }

    public function cargarProyecto($idProyecto)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT G.id_galeria, G.id_categoria, G.alias, G.titulo, G.foto_principal, G.comuna, G.anio, G.inmobiliaria,
              G.link, GC.titulo AS categoria, G.orden, GS.id_seccion, GS.id_galeria_tipo, GS.titulo AS seccion
            FROM galeria AS G
            LEFT OUTER JOIN galeria_categoria AS GC ON G.id_categoria = GC.id_categoria
            LEFT OUTER JOIN galeria_seccion AS GS ON GC.id_galeria_seccion = GS.id_seccion
            WHERE G.id_galeria = $idProyecto;
        ";

        $database->setQuery($query);
        $proyecto = $database->loadObject();

        $proyectoAnterior = '';

        switch ($proyecto->id_galeria_tipo) {
            case 1:
                $query = "
                    SELECT MAX(G.orden) AS cantidad 
                    FROM galeria AS G 
                    WHERE G.id_categoria IN (
                        SELECT GC.id_categoria
                        FROM galeria_seccion AS GS
                        LEFT OUTER JOIN galeria_categoria AS GC ON GS.id_seccion = GC.id_galeria_seccion
                        WHERE GS.id_seccion = $proyecto->id_seccion
                    );
                ";

                $database->setQuery($query);
                $proyecto->cantidad = $database->loadField('cantidad');

                // anterior
                if ($proyecto->orden > 1) {
                    $proyectoAnterior = " AND orden < $proyecto->orden";
                }

                $query = "
                    SELECT id_galeria
                    FROM galeria
                    WHERE id_categoria IN (
                        SELECT GC.id_categoria
                        FROM galeria_seccion AS GS
                        LEFT OUTER JOIN galeria_categoria AS GC ON GS.id_seccion = GC.id_galeria_seccion
                        WHERE GS.id_seccion = $proyecto->id_seccion
                    )
                    AND eliminado = 0
                    $proyectoAnterior
                    ORDER BY orden DESC
                    LIMIT 1
                ";

                $database->setQuery($query);
                $proyecto->anterior = $database->loadField('id_galeria');

                // siguiente
                $proyectoSiguiente = '';

                if ($proyecto->orden !== $proyecto->cantidad) {
                    $proyectoSiguiente = " AND orden > $proyecto->orden";
                }

                $query = "
                    SELECT id_galeria
                    FROM galeria
                    WHERE id_categoria  IN (
                        SELECT GC.id_categoria
                        FROM galeria_seccion AS GS
                        LEFT OUTER JOIN galeria_categoria AS GC ON GS.id_seccion = GC.id_galeria_seccion
                        WHERE GS.id_seccion = $proyecto->id_seccion)
                    AND eliminado = 0
                    $proyectoSiguiente
                    ORDER BY orden ASC
                    LIMIT 1
                ";

                $database->setQuery($query);
                $proyecto->siguiente = $database->loadField('id_galeria');

                break;
            case 2:
                $query = "
                    SELECT MAX(orden) AS cantidad
                    FROM galeria
                    WHERE id_categoria = $proyecto->id_categoria 
                    AND eliminado = 0;
                ";

                $database->setQuery($query);
                $proyecto->cantidad = $database->loadField('cantidad');

                // anterior
                if ($proyecto->orden > 1) {
                    $proyectoAnterior = " AND orden < $proyecto->orden";
                }

                $query = "
                    SELECT id_galeria
                    FROM galeria
                    WHERE id_categoria = $proyecto->id_categoria 
                    AND eliminado = 0
                    $proyectoAnterior
                    ORDER BY orden DESC
                    LIMIT 1
                ";

                $database->setQuery($query);
                $proyecto->anterior = $database->loadField('id_galeria');

                // siguiente
                $proyectoSiguiente = '';

                if ($proyecto->orden !== $proyecto->cantidad) {
                    $proyectoSiguiente = " AND orden > $proyecto->orden";
                }

                $query = "
                    SELECT id_galeria
                    FROM galeria
                    WHERE id_categoria = $proyecto->id_categoria 
                    AND eliminado = 0
                    $proyectoSiguiente
                    ORDER BY orden ASC
                    LIMIT 1
                ";

                $database->setQuery($query);
                $proyecto->siguiente = $database->loadField('id_galeria');

                break;
        }

        $query = "
            SELECT id_foto, id_galeria,titulo, foto
            FROM galeria_foto
            WHERE id_galeria = $proyecto->id_galeria
              AND eliminado = 0
            ORDER BY orden ASC;
        ";

        $database->setQuery($query);
        $proyecto->fotos = $database->loadObjectList();

        return $proyecto;
    }

    public function proyectosPorSeccion($idSeccion)
    {
        /** @var MysqlProvider $database */
        $database = $this->getDatabase('sitio');

        $query = "
            SELECT GS.id_seccion, GS.titulo AS seccion, GS.id_galeria_tipo AS tipo,
              GC.id_categoria, GC.titulo AS categoria
            FROM galeria_categoria AS GC 
            LEFT OUTER JOIN galeria_seccion AS GS ON GC.id_galeria_seccion = GS.id_seccion
            WHERE GS.id_seccion = $idSeccion
              AND GS.eliminado = 0;
        ";

        $database->setQuery($query);
        $seccionCategoria = $database->loadObject();
        $proyectos = [];

        switch ($seccionCategoria->tipo) {
            case 1:
                $query = "
                    SELECT G.id_galeria, G.id_categoria, G.alias, G.titulo, G.foto_principal, G.comuna, G.anio, G.inmobiliaria, G.link
                    FROM galeria AS G 
                    WHERE G.id_categoria IN (
                            SELECT GC.id_categoria
                            FROM galeria_seccion AS GS
                            LEFT OUTER JOIN galeria_categoria AS GC ON GS.id_seccion = GC.id_galeria_seccion
                            WHERE GS.id_seccion = $seccionCategoria->id_seccion AND GC.eliminado = 0
                    )
                    AND G.eliminado = 0
                    ORDER BY G.orden ASC;
                ";

                $database->setQuery($query);
                $proyectos = $database->loadObjectList();

                break;
            case 2:
                $query = "
                    SELECT G.id_galeria, G.id_categoria, G.alias, G.titulo, G.foto_principal, G.comuna, G.anio, G.inmobiliaria, G.link
                    FROM galeria AS G
                    WHERE G.id_categoria = $idCategoria
                    AND G.eliminado = 0
                    ORDER BY G.orden ASC;
                ";

                $database->setQuery($query);
                $proyectos = $database->loadObjectList();

                break;
        }

        foreach ($proyectos as $categoria) {
            $query = "
                SELECT id_foto, id_galeria,titulo, foto
                FROM galeria_foto
                WHERE id_galeria = $categoria->id_galeria
                    AND eliminado = 0
                ORDER BY orden ASC;
            ";

            $database->setQuery($query);
            $categoria->fotos = $database->loadObjectList();
        }

        $datos['seccion'] = $seccionCategoria;
        $datos['proyectos'] = $proyectos;

        return $datos;
    }
}