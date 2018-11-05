<?php

namespace Dlp\Sitio\Modules\Footer\Views;

use Dlp\Sitio\System\FuncionesGlobales;
use ZCode\Lighting\View\BaseView;

class FooterView extends BaseView
{
    public function cargarFooter($menu, $anexo, $info)
    {
        $tmpl = $this->loadTemplate('footer');

        $this->addCss('footer');

        $menuHtml = $this->cargarMenu($menu);

        $anexoHtml = $this->cargarAnexos($anexo);
        $infoHtml = $this->cargarInfo($info);

        $tmpl->addSearchReplace('{#MENU#}', $menuHtml);
        $tmpl->addSearchReplace('{#MENU_FOOTER#}', $anexoHtml);
        $tmpl->addSearchReplace('{#INFORMACION#}', $infoHtml);

        return $tmpl->getHtml();
    }

    private function cargarMenu($menus)
    {
        $html = '';

        if ($menus) {
            foreach ($menus as $item) {
                $html .= $this->armarMenu($item);
            }
        }

        return $html;
    }

    public function armarMenu($item)
    {
        $tmpl = $this->loadTemplate('item_menu');

        $link = '';
        $target = '';
        $submenuHtml = '';

        switch ($item->tipo_link) {
            case 0: // interno
                $link = $this->serverInfo->getBaseUrl() . $item->codigo . '/pagina/' . $item->alias;
                $target = '_self';
                break;
            case 1: // externo
                $link = $item->link;
                $target = '_blank';
                break;
        }

        if ($item->submenu) {
            $submenuHtml .= $this->cargarSubmenu($item);
        }

        $tmpl->addSearchReplace('{#MENU#}', $item->nombre);
        $tmpl->addSearchReplace('{#LINK#}', $link);
        $tmpl->addSearchReplace('{#TARGET#}', $target);
        $tmpl->addSearchReplace('{#IDIOMA#}', $item->codigo);
        $tmpl->addSearchReplace('{#SUBMENU#}', $submenuHtml);

        return $tmpl->getHtml();
    }

    private function cargarSubmenu($menu)
    {
        $html = '';

        foreach ($menu->submenu as $item) {
            $tmpl = $this->loadTemplate('item_submenu');

            $link = '';
            $target = '_self';
            $alias = 'submenu-' . $item->id_menu;

            switch ($item->tipo_link) {
                case 0: // interno
                    $link = $this->serverInfo->getBaseUrl() . $item->codigo . '/pagina/' . $item->alias;
                    $target = '_self';
                    $alias = $item->alias;
                    break;
                case 1: // externo
                    $link = $item->link;
                    $target = '_blank';
                    break;
                case 2: // ancla
                    $link = $this->serverInfo->getBaseUrl() . $menu->codigo . '/pagina/' . $menu->alias . '#' . $item->alias;
                    $target = '_self';
                    $alias = $item->alias;
                    break;
            }

            $tmpl->addSearchReplace('{#ALIAS#}', $alias);
            $tmpl->addSearchReplace('{#ANCLA#}', $link);
            $tmpl->addSearchReplace('{#TARGET#}', $target);
            $tmpl->addSearchReplace('{#ITEM#}', $item->nombre);
            $tmpl->addSearchReplace('{#IDIOMA#}', $item->codigo);

            $html .= $tmpl->getHtml();
            $tmpl->resetTemplate();
        }

        return $html;
    }

    private function cargarAnexos($anexo)
    {
        $html = '';
        $valido = false;

        if ($anexo !== null && is_array($anexo)) {
            $valido = true;
        }

        if ($valido) {
            foreach ($anexo as $item) {
                $tmpl = $this->loadTemplate('menu_anexo');

                $link = '';
                $target = '_self';
                $alias = 'anexo-'.$item->id_menu_footer;

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
                }

                $tmpl->addSearchReplace('{#ICONO#}', $this->serverInfo->getBaseUrl().'uploads/general/'.$item->icono);
                $tmpl->addSearchReplace('{#ALIAS#}', $alias);
                $tmpl->addSearchReplace('{#LINK#}', $link);
                $tmpl->addSearchReplace('{#TARGET#}', $target);
                $tmpl->addSearchReplace('{#MENU#}', $item->menu);
                $tmpl->addSearchReplace('{#IDIOMA#}', $item->codigo);

                $html .= $tmpl->getHtml();
                $tmpl->resetTemplate();
            }
        }

        return $html;
    }

    private function cargarInfo($info)
    {
        $html = '';
        $valido = false;

        if ($info !== null && is_array($info)) {
            $valido = true;
        }

        $infoNecesaria = [ 'direccion', 'telefono', 'correo', 'como_llegar' ];


        $direccion  = FuncionesGlobales::buscarValorObjeto($info, $infoNecesaria['0'], 'configuracion');
        $telefono   = FuncionesGlobales::buscarValorObjeto($info, $infoNecesaria['1'], 'configuracion');
        $correo     = FuncionesGlobales::buscarValorObjeto($info, $infoNecesaria['2'], 'configuracion');
        $comoLlegar = FuncionesGlobales::buscarValorObjeto($info, $infoNecesaria['3'], 'configuracion');

        $tmpl = $this->loadTemplate('informacion');

            $tmpl->addSearchReplace('{#COMO_LLEGAR#}', $comoLlegar['item']->valor);
            $tmpl->addSearchReplace('{#DIRECCION#}', nl2br($direccion['item']->valor));

            $tmpl->addSearchReplace('{#LLAMAR_TEL#}', $telefono['item']->valor);
            $tmpl->addSearchReplace('{#TELEFONO#}', $telefono['item']->valor);

            $tmpl->addSearchReplace('{#CORREO#}', $correo['item']->valor);

        $html .= $tmpl->getHtml();

        return $html;
    }
}
        
