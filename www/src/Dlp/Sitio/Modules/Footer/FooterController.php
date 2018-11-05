<?php

namespace Dlp\Sitio\Modules\Footer;

use Dlp\Sitio\Modules\Footer\Models\FooterModel;
use Dlp\Sitio\Modules\Footer\Views\FooterView;
use Dlp\Sitio\System\Variables;
use ZCode\Lighting\Controller\BaseController;

class FooterController extends BaseController
{
    public function run()
    {
        $idioma = $this->request->getUrlVar(0);
        if (!$idioma) {
            $idioma = Variables::DEF_IDIOMA;
        }

        /** @var FooterModel $model */
        $model = $this->createModel('FooterModel');
        $datosMenu = $model->cargarMenu($idioma);
        $menu = $this->procesarMenu($datosMenu);

        $anexo = $model->cargarAnexosMenus($idioma);
        $info = $model->cargarInfo($idioma);

        /** @var FooterView $view */
        $view = $this->createView('FooterView');
        $html = $view->cargarFooter($menu, $anexo, $info);

        $this->response = $html;
    }

    public function runAjax()
    {
        // Implement runAjax() method.
    }

    private function procesarMenu($datos, $idPadre = 0)
    {
        $menu = [];

        if ($datos) {
            foreach ($datos as $item) {
                if (intval($item->id_padre) === $idPadre) {
                    $idMenu = intval($item->id_menu);
                    $menu[$idMenu] = $item;

                    $hijos = $this->procesarMenu($datos, $idMenu);

                    if ($hijos) {
                        $menu[$idMenu]->submenu = $hijos;
                    }
                }
            }
        }


        return $menu;
    }
}