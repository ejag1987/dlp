<?php

namespace Dlp\Sitio\Modules\Contacto;

use Dlp\Sitio\Modules\Contacto\Views\ContactoView;
use ZCode\Lighting\Controller\BaseController;
use ZCode\Lighting\Http\Request;

class ContactoController extends BaseController
{
    public function run()
    {
        // TODO: Implement run() method.
    }

    public function runAjax()
    {
        $accion = $this->request->getPostVar('accion', Request::STRING);

        if ($accion !== null && strlen($accion) > 0) {
            switch ($accion) {
                case 'enviarFormContacto':
                    $this->formularioContacto();
                    break;
                case 'enviarFormTrabajo':
                    $this->formularioTrabajo();
                    break;
            }
        }
    }

    private function formularioContacto()
    {
        $nombre = $this->request->getPostVar('nombre', Request::STRING);
        $correo = $this->request->getPostVar('correo', Request::STRING);
        $mensaje = $this->request->getPostVar('mensaje', Request::STRING);
        $token = $this->request->getPostVar('token', Request::STRING);

        if (strlen($nombre) === 0) {
            $this->generateJsonResponse(false, 'Debes ingresar tu nombre y apellidos.');
            return;
        }

        if (strlen($correo) === 0) {
            $this->generateJsonResponse(false, 'Debes ingresar tu correo.');
            return;
        }

        if (strlen($mensaje) === 0) {
            $this->generateJsonResponse(false, 'Debes ingresar el mensaje.');
            return;
        }

        if (strlen($token) === 0) {
            $this->generateJsonResponse(false, 'Hubo un problema al enviar el formulario.');
            return;
        }

        // validar captcha
        $post_data = http_build_query(
            array(
                'secret' => '6Lf1XGYUAAAAAKyoh0sFinATLpeqYQkjvb51Wrlm',
                'response' => $token
            )
        );

        $opts = array('http' =>
            array(
                'method'  => 'POST',
                'header'  => 'Content-type: application/x-www-form-urlencoded',
                'content' => $post_data
            )
        );

        $context  = stream_context_create($opts);
        $response = file_get_contents('https://www.google.com/recaptcha/api/siteverify', false, $context);
        $result = json_decode($response);

        if (!$result->success) {
            $this->generateJsonResponse(false, 'Hubo un problema al enviar el formulario.');
            return;
        }

        $subject = 'Formulario de contacto';
        $to = 'ppineiro@dlp.cl';

        /** @var ContactoView $view */
        $view = $this->createView('ContactoView');
        $html = $view->cargarHtmlMail($nombre, $correo, $mensaje);

        $headers = "MIME-Version: 1.0" . "\r\n";
        $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";

        $headers .= 'From: <contacto@dlp.cl>' . "\r\n";

        mail($to, $subject, $html, $headers);

        $this->generateJsonResponse(true, 'Formulario enviado con éxito.');
    }

    private function formularioTrabajo()
    {
        $nombre = $this->request->getPostVar('nombre', Request::STRING);
        $telefono = $this->request->getPostVar('telefono', Request::STRING);
        $correo = $this->request->getPostVar('correo', Request::STRING);
        $mensaje = $this->request->getPostVar('mensaje', Request::STRING);

        if (strlen($nombre) === 0) {
            $this->generateJsonResponse(false, 'Debes ingresar tu nombre y apellidos.');
            return;
        }

        if (strlen($telefono) === 0) {
            $this->generateJsonResponse(false, 'Debes ingresar tu teléfono.');
            return;
        }

        if (strlen($correo) === 0) {
            $this->generateJsonResponse(false, 'Debes ingresar tu correo.');
            return;
        }

        if (strlen($mensaje) === 0) {
            $this->generateJsonResponse(false, 'Debes ingresar el mensaje.');
            return;
        }

        $subject = 'Formulario de trabajo';
        $to = 'capitalhumano@dlp.cl';

        /** @var ContactoView $view */
        $view = $this->createView('ContactoView');
        $html = $view->cargarHtmlMailTrabajo($nombre, $correo, $telefono, $mensaje);

        $headers = "MIME-Version: 1.0" . "\r\n";
        $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";

        $headers .= 'From: <contacto@dlp.cl>' . "\r\n";

        mail($to, $subject, $html, $headers);

        $this->generateJsonResponse(true, 'Formulario enviado con éxito.');
    }
}
