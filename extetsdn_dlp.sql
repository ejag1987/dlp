-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 05-11-2018 a las 14:58:51
-- Versión del servidor: 10.1.36-MariaDB-cll-lve
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `extetsdn_dlp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caluga`
--

CREATE TABLE `caluga` (
  `id_caluga` int(10) UNSIGNED NOT NULL,
  `id_modulo` int(10) UNSIGNED NOT NULL,
  `titulo1` varchar(50) DEFAULT NULL,
  `titulo2` varchar(50) DEFAULT NULL,
  `texto` text,
  `color` varchar(50) DEFAULT NULL,
  `imagen` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `posicion` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `orden` int(10) UNSIGNED NOT NULL,
  `fecha` datetime NOT NULL,
  `eliminado` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `caluga`
--

INSERT INTO `caluga` (`id_caluga`, `id_modulo`, `titulo1`, `titulo2`, `texto`, `color`, `imagen`, `link`, `posicion`, `orden`, `fecha`, `eliminado`) VALUES
(1, 2, 'EMPR', 'ESA', 'Con más de 37 años de experiencia, crecemos sosteniblemente desarrollando proyectos de construcción e inmobiliarios.', 'fondo-verde', 'empresa_home.jpg', 'es/pagina/empresa', 1, 1, '2018-05-15 18:21:13', 0),
(2, 2, 'CONSTR', 'UCTORA', 'Atendemos las necesidades de nuestros clientes a través de soluciones constructivas, innovadoras y con estándares de calidad y eficiencia.', 'fondo-darkgrey', 'constructora_home.jpg', 'es/pagina/constructora', 2, 2, '2018-05-15 18:22:35', 0),
(3, 2, 'INMOBI', 'LIARIA', 'Conoce nuestros modernos proyectos, con espacios funcionales que proporcionan ambientes de confort. ', 'fondo-rojo', 'inmobiliaria_home.jpg', 'es/pagina/inmobiliaria', 1, 3, '2018-05-15 18:23:12', 0),
(4, 2, 'PER', 'SONAS', 'Motivamos el desarrollo profesional, la seguridad, el bienestar y la calidad de vida de nuestros colaboradores.', 'fondo-verde', 'personas_home.jpg', 'es/pagina/personas', 2, 4, '2018-05-15 18:24:15', 0),
(5, 7, 'JAVIER', 'DARRAÏDOU', 'Socio fundador', 'fondo-negro', 'Javier-Darraidou.jpg', NULL, 1, 2, '2018-05-16 11:45:02', 0),
(6, 7, 'PELAYO', 'LARRAIN', 'Socio fundador', 'fondo-negro', 'Pelayo-Larrain.jpg', NULL, 1, 3, '2018-05-16 11:45:20', 0),
(7, 7, 'JOSÉ MANUEL', 'POBLETE', 'Socio fundador', 'fondo-verde', 'Jose-Manuel-Poblete.jpg', NULL, 1, 4, '2018-05-16 11:45:36', 0),
(8, 10, 'JOSÉ ANTONIO', 'POBLETE', 'Gerente de negocios y estudios', 'fondo-negro', 'Jose-Antonio-Poblete.jpg', NULL, 1, 2, '2018-05-16 15:19:36', 0),
(9, 10, 'JULIO', 'CASTILLO', 'Gerente de operaciones', 'fondo-negro', 'Julio-Castillo.jpg', NULL, 1, 3, '2018-05-16 15:20:09', 0),
(10, 10, 'BELTRÁN', 'LARRAIN', 'Gerente técnico', 'fondo-verde', 'Beltran-Larrain.jpg', NULL, 1, 4, '2018-05-16 15:20:47', 0),
(11, 10, 'SANTIAGO', 'SAITUA', 'Gerente general', 'fondo-verde', 'Santiago-Saitua.jpg', NULL, 1, 1, '2018-05-16 15:21:25', 0),
(12, 12, 'SERGIO', 'VENEGAS', 'Gerente de proyecto', 'fondo-negro', 'Sergio-Venegas.jpg', NULL, 1, 3, '2018-05-16 15:39:24', 0),
(13, 12, 'FRANCISCO', 'DARRAÏDOU', 'Gerente de proyecto', 'fondo-negro', 'Francisco-Darraidou.jpg', NULL, 1, 1, '2018-05-16 15:40:14', 0),
(14, 12, 'ULISES', 'TELLO', 'Gerente de proyecto', 'fondo-negro', 'Ulises-Tello.jpg', NULL, 1, 4, '2018-05-16 15:40:46', 0),
(15, 25, NULL, NULL, 'Reconocimiento Corporación de Capacitación de la Construcción (OTIC). 2016.', 'fondo-negro', 'torneo-de-apertura-cordep.jpg', NULL, 1, 0, '2018-05-23 12:23:36', 1),
(16, 25, NULL, NULL, 'Premio Empresa Sostenible en la categoría de Gran Constructora.\r\nCChC\r\n2018\r\n', 'fondo-verde', 'pemio-empresa-sostenible-cchc-2018.jpg', NULL, 1, 1, '2018-05-23 12:27:08', 0),
(17, 25, NULL, NULL, 'Compromiso con la Capacitación de los Trabajadores del Sector Construcción.\r\nETC- CChC\r\n2017', 'fondo-negro', 'reconocimiento-compromiso-con-la-capacitacion-de-los-trabajadores-del-sector-construccion.jpg', NULL, 1, 2, '2018-05-23 12:28:22', 0),
(18, 25, NULL, NULL, 'Compartiendo Buenas Prácticas en Seguridad y Salud en el Trabajo.\r\nMutual de Seguridad -  CChC\r\n2017', 'fondo-negro', 'x-version-concurso-compartiendo-buenas-practicas-en-seguridad-y-salud-en-el-trabajo.jpg', NULL, 1, 3, '2018-05-23 12:28:49', 0),
(19, 25, NULL, NULL, 'Empresa de Mayor Trayectoria y Permanencia en el OTIC.\r\nCCHC - OTIC\r\n2017', 'fondo-verde', 'reconocimiento-a-empresa-de-mayor-trayectoria-y-permanencia-en-el-otic.jpg', NULL, 1, 4, '2018-05-23 12:29:14', 0),
(20, 25, NULL, NULL, 'Compartiendo Buenas Prácticas en Seguridad y Salud en el Trabajo.\r\nMutual de Seguridad - CChC\r\n2016', 'fondo-verde', 'ix-version-concurso-compartiendo-buenas-practicas-en-seguridad-y-salud-en-el-trabajo.jpg', NULL, 1, 5, '2018-05-23 12:29:41', 0),
(21, 12, 'ÁLVARO', 'LIZAMA', 'Gerente inmobiliario ', 'fondo-negro', 'Alvaro-Lizama.jpg', NULL, 1, 5, '2018-06-07 10:42:39', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caluga_texto`
--

CREATE TABLE `caluga_texto` (
  `id_caluga_texto` int(10) UNSIGNED NOT NULL,
  `id_modulo` int(11) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `color` varchar(50) NOT NULL,
  `posicion` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `posicion_movil` int(11) DEFAULT '1',
  `fecha_creacion` datetime NOT NULL,
  `eliminado` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `caluga_texto`
--

INSERT INTO `caluga_texto` (`id_caluga_texto`, `id_modulo`, `imagen`, `color`, `posicion`, `posicion_movil`, `fecha_creacion`, `eliminado`) VALUES
(1, 14, 'etica_diversidad.jpg', 'fondo-azul', 2, 1, '2018-05-16 16:56:42', 0),
(2, 15, 'Proveedores.jpg', 'fondo-rojo', 1, 1, '2018-05-16 16:58:11', 0),
(3, 16, 'comunidad-medio-ambiente.jpg', 'fondo-verde', 2, 1, '2018-05-16 16:58:45', 0),
(4, 13, 'mision_vision.jpg', 'fondo-rojo', 2, 2, '2018-05-16 18:00:42', 0),
(5, 18, 'capacitacion.jpg', 'fondo-rojo', 1, 1, '2018-05-18 10:23:22', 0),
(6, 20, 'gestion-social.jpg', 'fondo-azul', 2, 1, '2018-05-23 12:14:30', 0),
(7, 21, 'cultura-de-seguridad.jpg', 'fondo-rojo', 1, 1, '2018-05-23 12:18:15', 0),
(8, 24, 'reconocimientos.jpg', 'fondo-verde', 2, 3, '2018-05-23 12:21:18', 0),
(9, 27, 'trabaja-con-nosotros.jpg', 'fondo-rojo', 1, 3, '2018-05-23 12:34:20', 0),
(10, 31, 'clientes.jpg', 'fondo-azul', 1, 1, '2018-05-29 15:44:29', 0),
(11, 28, 'clientes.jpg', 'fondo-verde', 1, 1, '2018-06-01 05:43:31', 0),
(12, 34, 'clientes.jpg', 'fondo-azul', 1, 1, '2018-06-01 05:45:17', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cifras`
--

CREATE TABLE `cifras` (
  `id_cifras` int(10) UNSIGNED NOT NULL,
  `id_modulo` int(10) UNSIGNED NOT NULL,
  `titulo` text,
  `texto_grande` varchar(255) DEFAULT NULL,
  `texto_medio` varchar(255) DEFAULT NULL,
  `texto_chico` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `orden` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `eliminado` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cifras`
--

INSERT INTO `cifras` (`id_cifras`, `id_modulo`, `titulo`, `texto_grande`, `texto_medio`, `texto_chico`, `color`, `orden`, `fecha_creacion`, `eliminado`) VALUES
(1, 29, 'DLP EN \r\nCIFRAS', NULL, NULL, NULL, 'fondo-gris', 1, '2018-05-25 11:51:09', 0),
(2, 29, NULL, '37', NULL, 'años de experiencia', 'fondo-azul', 2, '2018-05-25 12:18:49', 0),
(3, 29, NULL, '+2.500', NULL, 'trabajadores', 'fondo-gris', 3, '2018-05-25 12:19:58', 0),
(4, 29, NULL, '16', NULL, '<a href=\"http://dlp.extenddigital.cl/es/pagina/constructora#obras_en_ejecucion\">obras en ejecución</a>', 'fondo-verde', 4, '2018-05-25 12:20:18', 0),
(5, 29, NULL, '300.000.000', 'USD', 'backlog', 'fondo-rojo', 5, '2018-05-25 12:22:03', 0),
(6, 29, NULL, '17\r\n', NULL, '<a href=\"http://dlp.extenddigital.cl/es/pagina/inmobiliaria#proyectos_en_venta\">proyectos inmobiliarios en desarrollo</a>', 'fondo-azul', 6, '2018-05-28 10:05:11', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id_configuracion` int(10) UNSIGNED NOT NULL,
  `id_idioma` int(10) UNSIGNED NOT NULL,
  `configuracion` varchar(100) NOT NULL,
  `valor` text,
  `eliminado` tinyint(3) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id_configuracion`, `id_idioma`, `configuracion`, `valor`, `eliminado`) VALUES
(1, 1, 'direccion', 'Av. Apoquindo 4775,\r\nPiso 9, Las Condes,\r\nSantiago de Chile', 0),
(2, 1, 'telefono', '(56-2) 2263 05 00', 0),
(3, 1, 'correo', 'dlp@dlp.cl', 0),
(4, 1, 'como_llegar', 'https://goo.gl/maps/LxurrKq8sbk', 0),
(5, 2, 'direccion', 'Torre Apoquindo,\r\nAv. Apoquindo 4775,\r\nPiso 9, Las Condes,\r\nSantiago de Chile', 0),
(6, 2, 'telefono', '(56-2) 2263 05 00', 0),
(7, 2, 'correo', 'dlp@dlp.cl', 0),
(8, 2, 'como_llegar', 'https://goo.gl/maps/LxurrKq8sbk', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `galeria`
--

CREATE TABLE `galeria` (
  `id_galeria` int(10) UNSIGNED NOT NULL,
  `id_categoria` int(10) UNSIGNED NOT NULL,
  `alias` varchar(255) NOT NULL,
  `titulo` text,
  `subtitulo` varchar(255) DEFAULT NULL,
  `foto_principal` varchar(255) DEFAULT NULL,
  `comuna` varchar(255) DEFAULT NULL,
  `anio` varchar(255) DEFAULT NULL,
  `inmobiliaria` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `orden` int(10) UNSIGNED NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `eliminado` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `destacado` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `galeria`
--

INSERT INTO `galeria` (`id_galeria`, `id_categoria`, `alias`, `titulo`, `subtitulo`, `foto_principal`, `comuna`, `anio`, `inmobiliaria`, `link`, `orden`, `fecha_creacion`, `eliminado`, `destacado`) VALUES
(1, 1, '1-montenova_i', 'MONTENOVA I', '', 'montenova_i_galeria.jpg', 'SAN JOAQUÍN', '2018', '', '', 1, '2018-05-24 18:38:39', 0, 0),
(2, 1, '2-hannover_i', 'HANNOVER I', '', 'hannover_i_galeria.jpg', 'LA REINA', '2018', '', '', 2, '2018-05-24 18:38:40', 0, 0),
(3, 1, '3-amapolas', 'AMAPOLAS', '', 'amapolas_galeria.jpg', 'ÑUÑOA', '2017', '', '', 3, '2018-05-24 18:38:41', 0, 0),
(4, 1, '4-los_espinos', 'LOS ESPINOS', '', 'los_espinos_galeria.jpg', 'LO BARNECHEA', '2017', '', '', 4, '2018-05-24 18:38:42', 0, 0),
(5, 1, '5-malbec_i', 'MALBEC I', '', 'malbec_i_galeria.jpg', 'LO BARNECHEA', '2017', '', '', 5, '2018-05-24 18:38:43', 0, 0),
(6, 1, '6-nunoa_plus', 'ÑUÑOA PLUS', '', 'nunoa_plus_galeria.jpg', 'ÑUÑOA', '2014', '', '', 6, '2018-05-24 18:38:44', 0, 0),
(7, 1, '7-polo_golf_6_y_7', 'POLO GOLF 6 & 7', '', 'polo_golf_6_y_7_galeria.jpg', 'VITACURA', '2014', '', '', 7, '2018-05-24 18:38:45', 0, 0),
(8, 1, '8-alcantara_etapa_i_y_ii', 'ALCÁNTARA I & II ', '', 'alcantara_etapa_i_y_ii_galeria.jpg', 'LAS CONDES', '2013-2011', '', '', 8, '2018-05-24 18:38:46', 0, 0),
(9, 1, '9-don_vicente', 'DON VICENTE', '', 'don_vicente_galeria.jpg', 'LA FLORIDA', '2009', '', '', 9, '2018-05-24 18:38:47', 0, 0),
(10, 1, '10-espacio_warren', 'ESPACIO WARREN', '', 'espacio_warren_galeria.jpg', 'LAS CONDES', '2007', '', '', 10, '2018-05-24 18:38:48', 0, 0),
(11, 1, '11-fray_bernardo', 'FRAY BERNARDO', '', 'fray_bernardo_galeria.jpg', 'LAS CONDES', '2007', '', '', 11, '2018-05-24 18:38:49', 0, 0),
(12, 1, '12-vista_mar', 'VISTA MAR', '', 'vista_mar_galeria.jpg', 'VALPARAÍSO', '2006', '', '', 12, '2018-05-24 18:38:50', 0, 0),
(13, 1, '13-callao', 'CALLAO', '', 'callao_galeria.jpg', 'LAS CONDES', '2005', '', '', 13, '2018-05-24 18:38:51', 0, 0),
(14, 1, '14-valle_del_monasterio', 'VALLE DEL MONASTERIO', '', 'valle_del_monasterio_galeria.jpg', 'LO BARNECHEA', '2005', '', '', 14, '2018-05-24 18:38:52', 0, 0),
(15, 1, '15-marbella', 'MARBELLA', '', 'marbella_galeria.jpg', 'MARBELLA', '2004', '', '', 15, '2018-05-24 18:38:53', 0, 0),
(16, 1, '16-euromarina', 'EUROMARINA', '', 'euromarina_galeria.jpg', 'COCHOA', '2003', '', '', 16, '2018-05-24 18:38:54', 0, 0),
(17, 1, '17-montecarrara', 'MONTECARRARA', '', 'montecarrara_galeria.jpg', 'PROVIDENCIA', '1999', '', '', 17, '2018-05-24 18:38:55', 1, 0),
(18, 1, '18-mirador_de_portezuelo', 'MIRADOR DE PORTEZUELO', '', 'mirador_de_portezuelo_galeria.jpg', 'VITACURA', '1998', '', '', 18, '2018-05-24 18:38:56', 0, 0),
(19, 2, '19-planta_industrial_nestle', 'PLANTA INDUSTRIAL NESTLÉ', '', 'planta_industrial_nestle_galeria.jpg', 'TENO', '2016', '', '', 1, '2018-05-25 18:38:56', 0, 0),
(20, 2, '20-planta_ferrero', 'PLANTA FERRERO', '', 'planta_ferrero_galeria.jpg', 'RÍO CLARO', '2015', '', '', 2, '2018-05-26 18:38:56', 0, 0),
(21, 2, '21-planta_pf_-_fase_i_ii_iii_y_iv', 'PLANTA PF I, II, III & IV', '', 'planta_pf_-_fase_i_ii_iii_y_iv_galeria.jpg', 'TALCA / RENCA', '2009-2010-2011-2014', '', '', 3, '2018-05-27 18:38:56', 0, 0),
(22, 2, '22-planta_industrial_good_food', 'PLANTA INDUSTRIAL GOOD FOOD', '', 'planta_industrial_good_food_galeria.jpg', 'PEÑAFLOR', '2014', '', '', 4, '2018-05-28 18:38:56', 0, 0),
(23, 2, '23-planta_indumotora_panamericana', 'PLANTA INDUMOTORA PANAMERICANA', '', 'planta_indumotora_panamericana_galeria.jpg', 'LAMPA', '2013', '', '', 5, '2018-05-29 18:38:56', 0, 0),
(24, 2, '24-planta_wurth_chile', 'PLANTA WURTH CHILE', '', 'planta_wurth_chile_galeria.jpg', 'PADRE HURTADO', '2013', '', '', 6, '2018-05-30 18:38:56', 0, 0),
(25, 2, '25-vina_montes', 'VIÑA MONTES', '', 'vina_montes_galeria.jpg', 'CHIMBARONGO', '2012', '', '', 7, '2018-05-31 18:38:56', 0, 0),
(26, 2, '26-vina_el_principal', 'VIÑA EL PRINCIPAL', '', 'vina_el_principal_galeria.jpg', 'PIRQUE', '2009', '', '', 8, '2018-06-01 18:38:56', 0, 0),
(27, 2, '27-planta_osb_lousiana_pacific', 'PLANTA LOUSIANA PACIFIC', '', 'planta_osb_lousiana_pacific_galeria.jpg', 'PANGUIPULLI / LAUTARO', '2007-2001', '', '', 9, '2018-06-02 18:38:56', 0, 0),
(28, 2, '28-centro_de_distribucion_alsacia', 'CENTRO DE DISTRIBUCIÓN ALSACIA', '', 'centro_de_distribucion_alsacia_galeria.jpg', 'PUDAHUEL', '2007', '', '', 10, '2018-06-03 18:38:56', 0, 1),
(29, 2, '29-vina_perez_cruz', 'VIÑA PÉREZ CRUZ', '', 'vina_perez_cruz_galeria.jpg', 'PAINE', '2001', '', '', 11, '2018-06-04 18:38:56', 0, 0),
(30, 2, '30-planta_cecinas_san_jorge', 'PLANTA CECINAS SAN JORGE', '', 'planta_cecinas_san_jorge_galeria.jpg', 'PUDAHUEL', '1996', '', '', 12, '2018-06-05 18:38:56', 0, 0),
(31, 3, '31-hotel_la_quinta', 'HOTEL LA QUINTA', '', NULL, 'PUDAHUEL', '2018', '', '', 1, '2018-06-06 18:38:56', 1, 0),
(32, 3, '32-portal_penalolen', 'CENTRO COMERCIAL ALTO PEÑALOLÉN', '', 'portal_penalolen_galeria.jpg', 'PEÑALOLÉN', '2015', '', '', 2, '2018-06-07 18:38:56', 0, 0),
(33, 3, '33-centro_deportivo_yutopia', 'CENTRO DEPORTIVO YUTOPIA ', '', NULL, 'LO BARNECHEA', '2014', '', '', 3, '2018-06-08 18:38:56', 1, 0),
(34, 3, '34-portal_los_andes', 'PORTAL LOS ANDES', '', 'portal_los_andes_galeria.jpg', 'LOS ANDES', '2012', '', '', 4, '2018-06-09 18:38:56', 0, 0),
(35, 3, '35-audi_chile_nuevo_terminal', 'AUDI CHILE NUEVO TERMINAL', '', 'audi_chile_nuevo_terminal_galeria.jpg', 'LO BARNECHEA', '2012', '', '', 5, '2018-06-10 18:38:56', 0, 0),
(36, 3, '36-hotel_y_casino_plaza_sol_de_los_lagos', 'HOTEL Y CASINO PLAZA SOL DE LOS LAGOS', '', 'hotel_y_casino_plaza_sol_de_los_lagos_galeria.jpg', 'OSORNO', '2008', '', '', 6, '2018-06-11 18:38:56', 0, 0),
(37, 4, '37-pedro_de_valdivia', 'PEDRO DE VALDIVIA', '', 'pedro_de_valdivia_galeria.jpg', 'PROVIDENCIA', '2016', '', '', 1, '2018-06-12 18:38:56', 0, 0),
(38, 4, '38-lbf', 'LBF', '', 'lbf_galeria.jpg', 'PUDAHUEL ', '2015', '', '', 2, '2018-06-13 18:38:56', 0, 0),
(39, 4, '39-santa_carmen_de_chicureo', 'SANTA CARMEN DE CHICUREO', '', 'santa_carmen_de_chicureo_galeria.jpg', 'COLINA', '2015', '', '', 3, '2018-06-14 18:38:56', 0, 0),
(40, 4, '40-francisco_de_aguirre', 'FRANCISCO DE AGUIRRE', '', 'francisco_de_aguirre_galeria.jpg', 'VITACURA', '2014', '', '', 4, '2018-06-15 18:38:56', 0, 0),
(41, 4, '41-alcantara_99', 'ALCÁNTARA 99', '', 'alcantara_99_galeria.jpg', 'LAS CONDES', '2014', '', '', 5, '2018-06-16 18:38:56', 0, 0),
(42, 4, '42-los_militares', 'LOS MILITARES', '', 'los_militares_galeria.jpg', 'LAS CONDES', '2014', '', '', 6, '2018-06-17 18:38:56', 0, 0),
(43, 4, '43-fontecilla', 'LO FONTECILLA', '', 'fontecilla_galeria.jpg', 'LAS CONDES', '2013', '', '', 7, '2018-06-18 18:38:56', 0, 0),
(44, 4, '44-plaza_bellet', 'PLAZA BELLET', '', 'plaza_bellet_galeria.jpg', 'PROVIDENCIA', '2012', '', '', 8, '2018-06-19 18:38:56', 0, 0),
(45, 4, '45-costanera_cosas', 'COSTANERA COSAS', '', 'costanera_cosas_galeria.jpg', 'PROVIDENCIA', '2010', '', '', 9, '2018-06-20 18:38:56', 0, 0),
(46, 4, '46-estoril_100', 'ESTORIL 100', '', 'estoril_100_galeria.jpg', 'LAS CONDES', '2010', '', '', 10, '2018-06-21 18:38:56', 0, 0),
(47, 4, '47-estoril_50', 'ESTORIL 50', '', 'estoril_50_galeria.jpg', 'LAS CONDES', '2006', '', '', 11, '2018-06-22 18:38:56', 0, 0),
(48, 4, '48-c.c.a.f_los_andes', 'CAJA LOS ANDES', '', 'c.c.a.f_los_andes_galeria.jpg', 'SANTIAGO', '2004', '', '', 12, '2018-06-23 18:38:56', 0, 0),
(49, 5, '49-colegio_albamar', 'COLEGIO ALBAMAR', '', 'colegio_albamar_galeria.jpg', 'CONCÓN', '2017', '', '', 1, '2018-06-24 18:38:56', 0, 0),
(50, 5, '50-colegio_pumahue', 'COLEGIO PUMAHUE', '', 'colegio_pumahue_galeria.jpg', 'LAMPA', '2016', '', '', 2, '2018-06-25 18:38:56', 0, 0),
(51, 5, '51-colegio_san_francisco_javier', 'COLEGIO SAN FRANCISCO JAVIER', '', 'colegio_san_francisco_javier_galeria.jpg', 'PUERTO MONTT', '2011', '', '', 3, '2018-06-26 18:38:56', 0, 0),
(52, 5, '52-duoc_sede_palacio_cousino', 'DUOC, SEDE PALACIO COUSIÑO', '', 'duoc_sede_palacio_cousino_galeria.jpg', 'VALPARAÍSO', '2011', '', '', 4, '2018-06-27 18:38:56', 0, 0),
(53, 5, '53-universidad_central_-_c._parque_almagro_-_centro_deportivo', 'UNIVERSIDAD CENTRAL -  C. PARQUE ALMAGRO', '', 'universidad_central_-_c._parque_almagro_-_centro_deportivo_galeria.jpg', 'SANTIAGO', '2009-2007', '', '', 5, '2018-06-28 18:38:56', 0, 0),
(54, 6, '54-aires_del_valle', 'CONDOMINIO AIRES DEL VALLE', '', 'aires_del_valle_galeria.jpg', 'SAN FELIPE', '2017', '', '', 1, '2018-06-29 18:38:56', 0, 0),
(55, 6, '55-condominio_don_emiliano_etapas_i_y_ii', 'CONDOMINIO DON EMILIANO I & II', '', 'condominio_don_emiliano_etapas_i_y_ii_galeria.jpg', 'SANTIAGO', '2009-2013', '', '', 2, '2018-06-30 18:38:56', 0, 0),
(56, 6, '56-condominio_catedral', 'CONDOMINIO CATEDRAL', '', 'condominio_catedral_galeria.jpg', 'SANTIAGO', '2007', '', '', 3, '2018-07-01 18:38:56', 0, 0),
(57, 6, '57-condominio_los_recoletos_etapas_i_y_ii', 'CONDOMINIO LOS RECOLETOS I, II & III', '', 'condominio_los_recoletos_etapas_i_y_ii_galeria.jpg', 'RECOLETA', '2000-2002-2005-2007', '', '', 4, '2018-07-02 18:38:56', 0, 0),
(58, 6, '58-condominio_los_alerces', 'CONDOMINIO LOS ALERCES', '', 'condominio_los_alerces_galeria.jpg', 'ESTACIÓN CENTRAL', '2004', '', '', 5, '2018-07-03 18:38:56', 0, 0),
(59, 6, '59-condominio_don_nicasio', 'CONDOMINIO DON NICASIO', '', 'condominio_don_nicasio_galeria.jpg', 'SANTIAGO', '2003', '', '', 6, '2018-07-04 18:38:56', 0, 0),
(60, 7, '60-casona_de_eventos_sofia_jottar', 'CASONA DE EVENTOS SOFÍA JOTTAR', '', 'casona_de_eventos_sofia_jottar_galeria.jpg', 'CHICUREO', '2013', '', '', 1, '2018-07-05 18:38:56', 0, 0),
(61, 7, '61-edificio_ejercito_bicentenario', 'EDIFICIO EJÉRCITO BICENTENARIO', '', 'edificio_ejercito_bicentenario_galeria.jpg', 'SANTIAGO', '2012', '', '', 2, '2018-07-06 18:38:56', 0, 0),
(62, 7, '62-juzgado_los_andes', 'JUZGADO LOS ANDES', '', 'juzgado_los_andes_galeria.jpg', 'LOS ANDES', '2012', '', '', 3, '2018-07-07 18:38:56', 0, 0),
(63, 7, '63-consultorio_llay_llay_cesfam', 'CONSULTORIO CESFAM', '', 'consultorio_llay_llay_cesfam_galeria.jpg', 'LLAY LLAY ', '2010', '', '', 4, '2018-07-08 18:38:56', 0, 0),
(64, 7, '64-merval_tramo_a_etapa_iv_-_tramo_f_y_g_etapa_iv', 'MERVAL TRAMO A IV - TRAMO F & G IV', '', 'merval_tramo_a_etapa_iv_-_tramo_f_y_g_etapa_iv_galeria.jpg', 'VIÑA DEL MAR / LIMACHE ', '2005', '', '', 5, '2018-07-09 18:38:56', 0, 0),
(65, 7, '65-linea_220_kv_-_polpaico', 'LÍNEA 220 KV - POLPAICO', '', 'linea_220_kv_-_polpaico_galeria.jpg', 'CHINCOLANTE / RECOLETA', '2003', '', '', 6, '2018-07-10 18:38:56', 0, 0),
(66, 7, '66-parroquia_maria_madre_de_la_misericordia', 'PARROQUIA MARÍA MADRE DE LA MISERICORDIA', '', 'parroquia_maria_madre_de_la_misericordia_galeria.jpg', 'LO BARNECHEA', '1999', '', '', 7, '2018-07-11 18:38:56', 0, 0),
(67, 7, '67-club_house_santa_maria_del_mar', 'CLUB HOUSE SANTA MARÍA DEL MAR', '', 'club_house_santa_maria_del_mar_galeria.jpg', 'SANTO DOMINGO', '1999', '', '', 8, '2018-07-12 18:38:56', 0, 0),
(68, 7, '68-edificio_teleton', 'EDIFICIO TELETÓN', '', 'edificio_teleton_galeria.jpg', 'PUERTO MONT', '1990', '', '', 12, '2018-07-13 18:38:56', 0, 0),
(69, 11, '69-homecenter_sodimac', 'HOMECENTER SODIMAC', '', 'homecenter_sodimac_galeria.jpg', 'ÑUÑOA', '2017', '', '', 12, '2018-07-14 18:38:56', 0, 0),
(70, 9, '70-el_manio', 'EL MAÑÍO', '', 'el_manio_galeria.jpg', 'VITACURA', '2018', '', '', 1, '2018-07-15 18:38:56', 0, 0),
(71, 9, '71-hannover_ii', 'HANNOVER II', '', 'hannover_ii_galeria.jpg', 'LA REINA', '2017', '', '', 9, '2018-07-16 18:38:56', 0, 0),
(72, 9, '72-montenova_ii', 'MONTENOVA II', '', 'montenova_ii_galeria.jpg', 'SAN JOAQUÍN', '2016', '', '', 8, '2018-07-17 18:38:56', 0, 1),
(73, 9, '73-matucana_i', 'MATUCANA I', '', 'matucana_i_galeria.jpg', 'SANTIAGO', '2017', '', '', 3, '2018-07-18 18:38:56', 0, 0),
(74, 9, '74-farellones', 'CAMINO FARELLONES', '', 'farellones_galeria.jpg', 'LAS CONDES', '2017', '', '', 4, '2018-07-19 18:38:56', 0, 0),
(75, 9, '75-sucre', 'SUCRE', '', 'sucre_galeria.jpg', 'ÑUÑOA', '2017', '', '', 5, '2018-07-20 18:38:56', 0, 0),
(76, 9, '76-condominio_otonal', 'CONDOMINIO OTOÑAL ', '', 'condominio_otonal_galeria.jpg', 'LAS CONDES', '2017', '', '', 6, '2018-07-21 18:38:56', 0, 0),
(77, 8, '77-prosegur', 'PROSEGUR', '', 'prosegur_galeria.jpg', 'CURAUMA', '2017', '', '', 13, '2018-07-22 18:38:56', 0, 0),
(78, 8, '78-centro_deportivo_pf', 'CENTRO DEPORTIVO PF   ', '', 'centro_deportivo_pf_galeria.jpg', 'TALCA', '2017', '', '', 14, '2018-07-23 18:38:56', 0, 0),
(79, 10, '79-open_montemar', 'OPEN MONTEMAR ', '', 'open_montemar_galeria.jpg', 'CONCÓN', '2018', '', '', 7, '2018-07-24 18:38:56', 0, 0),
(80, 10, '80-hannover_iii', 'HANNOVER III', '', 'hannover_iii_galeria.jpg', 'LA REINA', '2017', '', '', 10, '2018-07-25 18:38:56', 0, 0),
(81, 10, '81-transoceanica', 'TRANSOCEÁNICA', '', 'transoceanica_galeria.jpg', 'VITACURA', '2017', '', '', 2, '2018-07-26 18:38:56', 0, 0),
(82, 7, '82-socalzado_y_subterraneos_-_hotel_de_vina', 'FUNDACIONES Y SUBTERRÁNEOS HOTEL MANDARÍN', '', 'socalzado_y_subterraneos_-_hotel_de_vina_galeria.jpg', 'VIÑA DEL MAR', '2016', '', '', 11, '2018-07-27 18:38:56', 0, 0),
(83, 13, '83-edificio_vistanova', 'EDIFICIO VISTANOVA', '', 'edificio_vistanova_galeria.jpg', 'SANTIAGO', '', 'DLP - VIDA NUEVA', 'http://www.vidanueva.cl/proyecto-en-venta/santiago-vistanova/', 1, '2018-07-28 18:38:56', 0, 0),
(84, 13, '84-edificio_montenova_i', 'EDIFICIO MONTENOVA I', '', 'edificio_montenova_i_galeria.jpg', 'SAN JOAQUÍN', '', 'DLP - VIDA NUEVA', 'http://www.vidanueva.cl/proyecto-en-venta/condominio-montenova/', 2, '2018-07-29 18:38:56', 0, 0),
(85, 13, '85-edificio_montenova_ii', 'EDIFICIO MONTENOVA II', '', 'edificio_montenova_ii_galeria.jpg', 'SAN JOAQUÍN', '', 'DLP - VIDA NUEVA', 'http://www.vidanueva.cl/proyecto-en-venta/montenova-ii/', 3, '2018-07-30 18:38:56', 0, 0),
(86, 13, '86-edificio_nunoa_plus', 'EDIFICIO ÑUÑOA PLUS', '', 'nunoa_plus_galeria.jpg', 'ÑUÑOA', '', 'DLP - DG4', 'http://www.nplus.cl/', 4, '2018-07-31 18:38:56', 0, 0),
(87, 13, '87-edificio_amapolas', 'EDIFICIO AMAPOLAS', '', 'edificio_amapolas_galeria.jpg\r\n', 'ÑUÑOA', '', 'DLP - MOLINA MOREL', 'http://www.molinamorel.cl/web/index.php/proyectos/nunoa-las-amapolas', 7, '2018-08-01 18:38:56', 0, 0),
(88, 13, '88-edificio_camino_farellones', 'EDIFICIO CAMINO FARELLONES', '', 'edificio_camino_farellones_galeria.jpg', 'LAS CONDES', '', 'DLP - MOLINA MOREL', 'http://www.molinamorel.cl/web/index.php/proyectos/las-condes-camino-farellones', 9, '2018-08-02 18:38:56', 0, 0),
(89, 13, '89-edificio_los_espinos', 'EDIFICIO LOS ESPINOS', '', 'los_espinos_galeria.jpg', 'LO BARNECHEA', '', 'DLP -LOS CANELOS', 'http://www.ilc.cl/los-espinos.html', 10, '2018-08-03 18:38:56', 0, 0),
(90, 13, '90-edificio_hubegana_i', 'EDIFICIO HUBEGAÑA I', '', 'edificio_hubegana_i_galeria.jpg', 'LA REINA', '', 'DLP - EXXACON', 'http://www.exxacon.cl/proyectos-en-venta/hubegana/', 11, '2018-08-04 18:38:56', 0, 0),
(91, 13, '91-edificio_hubegana_ii', 'EDIFICIO HUBEGAÑA II', '', 'edificio_hubegana_ii_galeria.jpg', 'LA REINA', '', 'DLP - EXXACON', 'http://www.exxacon.cl/proyectos-en-venta/hubegana2/', 12, '2018-08-05 18:38:56', 0, 0),
(92, 13, '92-edificio_walk', 'EDIFICIO WALK', '', 'edificio_walk_galeria.jpg', 'VITACURA', '', 'DLP - EXXACON', 'http://www.exxacon.cl/proyectos-en-venta/walk/', 14, '2018-08-06 18:38:56', 0, 0),
(93, 13, '93-edificio_sucre_mas', 'EDIFICIO SUCRE MÁS', '', 'edificio_sucre_mas_galeria.jpg', 'ÑUÑOA', '', 'DLP -VÉRTICE- PATAGONLAND', 'https://www.patagonland.cl/proyectos/sucre-mas/', 14, '2018-08-07 18:38:56', 0, 0),
(94, 13, '94-condominio_camino_otonal_1037', 'CONDOMINIO CAMINO OTOÑAL 1037', '', 'condominio_camino_otonal_1037_galeria.jpg', 'LAS CONDES', '', 'DLP ', 'http://caminootonal1037.cl/', 8, '2018-08-08 18:38:56', 0, 1),
(95, 15, '95-edificio_alto_velo', 'EDIFICIO ALTO VELO', '', 'edificio_alto_velo_galeria.jpg', 'BOGOTÁ, COLOMBIA', '', '', '', 13, '2018-08-09 18:38:56', 0, 0),
(96, 14, '96-edificio_flexus', 'EDIFICIO FLEXUS', '', 'edificio_flexus_galeria.jpg', 'PROVIDENCIA', '', 'DLP - ARMAS', 'https://www.iarmas.cl/proyectos/flexus/', 5, '2018-08-10 18:38:56', 0, 0),
(97, 14, '97-edificio_hubegana_oficinas', 'EDIFICIO HUBEGAÑA OFICINAS', '', 'edificio_hubegana_oficinas_galeria.jpg', 'LA REINA', '', 'DLP - EXXACON', 'http://www.exxacon.cl/proyectos-en-venta/hubegana-oficinas/', 13, '2018-08-11 18:38:56', 0, 0),
(98, 14, '98-edificio_ichma', 'EDIFICIO ICHMA', '', 'edificio_ichma_galeria.jpg', 'LIMA, PERÚ', '', '', 'www.ichma.com.pe', 16, '2018-08-12 18:38:56', 0, 0),
(99, 17, '99-condominio_aires_del_valle', 'CONDOMINIO AIRES DEL VALLE', '', 'condominio_aires_del_valle_galeria.jpg', 'SAN FELIPE', '', 'DLP - ARMAS', 'https://www.vivehogar.cl/proyectos/aires-del-valle-san-felipe', 6, '2018-08-13 18:38:56', 0, 0),
(100, 15, '100-edificio_nuevo_centro_talca', 'EDIFICIO NUEVO CENTRO TALCA', '', 'edificio_nuevo_centro_talca_galeria.jpg', 'TALCA', '2014', '', '', 2, '2018-08-14 18:38:56', 0, 0),
(101, 15, '101-condominio_don_vicente', 'CONDOMINIO DON VICENTE', '', 'condominio_don_vicente_galeria.jpg', 'LA FLORIDA', '2009', '', '', 6, '2018-08-15 18:38:56', 0, 0),
(102, 15, '102-condominio_don_emiliano_etapa_i_y_ii', 'CONDOMINIO DON EMILIANO I & II', '', 'condominio_don_emiliano_etapa_i_y_ii_galeria.jpg', 'SANTIAGO', '2009 - 2013', '', '', 7, '2018-08-16 18:38:56', 0, 0),
(103, 15, '103-condominio_puertas_de_catedral', 'CONDOMINIO PUERTAS DE CATEDRAL', '', 'condominio_puertas_de_catedral_galeria.jpg', 'SANTIAGO', '2007', '', '', 9, '2018-08-17 18:38:56', 0, 0),
(104, 15, '104-edificio_vista_mar', 'EDIFICIO VISTA MAR', '', 'edificio_vista_mar_galeria.jpg', 'VALPARAÍSO', '2006', '', '', 10, '2018-08-18 18:38:56', 0, 0),
(105, 15, '105-edificio_robles', 'EDIFICIO ROBLES ', '', 'edificio_robles_galeria.jpg', 'LO BARNECHEA', '2006', '', '', 12, '2018-08-19 18:38:56', 0, 0),
(106, 15, '106-mirador_azul_etapa_i', 'EDIFICIO MIRADOR AZUL ', '', 'mirador_azul_etapa_i_galeria.jpg', 'LA FLORIDA', '2004', '', '', 13, '2018-08-20 18:38:56', 0, 0),
(107, 15, '107-condominio_los_alerces', 'CONDOMINIO LOS ALERCES', '', 'condominio_los_alerces_galeria.jpg', 'ESTACIÓN CENTRAL', '2004', '', '', 14, '2018-08-21 18:38:56', 0, 0),
(108, 15, '108-condominio_don_nicasio', 'CONDOMINIO DON NICASIO', '', 'condominio_don_nicasio_galeria.jpg', 'SANTIAGO', '2003', '', '', 15, '2018-08-22 18:38:56', 0, 0),
(109, 15, '109-condominio_don_domingo', 'CONDOMINIO DON DOMINGO ', '', 'condominio_don_domingo_galeria.jpg', 'INDEPENDENCIA', '2003', '', '', 16, '2018-08-23 18:38:56', 0, 0),
(110, 15, '110-edificios_gran_avenida_6001', 'EDIFICIOS GRAN AVENIDA 6001 ', '', 'edificios_gran_avenida_6001_galeria.jpg', 'SAN MIGUEL', '2001', '', '', 17, '2018-08-24 18:38:56', 0, 0),
(111, 15, '111-condominio_los_recoletos_etapa_i_y_ii', 'CONDOMINIO LOS RECOLETOS I, II & III', '', 'condominio_los_recoletos_etapa_i_y_ii_galeria.jpg', 'RECOLETA', '2000-2002-2005-2007', '', '', 18, '2018-08-25 18:38:56', 0, 0),
(112, 15, '112-edificios_bosque_playa_cachagua', 'EDIFICIOS BOSQUE PLAYA CACHAGUA', '', 'edificios_bosque_playa_cachagua_galeria.jpg', 'VALPARAÍSO', '1998', '', '', 19, '2018-08-26 18:38:56', 1, 0),
(113, 15, '113-edificio_moneda', 'EDIFICIO MONEDA', '', 'edificio_moneda_galeria.jpg', 'SANTIAGO', '1998', '', '', 20, '2018-08-27 18:38:56', 0, 0),
(114, 15, '114-edificio_san_nicolas', 'EDIFICIO SAN NICOLÁS ', '', 'edificio_san_nicolas_galeria.jpg', 'SAN MIGUEL', '1996', '', '', 22, '2018-08-28 18:38:56', 0, 0),
(115, 15, '115-edificio_novel', 'EDIFICIO NOVEL ', '', 'edificio_novel_galeria.jpg', 'SANTIAGO', '1996', '', '', 23, '2018-08-29 18:38:56', 0, 0),
(116, 15, '116-edificio_nevel', 'EDIFICIO NEVEL', '', 'edificio_nevel_galeria.jpg', 'LAS CONDES', '1994', '', '', 24, '2018-08-30 18:38:56', 0, 0),
(117, 15, '117-edificio_martin_alonso_pinzon', 'EDIFICIO MARTÍN ALONSO PINZÓN ', '', 'edificio_martin_alonso_pinzon_galeria.jpg', 'LAS CONDES', '1993', '', '', 26, '2018-08-31 18:38:56', 0, 0),
(118, 15, '118-edificio_asturias', 'EDIFICIO ASTURIAS ', '', 'edificio_asturias_galeria.jpg', 'LAS CONDES', '1993', '', '', 27, '2018-09-01 18:38:56', 0, 0),
(119, 16, '119-edificio_los_militares', 'EDIFICIO LOS MILITARES', '', 'edificio_los_militares_galeria.jpg', 'LAS CONDES', '2014', '', '', 1, '2018-09-02 18:38:56', 0, 0),
(120, 16, '120-edificio_lo_fontecilla', 'EDIFICIO LO FONTECILLA', '', 'edificio_lo_fontecilla_galeria.jpg', 'LAS CONDES', '2013', '', '', 3, '2018-09-03 18:38:56', 0, 0),
(121, 16, '121-edificio_plaza_bellet', 'EDIFICIO PLAZA BELLET', '', 'edificio_plaza_bellet_galeria.jpg', 'PROVIDENCIA', '2011', '', '', 8, '2018-09-04 18:38:56', 0, 1),
(122, 16, '122-edificio_estoril_100', 'EDIFICIO ESTORIL 100', '', 'edificio_estoril_100_galeria.jpg', 'LAS CONDES', '2010', '', '', 5, '2018-09-05 18:38:56', 0, 0),
(123, 16, '123-edificio_costanera_cosas', 'EDIFICIO COSTANERA COSAS', '', 'edificio_costanera_cosas_galeria.jpg', 'PROVIDENCIA', '2009', '', '', 4, '2018-09-06 18:38:56', 0, 0),
(124, 16, '124-edificio_estoril_50', 'EDIFICIO ESTORIL 50', '', 'edificio_estoril_50_galeria.jpg', 'LAS CONDES', '2006', '', '', 11, '2018-09-07 18:38:56', 0, 0),
(125, 16, '125-edificio_medico_el_llano', 'EDIFICIO MÉDICO EL LLANO', '', 'edificio_medico_el_llano_galeria.jpg', 'SAN MIGUEL', '1997', '', '', 21, '2018-09-08 18:38:56', 0, 0),
(126, 16, '126-edificio_conferencia', 'EDIFICIO CONFERENCIA ', '', 'edificio_conferencia_galeria.jpg', 'PROVIDENCIA', '1993', '', '', 25, '2018-09-09 18:38:56', 0, 0),
(127, 19, '127-villa_alemana', 'SAN ALBERTO DE LA FORESTA', NULL, 'villa_alemana_galeria.jpg', 'VILLA ALEMANA', '2018', '', '', 15, '2018-06-21 00:48:16', 0, 0),
(128, 5, '128-colegio_tabancura', 'COLEGIO TABANCURA', NULL, 'colegio_tabancura_galeria.jpg', 'LAS CONDES', '1997', NULL, NULL, 6, '2018-06-26 17:44:27', 0, 0),
(129, 10, '129-pichimapu', 'PICHIMAPU', NULL, 'pichimapu_galeria.jpg', 'TALCA', NULL, NULL, NULL, 19, '2018-06-28 12:03:33', 0, 0),
(130, 13, '130-san_alberto_de_la_foresta', 'SAN ALBERTO DE LA FORESTA', NULL, 'san_alberto_de_la_foresta_galeria.jpg', 'VILLA ALEMANA', NULL, NULL, NULL, 17, '2018-06-28 12:10:49', 0, 0),
(131, 1, '131-portada_de_la_florida', 'EDIFICIO PORTADA DE LA FLORIDA', NULL, 'portada_de_la_florida_galeria.jpg', 'LA FLORIDA', NULL, NULL, NULL, 20, '2018-06-28 12:17:12', 0, 0),
(132, 3, '132-portal_quillota', 'PORTAL QUILLOTA', NULL, 'portal_quillota_galeria.jpg', 'QUILLOTA', NULL, NULL, NULL, 7, '2018-06-28 12:20:37', 0, 0),
(133, 3, '133-strip_center_portales', 'STRIP CENTER PORTALES', NULL, 'strip_center_portales_galeria.jpg', 'LA FLORIDA', NULL, NULL, NULL, 8, '2018-06-28 12:23:44', 0, 0),
(134, 5, '134-colegio_san_jose_de_lampa', 'COLEGIO SAN JOSÉ DE LAMPA', NULL, 'colegio_san_jose_de_lampa_galeria.jpg', 'LAMPA', NULL, NULL, NULL, 7, '2018-06-28 12:30:49', 0, 0),
(135, 5, '135-colegio_los_alpes', 'COLEGIO LOS ALPES', NULL, 'colegio_los_alpes_galeria.jpg', 'MAIPÚ', NULL, NULL, NULL, 8, '2018-06-28 12:32:23', 0, 0),
(136, 7, '136-estacion_de_metro_san_jose_de_la_estrella', 'ESTACIÓN DE METRO SAN JOSÉ DE LA ESTRELLA - LÍNEA 4', NULL, 'metro_san_jose_galeria.jpg', 'LA FLORIDA', NULL, NULL, NULL, 10, '2018-06-28 12:34:17', 0, 0),
(137, 1, '137-parque_panorama_I_&_II', 'PARQUE PANORAMA I & II', NULL, 'parque_panorama_I_&_II_galeria.jpg', 'SANTIAGO', NULL, NULL, NULL, 21, '2018-07-03 13:09:11', 1, 0),
(138, 7, '138-socalzado_santander_isidora', 'SOCALZADO SANTANDER ISIDORA', NULL, 'socalzado_santander_isidora_galeria.jpg', 'LAS CONDES', NULL, NULL, NULL, 11, '2018-07-03 13:12:28', 0, 0),
(139, 8, '139-planta_lousiana_pacific', 'PLANTA LOUSIANA PACIFIC II', NULL, 'planta_lousiana_pacific_galeria.jpg', 'PANGUIPULLI', NULL, NULL, NULL, 20, '2018-07-03 16:24:01', 0, 0),
(140, 2, '140-planta_beirsdorf', 'PLANTA BEIRSDORF', NULL, 'planta_beirsdorf_galeria.jpg', 'MAIPÚ', NULL, NULL, NULL, 13, '2018-07-04 17:55:01', 0, 0),
(141, 2, '141-planta_de_transferencia_kdm', 'PLANTA DE TRANSFERENCIA KDM', NULL, 'planta_de_transferencia_kdm_galeria.jpg', 'CORTIJO - TIL TIL', NULL, NULL, NULL, 14, '2018-07-04 17:56:32', 0, 0),
(142, 2, '142-planta_de_concentrados_coca cola', 'PLANTA DE CONCENTRADOS COCA COLA', NULL, 'planta_de_concentrados_coca-cola_galeria.jpg', 'SAN BERNARDO', NULL, NULL, NULL, 15, '2018-07-04 17:57:10', 0, 0),
(143, 2, '143-frigorifico_rio_blanco', 'FRIGORÍFICO RÍO BLANCO', NULL, 'frigorifico_rio_blanco_galeria.jpg', 'GRANEROS', NULL, NULL, NULL, 16, '2018-07-04 17:58:06', 0, 0),
(144, 2, '144-planta_mex_y_cia', 'PLANTA MEX Y CÍA', NULL, 'planta_mex_y_cia_galeria.jpg', 'QUILICURA', NULL, NULL, NULL, 17, '2018-07-04 18:08:55', 0, 0),
(145, 2, '145-planta_agroindustrial_champion', 'PLANTA AGROINDUSTRIAL CHAMPION', NULL, 'planta_agroindustrial_champion_galeria.jpg', 'MALLOCO', NULL, NULL, NULL, 18, '2018-07-04 18:10:34', 0, 0),
(146, 2, '146-planta_de_alimentos_multiexport', 'PLANTA DE ALIMENTOS MULTIEXPORT', NULL, 'planta_de_alimentos_multiexport_galeria.jpg', 'PUERTO MONTT', NULL, NULL, NULL, 19, '2018-07-04 18:11:10', 0, 0),
(147, 2, '147-planta_agroindustrial_wasil', 'PLANTA AGROINDUSTRIAL WASIL', NULL, 'planta_agroindustrial_wasil_galeria.jpg', 'QUILICURA', NULL, NULL, NULL, 20, '2018-07-04 18:11:48', 0, 0),
(148, 1, '148-alcazaba_beach', 'ALCAZABA BEACH', NULL, 'alcazaba_beach_galeria.jpg', 'MARBELLA - ESPAÑA', NULL, NULL, NULL, 21, '2018-07-19 18:22:04', 0, 0),
(149, 1, '149-alcazaba_hills', 'ALCAZABA HILLS', NULL, 'alcazaba_hills_galeria.jpg', 'MARBELLA - ESPAÑA', NULL, NULL, NULL, 22, '2018-07-19 18:24:16', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `galeria_categoria`
--

CREATE TABLE `galeria_categoria` (
  `id_categoria` int(10) UNSIGNED NOT NULL,
  `id_galeria_seccion` int(10) UNSIGNED NOT NULL,
  `titulo` text NOT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `posicion` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `orden` int(10) UNSIGNED NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `eliminado` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `galeria_categoria`
--

INSERT INTO `galeria_categoria` (`id_categoria`, `id_galeria_seccion`, `titulo`, `foto`, `color`, `posicion`, `orden`, `fecha_creacion`, `eliminado`) VALUES
(1, 2, 'HABITACIONAL', '1-habitacional.jpg', NULL, 1, 1, '2018-05-24 18:19:49', 0),
(2, 2, 'INDUSTRIAL', '2-industrial.jpg', NULL, 1, 2, '2018-05-24 18:20:02', 0),
(3, 2, 'COMERCIAL', '3-comercial.jpg', NULL, 1, 3, '2018-05-24 18:20:18', 0),
(4, 2, 'OFICINAS', '4-oficinas.jpg', NULL, 1, 4, '2018-05-24 18:20:31', 0),
(5, 2, 'EDUCACIONAL', '5-eduacaional.jpg', NULL, 1, 5, '2018-05-24 18:20:46', 0),
(6, 2, 'VIVIENDAS SOCIALES', '6-viviendas_sociales.jpg', NULL, 1, 6, '2018-05-24 18:21:01', 0),
(7, 2, 'OTROS', '7-otros.jpg', NULL, 1, 7, '2018-05-24 18:21:20', 0),
(8, 1, 'INDUSTRIAL', NULL, NULL, 1, 1, '2018-05-24 18:25:15', 0),
(9, 1, 'HABITACIONAL', NULL, NULL, 1, 2, '2018-05-24 18:25:29', 0),
(10, 1, 'OFICINAS ', NULL, NULL, 1, 3, '2018-05-24 18:25:46', 0),
(11, 1, 'COMERCIAL', NULL, NULL, 1, 4, '2018-05-24 18:26:09', 0),
(12, 1, 'FUNDACIONES Y SUBTERRÁNOS ', NULL, NULL, 1, 5, '2018-05-24 18:26:29', 0),
(13, 3, 'HABITACIONAL', NULL, NULL, 1, 1, '2018-05-24 18:26:53', 0),
(14, 3, 'OFICINAS', NULL, NULL, 1, 2, '2018-05-24 18:27:59', 0),
(15, 4, 'HABITACIONAL', NULL, NULL, 1, 1, '2018-05-24 18:28:16', 0),
(16, 4, 'OFICINAS', NULL, NULL, 1, 2, '2018-05-24 18:28:39', 0),
(17, 3, 'VIVIENDAS SOCIALES', NULL, NULL, 1, 3, '2018-06-07 11:53:54', 0),
(18, 1, 'FUNDACIONES Y SUBTERRÁNOS ', NULL, NULL, 1, 5, '2018-06-21 00:10:27', 1),
(19, 1, 'VIVIENDAS SOCIALES', NULL, NULL, 1, 6, '2018-06-21 00:15:12', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `galeria_foto`
--

CREATE TABLE `galeria_foto` (
  `id_foto` int(10) UNSIGNED NOT NULL,
  `id_galeria` int(10) UNSIGNED NOT NULL,
  `titulo` text,
  `foto` varchar(255) NOT NULL,
  `orden` int(10) UNSIGNED NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `eliminado` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `galeria_foto`
--

INSERT INTO `galeria_foto` (`id_foto`, `id_galeria`, `titulo`, `foto`, `orden`, `fecha_creacion`, `eliminado`) VALUES
(1, 1, 'MONTENOVA I', 'montenova_i_grande.jpg', 1, '2018-05-24 18:38:39', 0),
(2, 2, 'HANNOVER I', 'hannover_i_grande.jpg', 1, '2018-05-24 18:38:40', 0),
(3, 3, 'AMAPOLAS', 'amapolas_grande.jpg', 1, '2018-05-24 18:38:41', 0),
(4, 4, 'LOS ESPINOS', 'los_espinos_grande.jpg', 1, '2018-05-24 18:38:42', 0),
(5, 5, 'MALBEC I', 'malbec_i_grande.jpg', 1, '2018-05-24 18:38:43', 0),
(6, 6, 'ÑUÑOA PLUS', 'nunoa_plus_grande.jpg', 1, '2018-05-24 18:38:44', 0),
(7, 7, 'POLO GOLF 6 Y 7', 'polo_golf_6_y_7_grande.jpg', 1, '2018-05-24 18:38:45', 0),
(8, 8, 'ALCÁNTARA I & II', 'alcantara_etapa_i_y_ii_grande.jpg', 1, '2018-05-24 18:38:46', 0),
(9, 9, 'DON VICENTE', 'don_vicente_grande.jpg', 1, '2018-05-24 18:38:47', 0),
(10, 10, 'ESPACIO WARREN', 'espacio_warren_grande.jpg', 1, '2018-05-24 18:38:48', 0),
(11, 11, 'FRAY BERNARDO', 'fray_bernardo_grande.jpg', 1, '2018-05-24 18:38:49', 0),
(12, 12, 'VISTA MAR', 'vista_mar_grande.jpg', 1, '2018-05-24 18:38:50', 0),
(13, 13, 'CALLAO', 'callao_grande.jpg', 1, '2018-05-24 18:38:51', 0),
(14, 14, 'VALLE DEL MONASTERIO', 'valle_del_monasterio_grande.jpg', 1, '2018-05-24 18:38:52', 0),
(15, 15, 'MARBELLA', 'marbella_grande.jpg', 1, '2018-05-24 18:38:53', 0),
(16, 16, 'EUROMARINA', 'euromarina_grande.jpg', 1, '2018-05-24 18:38:54', 0),
(17, 17, 'MONTECARRARA', 'montecarrara_grande.jpg', 1, '2018-05-24 18:38:55', 0),
(18, 18, 'MIRADOR DE PORTEZUELO', 'mirador_de_portezuelo_grande.jpg', 1, '2018-05-24 18:38:56', 0),
(19, 19, 'PLANTA INDUSTRIAL NESTLÉ', 'planta_industrial_nestle_grande.jpg', 1, '2018-05-25 18:38:56', 0),
(20, 20, 'PLANTA FERRERO', 'planta_ferrero_grande.jpg', 1, '2018-05-26 18:38:56', 0),
(21, 21, 'PLANTA PF I, II, III & IV', 'planta_pf_-_fase_i_ii_iii_y_iv_grande.jpg', 1, '2018-05-27 18:38:56', 0),
(22, 22, 'PLANTA INDUSTRIAL GOOD FOOD', 'planta_industrial_good_food_grande.jpg', 1, '2018-05-28 18:38:56', 0),
(23, 23, 'PLANTA INDUMOTORA PANAMERICANA', 'planta_indumotora_panamericana_grande.jpg', 1, '2018-05-29 18:38:56', 0),
(24, 24, 'PLANTA WURTH CHILE', 'planta_wurth_chile_grande.jpg', 1, '2018-05-30 18:38:56', 0),
(25, 25, 'VIÑA MONTES', 'vina_montes_grande.jpg', 1, '2018-05-31 18:38:56', 0),
(26, 26, 'VIÑA EL PRINCIPAL', 'vina_el_principal_grande.jpg', 1, '2018-06-01 18:38:56', 0),
(27, 27, 'PLANTA LOUSIANA PACIFIC', 'planta_osb_lousiana_pacific_grande.jpg', 1, '2018-06-02 18:38:56', 0),
(28, 28, 'CENTRO DE DISTRIBUCIÓN ALSACIA', 'centro_de_distribucion_alsacia_grande.jpg', 1, '2018-06-03 18:38:56', 0),
(29, 29, 'VIÑA PÉREZ CRUZ', 'vina_perez_cruz_grande.jpg', 1, '2018-06-04 18:38:56', 0),
(30, 30, 'PLANTA CECINAS SAN JORGE', 'planta_cecinas_san_jorge_grande.jpg', 1, '2018-06-05 18:38:56', 0),
(31, 31, 'HOTEL LA QUINTA', '', 1, '2018-06-06 18:38:56', 0),
(32, 32, 'PORTAL PEÑALOLÉN', 'portal_penalolen_grande.jpg', 19, '2018-06-07 18:38:56', 0),
(33, 33, 'CENTRO DEPORTIVO YUTOPIA ', '', 1, '2018-06-08 18:38:56', 0),
(34, 34, 'PORTAL LOS ANDES', 'portal_los_andes_grande.jpg', 1, '2018-06-09 18:38:56', 0),
(35, 35, 'AUDI CHILE NUEVO TERMINAL', 'audi_chile_nuevo_terminal_grande.jpg', 1, '2018-06-10 18:38:56', 0),
(36, 36, 'HOTEL Y CASINO PLAZA SOL DE LOS LAGOS', 'hotel_y_casino_plaza_sol_de_los_lagos_grande.jpg', 1, '2018-06-11 18:38:56', 0),
(37, 37, 'PEDRO DE VALDIVIA', 'pedro_de_valdivia_grande.jpg', 1, '2018-06-12 18:38:56', 0),
(38, 38, 'LBF', 'lbf_grande.jpg', 1, '2018-06-13 18:38:56', 0),
(39, 39, 'SANTA CARMEN DE CHICUREO', 'santa_carmen_de_chicureo_grande.jpg', 1, '2018-06-14 18:38:56', 0),
(40, 40, 'FRANCISCO DE AGUIRRE', 'francisco_de_aguirre_grande.jpg', 1, '2018-06-15 18:38:56', 0),
(41, 41, 'ALCÁNTARA 99', 'alcantara_99_grande.jpg', 1, '2018-06-16 18:38:56', 0),
(42, 42, 'LOS MILITARES', 'los_militares_grande.jpg', 1, '2018-06-17 18:38:56', 0),
(43, 43, 'LO FONTECILLA', 'fontecilla_grande.jpg', 1, '2018-06-18 18:38:56', 0),
(44, 44, 'PLAZA BELLET', 'plaza_bellet_grande.jpg', 1, '2018-06-19 18:38:56', 0),
(45, 45, 'COSTANERA COSAS', 'costanera_cosas_grande.jpg', 1, '2018-06-20 18:38:56', 0),
(46, 46, 'ESTORIL 100', 'estoril_100_grande.jpg', 1, '2018-06-21 18:38:56', 0),
(47, 47, 'ESTORIL 50', 'estoril_50_grande.jpg', 1, '2018-06-22 18:38:56', 0),
(48, 48, 'CAJA LOS ANDES', 'c.c.a.f_los_andes_grande.jpg', 1, '2018-06-23 18:38:56', 0),
(49, 49, 'COLEGIO ALBAMAR', 'colegio_albamar_grande.jpg', 1, '2018-06-24 18:38:56', 0),
(50, 50, 'COLEGIO PUMAHUE', 'colegio_pumahue_grande.jpg', 1, '2018-06-25 18:38:56', 0),
(51, 51, 'COLEGIO SAN FRANCISCO JAVIER', 'colegio_san_francisco_javier_grande.jpg', 1, '2018-06-26 18:38:56', 0),
(52, 52, 'DUOC, SEDE PALACIO COUSIÑO', 'duoc_sede_palacio_cousino_grande.jpg', 1, '2018-06-27 18:38:56', 0),
(53, 53, 'UNIVERSIDAD CENTRAL -  C. PARQUE ALMAGRO', 'universidad_central_-_c._parque_almagro_-_centro_deportivo_grande.jpg', 1, '2018-06-28 18:38:56', 0),
(54, 54, 'CONDOMINIO AIRES DEL VALLE', 'aires_del_valle_grande.jpg', 1, '2018-06-29 18:38:56', 0),
(55, 55, 'CONDOMINIO DON EMILIANO I & II', 'condominio_don_emiliano_etapas_i_y_ii_grande.jpg', 1, '2018-06-30 18:38:56', 0),
(56, 56, 'CONDOMINIO CATEDRAL', 'condominio_catedral_grande.jpg', 1, '2018-07-01 18:38:56', 0),
(57, 57, 'CONDOMINIO LOS RECOLETOS I & II', 'condominio_los_recoletos_etapas_i_y_ii_grande.jpg', 1, '2018-07-02 18:38:56', 0),
(58, 58, 'CONDOMINIO LOS ALERCES', 'condominio_los_alerces_grande.jpg', 1, '2018-07-03 18:38:56', 0),
(59, 59, 'CONDOMINIO DON NICASIO', 'condominio_don_nicasio_grande.jpg', 1, '2018-07-04 18:38:56', 0),
(60, 60, 'CASONA DE EVENTOS SOFÍA JOTTAR', 'casona_de_eventos_sofia_jottar_grande.jpg', 1, '2018-07-05 18:38:56', 0),
(61, 61, 'EDIFICIO EJÉRCITO BICENTENARIO', 'edificio_ejercito_bicentenario_grande.jpg', 1, '2018-07-06 18:38:56', 0),
(62, 62, 'JUZGADO LOS ANDES', 'juzgado_los_andes_grande.jpg', 1, '2018-07-07 18:38:56', 0),
(63, 63, 'CONSULTORIO CESFAM', 'consultorio_llay_llay_cesfam_grande.jpg', 1, '2018-07-08 18:38:56', 0),
(64, 64, 'MERVAL TRAMO A IV - TRAMO F & G IV', 'merval_tramo_a_etapa_iv_-_tramo_f_y_g_etapa_iv_grande.jpg', 1, '2018-07-09 18:38:56', 0),
(65, 65, 'LÍNEA 220 KV - POLPAICO', 'linea_220_kv_-_polpaico_grande.jpg', 1, '2018-07-10 18:38:56', 0),
(66, 66, 'PARROQUIA MARÍA MADRE DE LA MISERICORDIA', 'parroquia_maria_madre_de_la_misericordia_grande.jpg', 1, '2018-07-11 18:38:56', 0),
(67, 67, 'CLUB HOUSE SANTA MARÍA DEL MAR', 'club_house_santa_maria_del_mar_grande.jpg', 1, '2018-07-12 18:38:56', 0),
(68, 68, 'EDIFICIO TELETÓN', 'edificio_teleton_grande.jpg', 1, '2018-07-13 18:38:56', 0),
(69, 69, 'HOMECENTER SODIMAC', 'homecenter_sodimac_grande.jpg', 1, '2018-07-14 18:38:56', 0),
(70, 70, 'EL MAÑÍO', 'el_manio_grande.jpg', 1, '2018-07-15 18:38:56', 0),
(71, 71, 'HANNOVER II', 'hannover_ii_grande.jpg', 1, '2018-07-16 18:38:56', 0),
(72, 72, 'MONTENOVA II', 'montenova_ii_grande.jpg', 1, '2018-07-17 18:38:56', 0),
(73, 73, 'MATUCANA I', 'matucana_i_grande.jpg', 1, '2018-07-18 18:38:56', 0),
(74, 74, 'CAMINO FARELLONES', 'farellones_grande.jpg', 1, '2018-07-19 18:38:56', 0),
(75, 75, 'SUCRE', 'sucre_grande.jpg', 1, '2018-07-20 18:38:56', 0),
(76, 76, 'CONDOMINIO OTOÑAL ', 'condominio_otonal_grande.jpg', 1, '2018-07-21 18:38:56', 0),
(77, 77, 'PROSEGUR', 'prosegur_grande.jpg', 1, '2018-07-22 18:38:56', 0),
(78, 78, 'CENTRO DEPORTIVO PF   ', 'centro_deportivo_pf_grande.jpg', 1, '2018-07-23 18:38:56', 0),
(79, 79, 'OPEN MONTEMAR ', 'open_montemar_grande.jpg', 1, '2018-07-24 18:38:56', 0),
(80, 80, 'HANNOVER III', 'hannover_iii_grande.jpg', 1, '2018-07-25 18:38:56', 0),
(81, 81, 'TRANSOCEÁNICA', 'transoceanica_grande.jpg', 1, '2018-07-26 18:38:56', 0),
(82, 82, 'HOTEL MANDARIN ORIENTAL ', 'socalzado_y_subterraneos_-_hotel_de_vina_grande.jpg', 1, '2018-07-27 18:38:56', 0),
(83, 83, 'EDIFICIO VISTANOVA', 'edificio_vistanova_grande.jpg', 1, '2018-07-28 18:38:56', 0),
(84, 84, 'EDIFICIO MONTENOVA I', 'edificio_montenova_i_grande.jpg', 1, '2018-07-29 18:38:56', 0),
(85, 85, 'EDIFICIO MONTENOVA II', 'edificio_montenova_ii_grande.jpg', 1, '2018-07-30 18:38:56', 0),
(86, 86, 'EDIFICIO ÑUÑOA PLUS', 'nunoa_plus_grande.jpg', 1, '2018-07-31 18:38:56', 0),
(87, 87, 'EDIFICIO AMAPOLAS', 'edificio_amapolas_grande.jpg', 1, '2018-08-01 18:38:56', 0),
(88, 88, 'EDIFICIO CAMINO FARELLONES', 'edificio_camino_farellones_grande.jpg', 1, '2018-08-02 18:38:56', 0),
(89, 89, 'EDIFICIO LOS ESPINOS', 'los_espinos_grande.jpg', 1, '2018-08-03 18:38:56', 0),
(90, 90, 'EDIFICIO HUBEGAÑA I', 'edificio_hubegana_i_grande.jpg', 1, '2018-08-04 18:38:56', 0),
(91, 91, 'EDIFICIO HUBEGAÑA II', 'edificio_hubegana_ii_grande.jpg', 1, '2018-08-05 18:38:56', 0),
(92, 92, 'EDIFICIO WALK', 'edificio_walk_grande.jpg', 1, '2018-08-06 18:38:56', 0),
(93, 93, 'EDIFICIO SUCRE MÁS', 'edificio_sucre_mas_grande.jpg', 1, '2018-08-07 18:38:56', 0),
(94, 94, 'CONDOMINIO CAMINO OTOÑAL 1037', 'condominio_camino_otonal_1037_grande.jpg', 1, '2018-08-08 18:38:56', 0),
(95, 95, 'EDIFICIO ALTO VELO', 'edificio_alto_velo_grande.jpg', 1, '2018-08-09 18:38:56', 0),
(96, 96, 'EDIFICIO FLEXUS', 'edificio_flexus_grande.jpg', 1, '2018-08-10 18:38:56', 0),
(97, 97, 'EDIFICIO HUBEGAÑA OFICINAS', 'edificio_hubegana_oficinas_grande.jpg', 1, '2018-08-11 18:38:56', 0),
(98, 98, 'EDIFICIO ICHMA', 'edificio_ichma_grande.jpg', 1, '2018-08-12 18:38:56', 0),
(99, 99, 'CONDOMINIO AIRES DEL VALLE', 'condominio_aires_del_valle_grande.jpg', 1, '2018-08-13 18:38:56', 0),
(100, 100, 'EDIFICIO NUEVO CENTRO TALCA', 'edificio_nuevo_centro_talca_grande.jpg', 1, '2018-08-14 18:38:56', 0),
(101, 101, 'CONDOMINIO DON VICENTE', 'condominio_don_vicente_grande.jpg', 1, '2018-08-15 18:38:56', 0),
(102, 102, 'CONDOMINIO DON EMILIANO I & II', 'condominio_don_emiliano_etapa_i_y_ii_grande.jpg', 1, '2018-08-16 18:38:56', 0),
(103, 103, 'CONDOMINIO PUERTAS DE CATEDRAL', 'condominio_puertas_de_catedral_grande.jpg', 1, '2018-08-17 18:38:56', 0),
(104, 104, 'EDIFICIO VISTA MAR', 'edificio_vista_mar_grande.jpg', 1, '2018-08-18 18:38:56', 0),
(105, 105, 'EDIFICIO ROBLES ', 'edificio_robles_grande.jpg', 1, '2018-08-19 18:38:56', 0),
(106, 106, 'EDIFICIO MIRADOR AZUL ', 'mirador_azul_etapa_i_grande.jpg', 1, '2018-08-20 18:38:56', 0),
(107, 107, 'CONDOMINIO LOS ALERCES', 'condominio_los_alerces_grande.jpg', 1, '2018-08-21 18:38:56', 0),
(108, 108, 'CONDOMINIO DON NICASIO', 'condominio_don_nicasio_grande.jpg', 1, '2018-08-22 18:38:56', 0),
(109, 109, 'CONDOMINIO DON DOMINGO ', 'condominio_don_domingo_grande.jpg', 1, '2018-08-23 18:38:56', 0),
(110, 110, 'EDIFICIOS GRAN AVENIDA 6001 ', 'edificios_gran_avenida_6001_grande.jpg', 1, '2018-08-24 18:38:56', 0),
(111, 111, 'CONDOMINIO LOS RECOLETOS I & II', 'condominio_los_recoletos_etapa_i_y_ii_grande.jpg', 1, '2018-08-25 18:38:56', 0),
(112, 112, 'EDIFICIOS BOSQUE PLAYA CACHAGUA', 'edificios_bosque_playa_cachagua_grande.jpg', 1, '2018-08-26 18:38:56', 0),
(113, 113, 'EDIFICIO MONEDA', 'edificio_moneda_grande.jpg', 1, '2018-08-27 18:38:56', 0),
(114, 114, 'EDIFICIO SAN NICOLÁS ', 'edificio_san_nicolas_grande.jpg', 1, '2018-08-28 18:38:56', 0),
(115, 115, 'EDIFICIO NOVEL ', 'edificio_novel_grande.jpg', 1, '2018-08-29 18:38:56', 0),
(116, 116, 'EDIFICIO NEVEL', 'edificio_nevel_grande.jpg', 1, '2018-08-30 18:38:56', 0),
(117, 117, 'EDIFICIO MARTÍN ALONSO PINZÓN ', 'edificio_martin_alonso_pinzon_grande.jpg', 1, '2018-08-31 18:38:56', 0),
(118, 118, 'EDIFICIO ASTURIAS ', 'edificio_asturias_grande.jpg', 1, '2018-09-01 18:38:56', 0),
(119, 119, 'EDIFICIO LOS MILITARES', 'edificio_los_militares_grande.jpg', 1, '2018-09-02 18:38:56', 0),
(120, 120, 'EDIFICIO LO FONTECILLA', 'edificio_lo_fontecilla_grande.jpg', 1, '2018-09-03 18:38:56', 0),
(121, 121, 'EDIFICIO PLAZA BELLET', 'edificio_plaza_bellet_grande.jpg', 1, '2018-09-04 18:38:56', 0),
(122, 122, 'EDIFICIO ESTORIL 100', 'edificio_estoril_100_grande.jpg', 1, '2018-09-05 18:38:56', 0),
(123, 123, 'EDIFICIO COSTANERA COSAS', 'edificio_costanera_cosas_grande.jpg', 1, '2018-09-06 18:38:56', 0),
(124, 124, 'EDIFICIO ESTORIL 50', 'edificio_estoril_50_grande.jpg', 1, '2018-09-07 18:38:56', 0),
(125, 125, 'EDIFICIO MÉDICO EL LLANO', 'edificio_medico_el_llano_grande.jpg', 1, '2018-09-08 18:38:56', 0),
(126, 126, 'EDIFICIO CONFERENCIA ', 'edificio_conferencia_grande.jpg', 1, '2018-09-09 18:38:56', 0),
(127, 127, 'VILLA ALEMANA \r\nSAN ALBERTO DE LA FORESTA', 'villa_alemana_grande.jpg', 1, '2018-06-21 01:05:21', 0),
(128, 128, 'COLEGIO TABANCURA', 'colegio_tabancura_grande.jpg', 1, '2018-06-26 17:48:03', 0),
(129, 129, 'PICHIMAPU', 'pichimapu_grande.jpg', 1, '2018-06-28 12:06:47', 0),
(130, 130, 'SAN ALBERTO DE LA FORESTA', 'san_alberto_de_la_foresta_grande.jpg', 1, '2018-06-28 12:11:55', 0),
(131, 131, 'EDIFICIO PORTADA DE LA FLORIDA', 'portada_de_la_florida_grande.jpg', 1, '2018-06-28 12:17:45', 0),
(132, 132, 'PORTAL QUILLOTA', 'portal_quillota_grande.jpg', 1, '2018-06-28 12:21:18', 0),
(133, 133, 'STRIP CENTER PORTALES', 'strip_center_portales_grande.jpg', 1, '2018-06-28 12:24:09', 0),
(134, 134, 'COLEGIO SAN JOSÉ DE LAMPA', 'colegio_san_jose_de_lampa_grande.jpg', 1, '2018-06-28 12:31:10', 0),
(135, 135, 'COLEGIO LOS ALPES', 'colegio_los_alpes_grande.jpg', 1, '2018-06-28 12:32:44', 0),
(136, 136, 'ESTACIÓN DE METRO SAN JOSÉ DE LA ESTRELLA - LÍNEA 4', 'metro_san_jose_grande.jpg', 1, '2018-06-28 12:34:38', 0),
(137, 137, 'PARQUE PANORAMA I & II', 'parque_panorama_I_&_II_grande.jpg', 1, '2018-07-03 13:09:50', 0),
(138, 138, 'SOCALZADO SANTANDER ISIDORA', 'socalzado_santander_isidora_grande.jpg', 1, '2018-07-03 13:12:49', 0),
(139, 139, 'PLANTA LOUSIANA PACIFIC II', 'planta_lousiana_pacific_grande.jpg', 1, '2018-07-03 16:25:10', 0),
(140, 140, 'PLANTA BEIRSDORF', 'planta_beirsdorf_grande.jpg', 1, '2018-07-04 18:12:31', 0),
(141, 141, 'PLANTA DE TRANSFERENCIA KDM', 'planta_de_transferencia_kdm_grande.jpg', 1, '2018-07-04 18:12:55', 0),
(142, 142, 'PLANTA DE CONCENTRADOS COCA COLA', 'planta_de_concentrados_coca-cola_grande.jpg', 1, '2018-07-04 18:13:07', 0),
(143, 143, 'FRIGORÍFICO RÍO BLANCO', 'frigorifico_rio_blanco_grande.jpg', 1, '2018-07-04 18:13:51', 0),
(144, 144, 'PLANTA MEX Y CÍA', 'planta_mex_y_cia_grande.jpg', 1, '2018-07-04 18:14:23', 0),
(145, 145, 'PLANTA AGROINDUSTRIAL CHAMPION', 'planta_agroindustrial_champion_grande.jpg', 1, '2018-07-04 18:14:58', 0),
(146, 146, 'PLANTA DE ALIMENTOS MULTIEXPORT', 'planta_de_alimentos_multiexport_grande.jpg', 1, '2018-07-04 18:15:25', 0),
(147, 147, 'PLANTA AGROINDUSTRIAL WASIL', 'planta_agroindustrial_wasil_grande.jpg', 1, '2018-07-04 18:15:45', 0),
(148, 148, 'ALCAZABA BEACH', 'alcazaba_beach_grande.jpg', 1, '2018-07-19 18:23:13', 0),
(149, 149, 'ALCAZABA HILLS', 'alcazaba_hills_grande.jpg', 1, '2018-07-19 18:24:43', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `galeria_seccion`
--

CREATE TABLE `galeria_seccion` (
  `id_seccion` int(10) UNSIGNED NOT NULL,
  `id_modulo` int(10) UNSIGNED NOT NULL,
  `id_galeria_tipo` int(10) UNSIGNED DEFAULT NULL,
  `titulo` text,
  `color` varchar(150) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `posicion` tinyint(4) NOT NULL DEFAULT '2',
  `fecha_creacion` datetime NOT NULL,
  `eliminado` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `galeria_seccion`
--

INSERT INTO `galeria_seccion` (`id_seccion`, `id_modulo`, `id_galeria_tipo`, `titulo`, `color`, `foto`, `posicion`, `fecha_creacion`, `eliminado`) VALUES
(1, 28, 1, 'OBRAS<br>EN EJECUCIÓN', 'fondo-rojo', NULL, 2, '2018-05-24 18:05:50', 0),
(2, 34, 2, 'OBRAS<br>EJECUTADAS', 'fondo-verde', NULL, 1, '2018-05-24 18:11:38', 0),
(3, 35, 1, 'PROYECTOS<br>EN VENTA', 'fondo-verde', NULL, 2, '2018-05-24 18:16:23', 0),
(4, 36, 1, 'PROYECTOS<br>TERMINADOS', 'fondo-rojo', NULL, 1, '2018-05-24 18:17:27', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `galeria_tipo`
--

CREATE TABLE `galeria_tipo` (
  `id_galeria_tipo` int(10) UNSIGNED NOT NULL,
  `tipo_galeria` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `galeria_tipo`
--

INSERT INTO `galeria_tipo` (`id_galeria_tipo`, `tipo_galeria`) VALUES
(1, 'Por proyecto'),
(2, 'Por categoría');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grafico`
--

CREATE TABLE `grafico` (
  `id_grafico` int(10) UNSIGNED NOT NULL,
  `id_modulo` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `leyenda` varchar(255) DEFAULT NULL,
  `eliminado` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grafico`
--

INSERT INTO `grafico` (`id_grafico`, `id_modulo`, `titulo`, `color`, `fecha`, `leyenda`, `eliminado`) VALUES
(1, 32, 'VENTAS (UF)', 'color-verde', '2018-05-31 11:32:59', '* 2018 en proyección', 0),
(2, 33, 'M<sup>2</sup> CONSTRUIDOS', 'color-azul', '2018-05-31 13:16:08', '* 2018 proyectado', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grafico_item`
--

CREATE TABLE `grafico_item` (
  `id_grafico_dato` int(10) UNSIGNED NOT NULL,
  `id_grafico` int(10) UNSIGNED NOT NULL,
  `label` varchar(255) NOT NULL,
  `dato` varchar(255) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `eliminado` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grafico_item`
--

INSERT INTO `grafico_item` (`id_grafico_dato`, `id_grafico`, `label`, `dato`, `fecha`, `eliminado`) VALUES
(1, 1, '2009', '2059018', '2018-05-31 11:33:30', 0),
(2, 1, '2010', '2524078', '2018-05-31 11:33:51', 0),
(3, 1, '2011', '2827118', '2018-05-31 11:34:13', 0),
(4, 1, '2012', '3172043', '2018-05-31 11:34:51', 0),
(5, 1, '2013', '3199835', '2018-05-31 11:35:03', 0),
(6, 1, '2014', '3037955', '2018-05-31 11:35:16', 0),
(7, 1, '2015', '3259256', '2018-05-31 11:35:53', 0),
(8, 1, '2016', '3336559', '2018-05-31 11:36:06', 0),
(9, 1, '2017', '3327048', '2018-05-31 11:36:21', 0),
(10, 1, '2018', '3500000', '2018-05-31 11:36:35', 0),
(11, 2, '2009', '125500', '2018-05-31 13:16:34', 0),
(12, 2, '2010', '149820', '2018-05-31 13:16:46', 0),
(13, 2, '2011', '154907', '2018-05-31 13:16:59', 0),
(14, 2, '2012', '137468', '2018-05-31 13:17:12', 0),
(15, 2, '2013', '115836', '2018-05-31 13:17:24', 0),
(16, 2, '2014', '107305', '2018-05-31 13:17:37', 0),
(17, 2, '2015', '114647', '2018-05-31 13:17:49', 0),
(18, 2, '2016', '118537', '2018-05-31 13:17:59', 0),
(19, 2, '2017', '120100', '2018-05-31 13:18:13', 0),
(20, 2, '2018', '125000', '2018-05-31 13:18:22', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `header`
--

CREATE TABLE `header` (
  `id_header` int(10) UNSIGNED NOT NULL,
  `id_modulo` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `texto` text,
  `color` varchar(50) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `orden` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `eliminado` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `header`
--

INSERT INTO `header` (`id_header`, `id_modulo`, `titulo`, `texto`, `color`, `imagen`, `orden`, `fecha_creacion`, `eliminado`) VALUES
(1, 3, 'EMPRESA', 'En 1981, tres amigos se reunieron y decidieron que era el momento de cumplir su sueño y crear su propia empresa constructora.\r\n\r\nNo tenían sede ni equipo humano a cargo, eran ellos tres con una gran idea y mucha voluntad para hacerla realidad. Y así, con pocas personas y un grupo de clientes que creyó en su capacidad y compromiso, partió esta empresa.\r\n\r\nLa sigla DLP representa las iniciales del apellido de los protagonistas de esta historia: Javier <strong>D</strong>arraïdou, Pelayo <strong>L</strong>arrain y José Manuel <strong>P</strong>oblete.\r\n\r\nCon el paso del tiempo, lograron consolidarse como una compañía comprometida con el rubro, siendo socios activos de la Cámara Chilena de la Construcción (CChC). Han desarrollado obras de construcción e inmobiliarias en todo el territorio chileno, España, Perú y Colombia.', 'fondo-verde', 'empresa_empresa.jpg', 1, '2018-05-16 08:13:44', 0),
(2, 4, 'CONSTRUCTORA', 'Construimos una experiencia única, con un servicio diferenciador, relevante y sostenible, con procesos soportados en nuestra transparencia, calidad y buena relación con el cliente antes, durante y después del contrato, y en la posventa.\r\n\r\nNos orienta nuestro profesionalismo, flexibilidad y voluntad para resolver inconvenientes durante todos los procesos.', 'fondo-darkgrey', 'constructora_principal.jpg', 1, '2018-05-16 08:15:07', 0),
(3, 5, 'INMOBILIARIA', 'A través de nuestra Inmobiliaria DLP desarrollamos y potenciamos proyectos en todo el país, atendiendo las necesidades del mercado.', 'fondo-rojo', 'inmobiliaria_inmobiliaria.jpg', 1, '2018-05-16 08:15:43', 0),
(4, 6, 'PERSONAS', 'Los colaboradores nos aportan conocimiento y son parte fundamental para nuestro crecimiento sostenible y la consolidación como constructora. Nos preocupamos de su desarrollo dentro del mejor clima laboral y de que cuenten con las herramientas necesarias que les permitan crecer, en su trabajo y en lo personal junto a sus familias.', 'fondo-verde', 'personas_principal.jpg', 1, '2018-05-16 08:17:22', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idioma`
--

CREATE TABLE `idioma` (
  `id_idioma` int(10) UNSIGNED NOT NULL,
  `idioma` varchar(100) NOT NULL,
  `sigla` varchar(5) NOT NULL,
  `codigo` varchar(5) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `eliminado` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `idioma`
--

INSERT INTO `idioma` (`id_idioma`, `idioma`, `sigla`, `codigo`, `imagen`, `eliminado`) VALUES
(1, 'ESP', 'ES', 'es', 'espanol.png', 0),
(2, 'ENG', 'EN', 'en', 'ingles.png', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(10) UNSIGNED NOT NULL,
  `id_padre` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `id_idioma` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `nombre` varchar(100) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `relacion` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `tipo_link` tinyint(3) UNSIGNED DEFAULT '0' COMMENT '0 = interno / 1 = externo',
  `orden` int(11) UNSIGNED NOT NULL,
  `eliminado` tinyint(4) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id_menu`, `id_padre`, `id_idioma`, `nombre`, `alias`, `relacion`, `link`, `tipo_link`, `orden`, `eliminado`) VALUES
(1, 0, 1, 'EMPRESA', 'empresa', NULL, NULL, 0, 1, 0),
(2, 0, 1, 'CONSTRUCTORA', 'constructora', NULL, NULL, 0, 2, 0),
(3, 0, 1, 'INMOBILIARIA', 'inmobiliaria', NULL, NULL, 0, 3, 0),
(4, 0, 1, 'PERSONAS', 'personas', NULL, NULL, 0, 4, 0),
(5, 1, 1, 'Equipo humano', 'equipo_humano', NULL, NULL, 2, 1, 0),
(6, 1, 1, 'Misión, Visión y Valores', 'mision_vision_y_valores', NULL, NULL, 2, 2, 0),
(7, 1, 1, 'Ética y diversidad', 'etica_y_diversidad', NULL, NULL, 2, 3, 0),
(8, 1, 1, 'Proveedores', 'proveedores', NULL, NULL, 2, 4, 0),
(9, 1, 1, 'Comunidad y medioambiente', 'comunidades_y_medioambiente', NULL, NULL, 2, 5, 0),
(10, 2, 1, 'Obras ejecutadas', 'obras_ejecutadas', NULL, NULL, 2, 3, 0),
(11, 2, 1, 'Obras en ejecución', 'obras_en_ejecucion', NULL, NULL, 2, 2, 0),
(12, 2, 1, 'Clientes', 'clientes', NULL, NULL, 2, 1, 0),
(14, 3, 1, 'Proyectos en venta ', 'proyectos_en_venta', NULL, NULL, 2, 1, 0),
(15, 3, 1, 'Proyectos terminados', 'proyectos_terminados', NULL, NULL, 2, 2, 0),
(16, 1, 1, 'DLP en cifras', 'dlp_en_cifras', NULL, NULL, 2, 6, 0),
(17, 4, 1, 'Capacitación', 'capacitacion', NULL, NULL, 2, 2, 0),
(18, 4, 1, 'Gestión social ', 'gestion_social', NULL, NULL, 2, 3, 0),
(19, 4, 1, 'Cultura de seguridad', 'cultura_de_seguridad', NULL, NULL, 2, 4, 0),
(20, 4, 1, 'Reconocimientos', 'reconocimientos', NULL, NULL, 2, 5, 0),
(21, 4, 1, 'Trabaja con nosotros', 'trabaja_con_nosotros', NULL, NULL, 2, 6, 0),
(25, 0, 2, 'BUSINESS', 'business', NULL, NULL, 0, 1, 0),
(26, 0, 2, 'CONSTRUCTOR', 'constructor', NULL, NULL, 0, 2, 1),
(27, 0, 2, 'REAL ESTATE', 'real_estate', NULL, NULL, 0, 3, 1),
(28, 0, 2, 'PEOPLE', 'people', NULL, NULL, 0, 4, 1),
(29, 25, 2, 'Team', 'team', NULL, NULL, 2, 1, 1),
(30, 25, 2, 'Mission, vision and values', 'mission_vision_and_values', NULL, NULL, 2, 2, 1),
(31, 25, 2, 'Ethics and diversity', 'ethics_and_diversity', NULL, NULL, 2, 3, 1),
(32, 25, 2, 'Suppliers', 'suppliers', NULL, NULL, 2, 4, 1),
(33, 25, 2, 'Communities and environment', 'communities_and_environment', NULL, NULL, 2, 5, 1),
(34, 26, 2, 'Works executed', 'works_executed', NULL, NULL, 2, 2, 1),
(35, 26, 2, 'Works in progress', 'works_in_progress', NULL, NULL, 2, 3, 1),
(36, 26, 2, 'Clients', 'clients', NULL, NULL, 2, 1, 1),
(37, 25, 2, 'Sales', 'sales', NULL, NULL, 2, 7, 1),
(38, 27, 2, 'Projects for sale', 'projects_for_sales', NULL, NULL, 2, 1, 1),
(39, 27, 2, 'Finished projects', 'finished_projects', NULL, NULL, 2, 2, 1),
(40, 25, 2, 'DLP figures', 'dlp_figures', NULL, NULL, 2, 6, 1),
(41, 28, 2, 'Training', 'training', NULL, NULL, 2, 2, 1),
(42, 28, 2, 'Social management', 'social_management', NULL, NULL, 2, 3, 1),
(43, 28, 2, 'Safety culture', 'safety_culture', NULL, NULL, 2, 4, 1),
(44, 28, 2, 'Acknowledgments', 'acknowledgments', NULL, NULL, 2, 5, 1),
(45, 28, 2, 'Work with us', 'work_with_us', NULL, NULL, 2, 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_footer`
--

CREATE TABLE `menu_footer` (
  `id_menu_footer` int(11) UNSIGNED NOT NULL,
  `id_idioma` int(11) UNSIGNED NOT NULL,
  `menu` varchar(150) NOT NULL,
  `link` varchar(255) NOT NULL,
  `tipo_link` int(11) NOT NULL DEFAULT '1',
  `icono` varchar(150) DEFAULT NULL,
  `orden` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `menu_footer`
--

INSERT INTO `menu_footer` (`id_menu_footer`, `id_idioma`, `menu`, `link`, `tipo_link`, `icono`, `orden`) VALUES
(1, 1, 'Proveedores', 'https://www.globalecbusiness.com/InicioGECB/PersonalizadaF.asp', 1, 'proveedores.svg', 1),
(2, 1, 'Isonet', 'http://apps.isonet.cl/dlp/sis_menu.html', 1, 'isonet.svg', 2),
(3, 1, 'Ley 16.744', 'http://www.dlp.cl/ley16744/', 1, 'ley.svg', 3),
(4, 2, 'Suppliers', 'https://www.globalecbusiness.com/InicioGECB/PersonalizadaF.asp', 1, 'proveedores.svg', 1),
(5, 2, 'Isonet', 'http://apps.isonet.cl/dlp/sis_menu.html', 1, 'isonet.svg', 2),
(6, 2, 'Ley 16.744', 'http://www.dlp.cl/ley16744/', 1, 'ley.svg', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `id_modulo` int(10) UNSIGNED NOT NULL,
  `id_tipo_modulo` int(10) UNSIGNED NOT NULL,
  `id_pagina` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `orden` int(10) UNSIGNED NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `eliminado` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`id_modulo`, `id_tipo_modulo`, `id_pagina`, `nombre`, `alias`, `color`, `orden`, `fecha_creacion`, `eliminado`) VALUES
(1, 1, 1, NULL, NULL, NULL, 1, '2018-05-14 13:16:38', 0),
(2, 2, 1, NULL, NULL, NULL, 2, '2018-05-14 13:17:12', 0),
(3, 3, 2, 'Empresa', 'empresa', NULL, 1, '2018-05-16 07:55:55', 0),
(4, 3, 3, 'CONSTRUCTORA', 'constructora', NULL, 1, '2018-05-16 08:12:15', 0),
(5, 3, 4, 'INMOBILIARIA', 'inmobiliaria', NULL, 1, '2018-05-16 08:12:25', 0),
(6, 3, 5, 'PERSONAS', 'personas', NULL, 1, '2018-05-16 08:12:36', 0),
(7, 4, 2, 'Equipo humano', 'equipo_humano', NULL, 2, '2018-05-16 10:34:21', 0),
(8, 5, 2, 'Separador color', NULL, NULL, 3, '2018-05-16 10:34:37', 0),
(9, 5, 2, 'Separador estructura', NULL, NULL, 5, '2018-05-16 10:54:53', 0),
(10, 4, 2, 'Gerentes', 'gerentes', NULL, 4, '2018-05-16 15:17:42', 0),
(12, 6, 2, 'Gerentes de proyectos', 'gerentes_de_proyectos', NULL, 6, '2018-05-16 15:26:35', 0),
(13, 7, 2, 'Misión, Visión y Valores', 'mision_vision_y_valores', NULL, 7, '2018-05-16 16:13:43', 0),
(14, 7, 2, 'Ética y diversidad', 'etica_y_diversidad', NULL, 9, '2018-05-16 16:53:02', 0),
(15, 7, 2, 'Proveedores', 'proveedores', NULL, 10, '2018-05-16 16:54:01', 0),
(16, 7, 2, 'Comunidades y medioambiente', 'comunidades_y_medioambiente', NULL, 11, '2018-05-16 16:54:26', 0),
(17, 8, 2, 'VALORES', 'valores', NULL, 8, '2018-05-17 10:04:26', 0),
(18, 7, 5, 'CAPACITACIÓN', 'capacitacion', NULL, 2, '2018-05-18 10:20:43', 0),
(19, 5, 5, 'Separador foto', NULL, NULL, 3, '2018-05-18 10:26:53', 0),
(20, 7, 5, 'GESTIÓN SOCIAL', 'gestion_social', NULL, 4, '2018-05-18 10:28:01', 0),
(21, 7, 5, 'CULTURA DE SEGURIDAD', 'cultura_de_seguridad', NULL, 5, '2018-05-18 10:28:33', 0),
(22, 5, 5, 'Fotos trabajadores', 'fotos_trabajadores', NULL, 6, '2018-05-18 10:28:52', 1),
(23, 5, 5, 'Separador', NULL, NULL, 7, '2018-05-18 10:29:01', 1),
(24, 7, 5, 'RECONOCIMIENTOS', 'reconocimientos', NULL, 8, '2018-05-18 10:29:39', 1),
(25, 4, 5, 'Fotos reconocimientos', 'reconocimientos', 'fondo-verde', 9, '2018-05-23 12:23:02', 0),
(26, 5, 5, 'Separador', NULL, NULL, 10, '2018-05-23 12:32:05', 0),
(27, 7, 5, 'TRABAJA CON NOSOTROS', 'trabaja_con_nosotros', NULL, 11, '2018-05-23 12:33:19', 0),
(28, 9, 3, 'OBRAS EN EJECUCIÓN', 'obras_en_ejecucion', NULL, 3, '2018-05-24 17:39:22', 0),
(29, 10, 2, 'DLP EN CIFRAS', 'dlp_en_cifras', NULL, 12, '2018-05-25 12:47:24', 0),
(30, 5, 3, 'Separador', 'separador', NULL, 4, '2018-05-29 15:26:32', 0),
(31, 7, 3, 'CLIENTES', 'clientes', NULL, 2, '2018-05-29 15:42:38', 0),
(32, 11, 2, 'VENTAS', 'ventas', NULL, 13, '2018-05-29 15:53:09', 0),
(33, 11, 2, 'M<sup>2</sup> CONSTRUÍDOS', 'metros_construidos', NULL, 14, '2018-05-31 13:15:36', 0),
(34, 9, 3, 'OBRAS EJECUTADAS', 'obras_ejecutadas', NULL, 5, '2018-06-01 05:44:49', 0),
(35, 9, 4, 'PROYECTOS EN VENTA', 'proyectos_en_venta', NULL, 2, '2018-06-07 12:19:54', 0),
(36, 9, 4, 'PROYECTOS TERMINADOS\r\n', 'proyectos_terminados', NULL, 4, '2018-06-07 12:20:13', 0),
(37, 5, 4, 'Separador', NULL, NULL, 3, '2018-06-07 15:56:26', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina`
--

CREATE TABLE `pagina` (
  `id_pagina` int(10) UNSIGNED NOT NULL,
  `id_idioma` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `principal` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `fecha_creacion` datetime NOT NULL,
  `eliminado` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pagina`
--

INSERT INTO `pagina` (`id_pagina`, `id_idioma`, `titulo`, `alias`, `principal`, `fecha_creacion`, `eliminado`) VALUES
(1, 1, 'DLP Constructora Ltda.', 'inicio', 1, '2018-05-11 11:50:22', 0),
(2, 1, 'DLP Constructora Ltda. - EMPRESA', 'empresa', 0, '2018-05-11 11:52:01', 0),
(3, 1, 'DLP Constructora Ltda. - CONSTRUCTORA', 'constructora', 0, '2018-05-11 11:52:33', 0),
(4, 1, 'DLP Constructora Ltda. - INMOBILIARIA', 'inmobiliaria', 0, '2018-05-11 11:52:53', 0),
(5, 1, 'DLP Constructora Ltda. - PERSONAS', 'personas', 0, '2018-05-11 11:53:06', 0),
(6, 2, 'DLP Constructora Ltda. - BUSINESS', 'business', 0, '2018-05-11 11:54:18', 0),
(7, 2, 'DLP Constructora Ltda. - CONSTRUCTOR', 'constructor', 0, '2018-05-11 11:54:23', 0),
(8, 2, 'DLP Constructora Ltda. - REAL ESTATE', 'real_estate', 0, '2018-05-11 11:54:25', 0),
(9, 2, 'DLP Constructora Ltda. - PEOPLE', 'people', 0, '2018-05-11 11:54:27', 0),
(10, 2, 'DLP Constructora Ltda. - HOME', 'home', 1, '2018-05-11 11:55:59', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `separador`
--

CREATE TABLE `separador` (
  `id_separador` int(10) UNSIGNED NOT NULL,
  `id_modulo` int(10) UNSIGNED NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `eliminado` tinyint(3) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `separador`
--

INSERT INTO `separador` (`id_separador`, `id_modulo`, `imagen`, `color`, `nombre`, `eliminado`) VALUES
(1, 8, NULL, '#cd2e1b', NULL, 0),
(2, 9, 'empresa_descanso_1.jpg', NULL, 'Arquitectura', 0),
(3, 19, 'Copia de personas_descanso_1.jpg', NULL, NULL, 0),
(4, 22, 'trabajadores.jpg', NULL, 'Cultura de seguridad', 0),
(5, 23, 'personas_descanso_1.jpg', NULL, 'Estructura', 0),
(6, 26, 'Copia de personas_descanso_1 2.jpg', NULL, 'Arquitectura', 0),
(7, 30, 'edificios.jpg', NULL, 'Grupo de edificios', 0),
(8, 37, 'descanso_2.jpg', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `slide`
--

CREATE TABLE `slide` (
  `id_slide` int(10) UNSIGNED NOT NULL,
  `id_modulo` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `imagen_movil` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `texto1` varchar(255) DEFAULT NULL,
  `texto2` varchar(255) DEFAULT NULL,
  `orden` int(10) UNSIGNED NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `eliminado` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `slide`
--

INSERT INTO `slide` (`id_slide`, `id_modulo`, `nombre`, `imagen`, `imagen_movil`, `logo`, `texto1`, `texto2`, `orden`, `fecha_creacion`, `eliminado`) VALUES
(1, 1, 'Edificio 1', '1_los_militares_slide_1.jpg', '1_los_militares_slide_1_movil.jpg', 'DLP-logo.svg', 'CLIENTE Y CALIDAD', 'LO PRIMERO', 1, '2018-05-15 17:52:16', 0),
(2, 1, 'Edificio 2', '2_alsacia_slide_2.jpg', '2_alsacia_slide_2_movil.jpg', 'DLP-logo.svg', 'NOS DESARROLLAMOS', 'SOSTENIBLEMENTE', 2, '2018-05-15 17:52:16', 0),
(3, 1, 'Edificio 3', '3_colegio_san_fco_slide_3.jpg', '3_colegio_san_fco_slide_3_movil.jpg', 'DLP-logo.svg', 'CLIENTE Y CALIDAD', 'LO PRIMERO', 3, '2018-05-15 17:52:16', 0),
(4, 1, 'Edificio 4', '4_fray_bernardo_slide_4.jpg', '4_fray_bernardo_slide_4_movil.jpg', 'DLP-logo.svg', 'NOS DESARROLLAMOS', 'SOSTENIBLEMENTE', 4, '2018-05-15 17:52:16', 0),
(5, 1, 'Edificio 5', '5_pf_talca_slide_5.jpg', '5_pf_talca_slide_5_movil.jpg', 'DLP-logo.svg', 'CLIENTE Y CALIDAD', 'LO PRIMERO', 5, '2018-05-15 17:52:16', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `textos`
--

CREATE TABLE `textos` (
  `id_texto` int(10) UNSIGNED NOT NULL,
  `id_modulo` int(10) UNSIGNED NOT NULL,
  `titulo` text,
  `texto` text,
  `color` varchar(50) DEFAULT NULL,
  `orden` int(11) UNSIGNED DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  `eliminado` tinyint(3) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `textos`
--

INSERT INTO `textos` (`id_texto`, `id_modulo`, `titulo`, `texto`, `color`, `orden`, `fecha_creacion`, `eliminado`) VALUES
(1, 7, 'EQUIPO HUMANO', 'Con una experiencia valorada en el mercado y la importancia de tener profesionales de primer nivel que aportaran a seguir desarrollando más proyectos, comenzó el proceso de vinculación de cuatro nuevos socios. Así se complementó este equipo, todos ingenieros civiles de la Pontificia Universidad Católica (PUC).\r\n\r\nEllos entregan hoy el conocimiento de nuevas ideas y herramientas para enfrentar los desafíos que representan ser una empresa sostenible y contribuir al desarrollo del país.', 'fondo-rojo', 1, '2018-05-16 10:28:38', 0),
(2, 12, 'GERENTES DE PROYECTOS E INMOBILIARIO', 'Contamos con profesionales especializados en el manejo inmobiliario y de proyectos, quienes gerencian el desarrollo y el avance de estos. Ellos conocen cada detalle y están en el día a día, supervisando el trabajo en terreno. Lideran nuestra relación con los clientes, son los responsables del resultado de las obras.', 'fondo-verde', 2, '2018-05-16 15:26:11', 0),
(3, 13, 'MISIÓN', 'Construimos con liderazgo y sostenibilidad las necesidades de nuestros clientes.', NULL, 1, '2018-05-16 16:30:24', 0),
(4, 13, 'VISIÓN', 'Crecer en forma sostenible en el negocio de la construcción de proyectos para terceros y para nuestra inmobiliaria, con un portafolio balanceado a lo largo del país.', NULL, 1, '2018-05-16 16:30:53', 0),
(5, 14, 'ÉTICA \r\nY DIVERSIDAD', 'Contamos con un Código de Ética en el que promovemos el comportamiento moral de directivos, trabajadores, clientes, proveedores y subcontratistas y comunidad. Nos regimos por los principios que guían el quehacer de DLP y que nos instan a vivir una cultura ética. \r\n\r\nNuestra Política de Diversidad e Inclusión nos invita a ser la mejor empresa para trabajar, con foco en las personas, orientada al cliente y a la creación de valor. Reconocemos la diversidad de las personas como parte de nuestra cultura corporativa, que se construye por las diferencias que aporta cada uno y donde todos se sientan igualmente integrados.', 'fondo-azul', 1, '2018-05-16 16:48:06', 0),
(6, 15, 'PROVEEDORES', 'Eficientes y reconocidos proveedores y subcontratistas se suman a nuestro equipo de trabajo por sus capacidades. Los elegimos porque comparten los valores y una forma de trabajar ética y responsable. Valoramos su esfuerzo para alcanzar juntos el cumplimiento de metas, plazos y obligaciones propuestas, los cuales nos ayudan a ser una empresa sostenible.', 'fondo-rojo', 2, '2018-05-16 16:49:44', 0),
(7, 16, 'COMUNIDAD Y MEDIOAMBIENTE', 'Nos preocupamos porque nuestras obras sean amigables con el medioambiente, y nos esforzamos por mitigar y controlar los impactos ambientales asociados a nuestras operaciones, cumpliendo con la normativa legal y las resoluciones de calificación ambiental relacionadas con los proyectos.\r\n\r\n<ul><li>Mantenemos las áreas libres de escombros y residuos y procuramos reducir la creación de ellos. Contratamos a empresas autorizadas para el transporte y disposición final. </li><li>Supervisamos la adecuada manipulación de combustibles y materiales peligrosos, así como su almacenamiento.</li></ul>', 'fondo-verde', 1, '2018-05-16 16:50:22', 0),
(8, 18, 'CAPACITACIÓN', 'El Programa de Capacitación y la gestión de actividades orientadas a nuestros trabajadores son los principales pilares para el desarrollo del capital humano. Es importante que nuestros colaboradores crezcan permanentemente, mejorando su nivel profesional, técnico y/o el conocimiento en el oficio de la construcción. Contamos con un Plan de Capacitación que es parte del programa “Yo crezco, DLP también”.', 'fondo-rojo', 1, '2018-05-18 10:25:04', 0),
(9, 20, 'GESTIÓN SOCIAL', 'Nos importa el bienestar de nuestra gente. Realizamos actividades a través de programas como entrega de becas de estudios, vivienda propia, subsidios, campañas de salud y otros que ofrecen la red estatal y entidades pertenecientes a la Cámara Chilena de la Construcción (CChC). Queremos seguir contribuyendo al mejoramiento de la calidad de vida de nuestros colaboradores y jubilados.', 'fondo-azul', 1, '2018-05-23 12:15:49', 0),
(10, 21, 'CULTURA DE SEGURIDAD', 'La prevención de riesgos es nuestro eje central para la protección integral de nuestros colaboradores, en obras y en oficina. Esto nos permite contar con un Programa de Cultura de Seguridad, en el cual el liderazgo visible de la línea de mando es fundamental para generar un comportamiento seguro en los trabajadores. Vivir la seguridad y protegernos son las premisas de este compromiso, acompañados por Mutual de Seguridad de la CChC, a través de la implementación del Programa Garantizado de Prevención (PGP), las 7 Reglas de Oro y el Programa de Empresa Competitiva (PEC). ', NULL, 1, '2018-05-23 12:18:48', 0),
(11, 25, 'RECONOCIMIENTOS', 'Nuestro compromiso con las personas ha sido reconocido por la Cámara Chilena de la Construcción (CChC) en varias ocasiones.', NULL, 1, '2018-05-23 12:21:52', 0),
(12, 27, 'TRABAJA CON NOSOTROS', 'Con cada proyecto que desarrollamos reflejamos el compromiso con los clientes, velando por la calidad de la construcción, el cuidado del medioambiente y las comunidades, así como la seguridad y el bienestar de nuestros colaboradores.\r\n\r\nTe invitamos a sumarte a nuestro equipo y a postular de acuerdo con tu perfil. ', NULL, 1, '2018-05-23 12:35:21', 0),
(13, 31, 'CLIENTES', 'Nos mueve la calidad, el compromiso y la responsabilidad para atender a nuestros clientes en todas las etapas, desde captar sus necesidades y expectativas hasta lograr su satisfacción final. Desarrollamos procesos con criterio y métodos que aseguran la operación, sostenibilidad y control adecuado. \r\n\r\nContamos con un Sistema de Gestión de Calidad (SGC) flexible y que se adapta a cada proyecto, respaldado en una Política de Calidad que busca satisfacer los requerimientos de nuestros clientes, con una rentabilidad adecuada, cumpliendo los requisitos legales y reglamentos.', NULL, NULL, '2018-05-29 15:45:49', 0),
(14, 28, 'OBRAS EN EJECUCIÓN', NULL, NULL, NULL, '2018-06-01 05:41:55', 0),
(15, 34, 'OBRAS EJECUTADAS', NULL, NULL, NULL, '2018-06-01 05:45:51', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_modulo`
--

CREATE TABLE `tipo_modulo` (
  `id_tipo_modulo` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `icono` varchar(100) DEFAULT NULL,
  `tabla` varchar(255) NOT NULL,
  `eliminado` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_modulo`
--

INSERT INTO `tipo_modulo` (`id_tipo_modulo`, `nombre`, `icono`, `tabla`, `eliminado`) VALUES
(1, 'Slide', NULL, 'slide', 0),
(2, 'Caluga portada', NULL, 'caluga', 0),
(3, 'Header página', NULL, 'header', 0),
(4, 'Imagen lateral color', NULL, 'lateral', 0),
(5, 'Separador', NULL, 'separador', 0),
(6, 'Imagen cuadro', NULL, 'lateralmini', 0),
(7, 'Cuadro de texto', NULL, 'cuadro', 0),
(8, 'Numeros', NULL, 'valores', 0),
(9, 'Galeria', NULL, 'galeria', 0),
(10, 'Cifras', NULL, 'cifras', 0),
(11, 'Gráfico', NULL, 'grafico', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `login` varchar(150) NOT NULL,
  `contrasena` varchar(65) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `rut` varchar(15) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  `eliminado` tinyint(3) UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `login`, `contrasena`, `nombre`, `apellido`, `rut`, `fecha_creacion`, `eliminado`) VALUES
(1, 'admin@bb.com', '$2y$10$NhtARm0rLaxAmMMlBgZYgO/Gypr4b7mdQXjfXIxvpGIXRCIQIjns2', 'Administrador', '', '', '2017-01-18 09:58:05', 0),
(2, 'eanaya', '$2y$10$JrzQfj9xw29Rkttc5mu7iuZrHX40Uq.W1JvDUPb9KGyhd9v6FIezq', 'Eliezer', 'Anaya', NULL, '2018-08-02 11:29:13', 0),
(7, 'pruebas', '$2y$10$QDCgP05FcjbxPa11oqt2e.oSilLgiepner3GYmVS3HUMvJwsqkPdi', 'prueba', 'usuario', NULL, '2018-08-02 12:44:23', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valores`
--

CREATE TABLE `valores` (
  `id_valores` int(10) UNSIGNED NOT NULL,
  `id_modulo` int(10) UNSIGNED NOT NULL,
  `icono` varchar(255) DEFAULT NULL,
  `titulo` text,
  `texto` text,
  `orden` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `eliminado` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `valores`
--

INSERT INTO `valores` (`id_valores`, `id_modulo`, `icono`, `titulo`, `texto`, `orden`, `fecha_creacion`, `eliminado`) VALUES
(1, 17, NULL, '<strong>LA EXCELENCIA</strong> ES NUESTRO FUNDAMENTO', 'Tenemos pasión por las cosas bien hechas, con innovación, creatividad y talento; buscamos la justa retribución por nuestro trabajo.', 1, '2018-05-17 10:12:01', 0),
(2, 17, NULL, '<strong>LAS PERSONAS,</strong> ANTE TODO', 'Promovemos un buen clima laboral; junto a las capacidades de cada uno, logramos crear una identidad única, la que nos brinda la oportunidad de llevar prosperidad y felicidad a nuestras familias. Nuestro equipo se desarrolla en un ambiente de cordialidad, seguridad y respeto.', 2, '2018-05-17 10:17:20', 0),
(3, 17, NULL, 'CONSTRUIMOS <strong>CONFIANZA</strong>', 'Creamos lazos de lealtad, confianza y profesionalismo con nuestros proveedores, clientes, trabajadores y accionistas, avalados por la ética en la conducción de los negocios.', 3, '2018-05-17 10:19:13', 0),
(4, 17, NULL, '<strong>CRECEMOS</strong> JUNTO AL CLIENTE', 'Ponemos toda nuestra experiencia al servicio de nuestros clientes para crear valor, logrando una relación duradera basada en la confianza mutua, la proactividad y la búsqueda de acuerdos.', 4, '2018-05-17 10:19:56', 0),
(5, 17, NULL, '<strong>TRASCENDEMOS</strong> CON LA COMUNIDAD Y EL MEDIOAMBIENTE', 'Sustentamos nuestro futuro siendo responsables con la sociedad, el medioambiente y cada comunidad donde estamos presentes. Queremos ser una empresa rentable para ser actores permanentes en el desarrollo del país.', 5, '2018-05-17 10:20:31', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caluga`
--
ALTER TABLE `caluga`
  ADD PRIMARY KEY (`id_caluga`);

--
-- Indices de la tabla `caluga_texto`
--
ALTER TABLE `caluga_texto`
  ADD PRIMARY KEY (`id_caluga_texto`);

--
-- Indices de la tabla `cifras`
--
ALTER TABLE `cifras`
  ADD PRIMARY KEY (`id_cifras`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id_configuracion`),
  ADD KEY `FK_configuracion` (`id_idioma`) USING BTREE;

--
-- Indices de la tabla `galeria`
--
ALTER TABLE `galeria`
  ADD PRIMARY KEY (`id_galeria`);

--
-- Indices de la tabla `galeria_categoria`
--
ALTER TABLE `galeria_categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `galeria_foto`
--
ALTER TABLE `galeria_foto`
  ADD PRIMARY KEY (`id_foto`);

--
-- Indices de la tabla `galeria_seccion`
--
ALTER TABLE `galeria_seccion`
  ADD PRIMARY KEY (`id_seccion`);

--
-- Indices de la tabla `galeria_tipo`
--
ALTER TABLE `galeria_tipo`
  ADD PRIMARY KEY (`id_galeria_tipo`);

--
-- Indices de la tabla `grafico`
--
ALTER TABLE `grafico`
  ADD PRIMARY KEY (`id_grafico`);

--
-- Indices de la tabla `grafico_item`
--
ALTER TABLE `grafico_item`
  ADD PRIMARY KEY (`id_grafico_dato`);

--
-- Indices de la tabla `header`
--
ALTER TABLE `header`
  ADD PRIMARY KEY (`id_header`);

--
-- Indices de la tabla `idioma`
--
ALTER TABLE `idioma`
  ADD PRIMARY KEY (`id_idioma`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD UNIQUE KEY `INX_alias` (`alias`) USING BTREE,
  ADD KEY `id_idioma` (`id_idioma`) USING BTREE;

--
-- Indices de la tabla `menu_footer`
--
ALTER TABLE `menu_footer`
  ADD PRIMARY KEY (`id_menu_footer`);

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`id_modulo`),
  ADD KEY `FK_tipo_modulo` (`id_tipo_modulo`) USING BTREE,
  ADD KEY `id_pagina` (`id_pagina`) USING BTREE;

--
-- Indices de la tabla `pagina`
--
ALTER TABLE `pagina`
  ADD PRIMARY KEY (`id_pagina`),
  ADD KEY `alias` (`alias`) USING BTREE;

--
-- Indices de la tabla `separador`
--
ALTER TABLE `separador`
  ADD PRIMARY KEY (`id_separador`),
  ADD KEY `id_modulo` (`id_modulo`) USING BTREE;

--
-- Indices de la tabla `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id_slide`),
  ADD KEY `id_modulo` (`id_modulo`) USING BTREE;

--
-- Indices de la tabla `textos`
--
ALTER TABLE `textos`
  ADD PRIMARY KEY (`id_texto`);

--
-- Indices de la tabla `tipo_modulo`
--
ALTER TABLE `tipo_modulo`
  ADD PRIMARY KEY (`id_tipo_modulo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `UQ_email` (`login`) USING BTREE;

--
-- Indices de la tabla `valores`
--
ALTER TABLE `valores`
  ADD PRIMARY KEY (`id_valores`),
  ADD KEY `id_modulo` (`id_modulo`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caluga`
--
ALTER TABLE `caluga`
  MODIFY `id_caluga` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `caluga_texto`
--
ALTER TABLE `caluga_texto`
  MODIFY `id_caluga_texto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `cifras`
--
ALTER TABLE `cifras`
  MODIFY `id_cifras` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id_configuracion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `galeria`
--
ALTER TABLE `galeria`
  MODIFY `id_galeria` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT de la tabla `galeria_categoria`
--
ALTER TABLE `galeria_categoria`
  MODIFY `id_categoria` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `galeria_foto`
--
ALTER TABLE `galeria_foto`
  MODIFY `id_foto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT de la tabla `galeria_seccion`
--
ALTER TABLE `galeria_seccion`
  MODIFY `id_seccion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `galeria_tipo`
--
ALTER TABLE `galeria_tipo`
  MODIFY `id_galeria_tipo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `grafico`
--
ALTER TABLE `grafico`
  MODIFY `id_grafico` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `grafico_item`
--
ALTER TABLE `grafico_item`
  MODIFY `id_grafico_dato` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `header`
--
ALTER TABLE `header`
  MODIFY `id_header` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `idioma`
--
ALTER TABLE `idioma`
  MODIFY `id_idioma` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `menu_footer`
--
ALTER TABLE `menu_footer`
  MODIFY `id_menu_footer` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `id_modulo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `pagina`
--
ALTER TABLE `pagina`
  MODIFY `id_pagina` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `separador`
--
ALTER TABLE `separador`
  MODIFY `id_separador` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `slide`
--
ALTER TABLE `slide`
  MODIFY `id_slide` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `textos`
--
ALTER TABLE `textos`
  MODIFY `id_texto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tipo_modulo`
--
ALTER TABLE `tipo_modulo`
  MODIFY `id_tipo_modulo` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `valores`
--
ALTER TABLE `valores`
  MODIFY `id_valores` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD CONSTRAINT `configuracion_ibfk_1` FOREIGN KEY (`id_idioma`) REFERENCES `idioma` (`id_idioma`);

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`id_idioma`) REFERENCES `idioma` (`id_idioma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD CONSTRAINT `modulo_ibfk_1` FOREIGN KEY (`id_tipo_modulo`) REFERENCES `tipo_modulo` (`id_tipo_modulo`);

--
-- Filtros para la tabla `separador`
--
ALTER TABLE `separador`
  ADD CONSTRAINT `separador_ibfk_1` FOREIGN KEY (`id_modulo`) REFERENCES `modulo` (`id_modulo`);

--
-- Filtros para la tabla `slide`
--
ALTER TABLE `slide`
  ADD CONSTRAINT `slide_ibfk_1` FOREIGN KEY (`id_modulo`) REFERENCES `modulo` (`id_modulo`);

--
-- Filtros para la tabla `valores`
--
ALTER TABLE `valores`
  ADD CONSTRAINT `valores_ibfk_1` FOREIGN KEY (`id_modulo`) REFERENCES `modulo` (`id_modulo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
