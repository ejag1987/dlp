<?php

namespace Dlp\Sitio\Modules\Menu;

use Dlp\Sitio\Modules\Menu\Models\MenuModel;
use Dlp\Sitio\Modules\Menu\Views\MenuView;
use Dlp\Sitio\System\Variables;
use ZCode\Lighting\Controller\BaseController;

class MenuController extends BaseController
{
    public function run()
    {
        $idioma = $this->request->getUrlVar(0);
        $pagina = $this->request->getUrlVar(2);

        if (!$idioma) {
            $idioma = Variables::DEF_IDIOMA;
        }

        /** @var MenuModel $model */
        $model = $this->createModel('MenuModel');
        $datosMenu = $model->cargarMenu($idioma, $pagina);
        $datosMenuMovil = $model->cargarMenuMovil($idioma, $pagina);
        $relacionIdioma = $model->cargarRealacionIdioma($idioma, $pagina);

        $menu = $this->procesarMenu($datosMenu);
        $menuMovil = $this->procesarMenu($datosMenuMovil);
        $otrosIdiomas = $model->buscarOtrosIdiomas($idioma);

        /** @var MenuView $view */
        $view = $this->createView('MenuView');
        $html = $view->cargarMenu($pagina, $menu, $otrosIdiomas, $menuMovil);

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
                //var_dump($item);
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