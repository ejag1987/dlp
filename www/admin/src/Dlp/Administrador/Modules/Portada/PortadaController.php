<?php
namespace Dlp\Administrador\Modules\Portada;

use Dlp\Administrador\Modules\Portada\Views\PortadaView;
use Dlp\Administrador\Modules\Portada\Models\PortadaModel;
use Dlp\Administrador\System\ProcesadorArchivo;
use Dlp\Administrador\System\Variables;
use ZCode\Lighting\Controller\BaseController;
use ZCode\Lighting\Http\Request;

class PortadaController extends BaseController {

    public function run ()
    {

        /** @var PortadaModel $model */
        $model = $this->createModel('PortadaModel');
        $caluga   = $model->cargarCaluga();
        $slide = $model->cargarSlide();


        /** @var PortadaView $view */
        $view = $this->createView('PortadaView');
        $html = $view->cargarPortada($caluga, $slide);

        $this->response = $html;
    }
    public function runAjax()
    {
        $accion = $this->request->getPostVar('accion', Request::STRING);

        if (strlen($accion) > 0) {
            switch ($accion) {
                case 'nuevoSlide':
                    $this->nuevoSlide();
                    break;
                case 'nuevaCaluga':
                    $this->nuevaCaluga();
                    break;
                case 'subirImagen':
                    $this->subirImagen();
                    break;
                case 'guardarDatos':
                    $this->guardarDatos();
                    break;
                case 'guardarDatoSlide':
                    $this->guardarDatoSlide();
                    break;
                case 'borrarImagen':
                    $this->borrarImagen();
                    break;
                case 'borrarSlideCaluga':
                    $this->borrarSlideCaluga();
                    break;
                case 'guardarOrden':
                    $this->guardarOrden();
                    break;
            }
        }
    }

    private function nuevoSlide()
    {
        /** @var PortadaModel $model */
        $model = $this->createModel('PortadaModel');
        $slide = $model->crearSlide();


        /** @var PortadaView $view */
        $view = $this->createView('PortadaView');
        $html = $view->htmlNuevoSlide($slide);

        $datos['html']  = $html;
        $datos['idSlide'] = $slide->id_slide;
        $this->generateJsonResponse(true, '', $datos);
    }
    private function nuevaCaluga()
    {

        /** @var PortadaModel $model */
        $model = $this->createModel('PortadaModel');
        $caluga = $model->crearCaluga();

        /** @var PortadaView $view */
        $view = $this->createView('PortadaView');
        $html = $view->htmlNuevaCaluga($caluga);

        $datos['html']  = $html;
        $datos['idCaluga'] = $caluga->id_caluga;
        $this->generateJsonResponse(true, '', $datos);
    }
    private  function  subirImagen()
        {
            $id      = $this->request->getPostVar('id', Request::INTEGER);
            $bloque  = $this->request->getPostVar('bloque', Request::STRING);

            /** @var PortadaModel $model */
            $model = $this->createModel('PortadaModel');
            $dir     = Variables::DIR_UPLOAD.'/uploads/'.$bloque;

            $archivo = ProcesadorArchivo::guardarArchivo('files-'.$id, $dir, true, false);
            $nombreArchivo = $archivo->nombre.'.'.$archivo->extension;

            $guardar = $model->guardarImagen($id, $bloque, $nombreArchivo);

            if (!$guardar) {
                $archivoBorrar = $dir.'/'.$archivo->nombre.'.'.$archivo->extension;
                if (is_file($archivoBorrar)) {
                    unlink($archivoBorrar);
                }

                $this->generateJsonResponse(false, 'No se ha podido guardar la imagen.');
                return;
            }

            $imagen = Variables::URL.'uploads/'.$bloque.'/'.$guardar->imagen;

            /** @var PortadaView $view */
            $view = $this->createView('PortadaView');
            $html = $view->htmlImagen($imagen, $id);

            $datos['html']   = $html;
            $datos['bloque'] = $bloque;
            $datos['id']     = $id;


           $this->generateJsonResponse(true, '', $datos);
        }

    private function guardarDatos()
    {
        $id_caluga  = $this->request->getPostVar('id_caluga', Request::INTEGER);
        $titulo1 = $this->request->getPostVar('titulo1-'.$id_caluga, Request::STRING);
        $titulo2 = $this->request->getPostVar('titulo2-'.$id_caluga, Request::STRING);
        $link   = $this->request->getPostVar('link-'.$id_caluga, Request::STRING);
        $texto   = $this->request->getPostVar('texto-'.$id_caluga, Request::STRING);
        $bloque = $this->request->getPostVar('databloque', Request::STRING);


        /** @var PortadaModel $model */
        $model = $this->createModel('PortadaModel');
        $guardar = $model->guardar($id_caluga, $titulo1, $titulo2, $link, $texto, $bloque);


        if (!$guardar) {
            $this->generateJsonResponse(false, 'No se ha podido actualizar.');
            return;
        }

        $this->generateJsonResponse(true, 'Listo!! guardado.');
    }

    private function guardarDatoSlide()
    {
        $id_slide  = $this->request->getPostVar('id_slide', Request::INTEGER);
        $nombre   = $this->request->getPostVar('nombre-'.$id_slide, Request::STRING);
        $texto1  = $this->request->getPostVar('texto1-'.$id_slide, Request::STRING);
        $texto2   = $this->request->getPostVar('texto2-'.$id_slide, Request::STRING);
        $bloque = $this->request->getPostVar('databloque', Request::STRING);

        /** @var PortadaModel $model */
        $model = $this->createModel('PortadaModel');
        $guardar = $model->guardarSlide($id_slide, $nombre, $texto1, $texto2, $bloque);

        if (!$guardar) {
            $this->generateJsonResponse(false, 'No se ha podido actualizar.');
            return;
        }

        $this->generateJsonResponse(true, 'Listo!! guardado.');
    }

    private function borrarImagen()
    {
        $id      = $this->request->getPostVar('id', Request::INTEGER);
        $bloque  = $this->request->getPostVar('bloque', Request::STRING);

        /** @var PortadaModel $model */
        $model = $this->createModel('PortadaModel');
        $borrar = $model->borrarImagen($id, $bloque);

        if (!$borrar) {
            $this->generateJsonResponse(false, 'No se ha podido borrar la imagen.');
            return;
        }

        $dir  = Variables::DIR_UPLOAD.'/uploads/'.$bloque;

        $archivoBorrar = $dir.'/'.$borrar->imagen;
        if (is_file($archivoBorrar)) {
            unlink($archivoBorrar);
        }

        /** @var PortadaView $view */
        $view = $this->createView('PortadaView');
        $html = $view->htmlSubirImagen($id, $bloque);

        $datos['html'] = $html;
        $datos['id'] = $id;

        $this->generateJsonResponse(true, '', $datos);
    }

    private function borrarSlideCaluga()
    {
        $id     = $this->request->getPostVar('id', Request::INTEGER);
        $bloque = $this->request->getPostVar('bloque', Request::STRING);

        /** @var PortadaModel $model */
        $model = $this->createModel('PortadaModel');
        $borrar = $model->cambiarEstado($id, $bloque);

        if (!$borrar) {
            $this->generateJsonResponse(false, 'No se ha podido borrar.');
            return;
        }

        $this->generateJsonResponse(true, 'Listo!!! borrado.');

    }

    private function guardarOrden()
    {
        $caja  = $this->request->getPostVar('caja', Request::ARRAY_VAR);
        $grupo = $this->request->getPostVar('grupo', Request::STRING);


        if (!$caja) {
            $this->generateJsonResponse(false, 'Hubo un error en el sistema, no se recibieron los datos.');
            return;
        }

        $totalCajas = sizeof($caja);
        $error      = false;

        /** @var PortadaModel $model */
        $model = $this->createModel('PortadaModel');

        for ($i = 0; $i < $totalCajas; $i++) {
            $idCaja = intval(str_replace(($grupo.'-'), '', $caja[$i]));

            if (!$model->actualizarOrden($idCaja, ($i + 1), $grupo)) {
                $error = true;
                break;
            }
        }

        if ($error) {
            $this->generateJsonResponse(false, 'Hubo un error al guardar el orden.');
            return;
        }

        $this->generateJsonResponse(true, 'Listo!! se guardo el orden.');
    }


}