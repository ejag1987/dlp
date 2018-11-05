<?php

namespace Dlp\Sitio\Modules\Menu\Views;

use ZCode\Lighting\View\BaseView;

class MenuView extends BaseView
{
    public function cargarMenu($pagina, $menu, $otrosIdiomas, $menuMovil)
    {
        $tmpl = $this->loadTemplate('menu');

        $this->addCss('menu');
        $this->addJs('menu');

        $clase = 'home sin-logo';

        if ($pagina) {
            $clase = '';
        }

        $menuHtml = '';

        $submenu = '';
        $claseSubmenu = 'is-hidden-desktop';
        $ariaHidden = 'true';

        if ($menu) {
            foreach ($menu as $itemMenu) {
                $menuHtml .= $this->armarMenu($itemMenu);

                if (isset($itemMenu->submenu)) {
                    $claseSubmenu = '';
                    $ariaHidden = 'false';
                    $submenu = $this->cargarSubmenu($itemMenu->submenu);
                }
            }
        }

        $numeroMenus = sizeof($menuMovil);
        $menuMovil = $this->crearMenuMovil($menuMovil, $numeroMenus);

        $htmlIdiomas = $this->cargarIdioma($otrosIdiomas);

        $logo = $this->serverInfo->getBaseUrl().'uploads/general/logo.svg';

        $tmpl->addSearchReplace('{#CLASE#}', $clase);
        $tmpl->addSearchReplace('{#LOGO#}', $logo);
        $tmpl->addSearchReplace('{#ITEM_MENU#}', $menuHtml);
        $tmpl->addSearchReplace('{#ITEM_MENU_MOVIL#}', $menuMovil);
        $tmpl->addSearchReplace('{#IDIOMA#}', $htmlIdiomas);
        $tmpl->addSearchReplace('{#NOMBRE_SITIO#}', 'DLP Constructora');

        $tmpl->addSearchReplace('{#CLASE_SUBMENU#}', $claseSubmenu);
        $tmpl->addSearchReplace('{#ARIA-HIDDEN#}', $ariaHidden);
        $tmpl->addSearchReplace('{#SUBMENU#}', $submenu);

        return $tmpl->getHtml();
    }

    public function armarMenu($item)
    {
        $tmpl = $this->loadTemplate('item_menu');

        $link = '';
        $target = '';

        switch ($item->tipo_link) {
            case 0: // interno
                $link = $this->serverInfo->getBaseUrl().$item->codigo.'/pagina/'.$item->alias;
                $target = '_self';
                break;
            case 1: // externo
                $link = $item->link;
                $target = '_blank';
                break;
        }

        $tmpl->addSearchReplace('{#ALIAS#}',$item->alias);
        $tmpl->addSearchReplace('{#MENU#}', $item->nombre);
        $tmpl->addSearchReplace('{#LINK#}', $link);
        $tmpl->addSearchReplace('{#TARGET#}', $target);
        $tmpl->addSearchReplace('{#IDIOMA#}', $item->codigo);

        return $tmpl->getHtml();
    }

    private function cargarIdioma($otrosIdiomas)
    {
        $html = '';

        if ($otrosIdiomas) {
            foreach ($otrosIdiomas as $idioma) {
                $tmpl = $this->loadTemplate('item_idioma');

                $imagen = '';

                if ($idioma->imagen) {
                    $imagen = '<img class="img-idioma" src="'.$this->serverInfo->getBaseUrl().'uploads/general/'.
                        $idioma->imagen.'" name="'.$idioma->idioma.'" alt="'.$idioma->idioma.'" title="'.
                        $idioma->idioma.'" lang="'.$idioma->codigo.'">';
                }

                $tmpl->addSearchReplace('{#LENGUA#}', $idioma->idioma);
                $tmpl->addSearchReplace('{#IMAGEN#}', $imagen);
                $tmpl->addSearchReplace('{#IDIOMA#}', $idioma->codigo);

                // TODO link del idioma cargando la página actual

                $html.= $tmpl->getHtml();
                $tmpl->resetTemplate();
            }
        }

        return $html;
    }

    private function cargarSubmenu($submenu)
    {
        $html = '';

        foreach ($submenu as $item) {
            $tmpl = $this->loadTemplate('item_submenu');

            $link = '';
            $target = '_self';
            $alias = 'submenu-'.$item->id_menu;

            switch ($item->tipo_link) {
                case 0: // interno
                    $link = $this->serverInfo->getBaseUrl().$item->codigo.'/pagina/'.$item->alias;
                    $target = '_self';
                    $alias = $item->alias;
                    break;
                case 1: // externo
                    $link = $item->link;
                    $target = '_blank';
                    break;
                case 2: // ancla
                    $link = '#'.$item->alias;
                    $target = '_self';
                    $alias = $item->alias;
                    break;
            }

            $tmpl->addSearchReplace('{#ALIAS#}', $alias);
            $tmpl->addSearchReplace('{#ANCLA#}', $link);
            $tmpl->addSearchReplace('{#TARGET#}', $target);
            $tmpl->addSearchReplace('{#ITEM#}', $item->nombre);
            $tmpl->addSearchReplace('{#IDIOMA#}', $item->codigo);

            $html.= $tmpl->getHtml();
            $tmpl->resetTemplate();
        }

        return $html;
    }

    private function crearMenuMovil($datos, $numeroMenus)
    {
        $html = '';

        $menuPadre = 0;

        foreach ($datos as $item) {
            $link = '';
            $target = '_self';
            $alias = 'submenu-'.$item->id_menu;

            switch ($item->tipo_link) {
                case 0: // interno
                    $link = $this->serverInfo->getBaseUrl().$item->codigo.'/pagina/'.$item->alias;
                    $target = '_self';
                    $alias = $item->alias;
                    break;
                case 1: // externo
                    $link = $item->link;
                    $target = '_blank';
                    break;
                case 2: // ancla
                    $link = $this->serverInfo->getBaseUrl().$item->codigo.'/pagina/'.$item->alias_padre.'#'.$item->alias;
                    $target = '_self';
                    $alias = $item->alias;
                    break;
            }

            if (isset($item->submenu)) {
                $marcaSubmenu = '<span class="marca-submenu">+</span>';

                $html .= '<div class="navbar-item has-dropdown is-hoverable menu-movil" id="' . $item->id_menu . '">
                            <a class="navbar-link" href="' . $link . '" target="' . $target . '">' . $item->nombre.'</a>'.
                            $marcaSubmenu;
                $html .= '<div class="navbar-dropdown">';

                $html .= $this->crearMenuMovil($item->submenu, $numeroMenus);
                $html .= '</div>';
                $html .= '</div>';
            } else {
                $html .= '<a class="item-menu navbar-item" href="' . $link . '" target="' . $target . '" id="' . $item->id_menu . '">' . $item->nombre . '</a>';
            }

            if ($item->id_padre == 0) {
                $menuPadre++;
            }
        }

        return $html;
    }
}