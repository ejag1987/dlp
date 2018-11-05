SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE dlp
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

USE dlp;

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `idioma`;
DROP TABLE IF EXISTS `menu`;
DROP TABLE IF EXISTS `modulo`;
DROP TABLE IF EXISTS `pagina`;
DROP TABLE IF EXISTS `tipo_modulo`;
DROP TABLE IF EXISTS `configuracion`;

CREATE TABLE `idioma` (
  `id_idioma` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idioma` varchar(100) NOT NULL,
  `sigla` varchar(5) NOT NULL,
  `codigo` varchar(5) NOT NULL,
  `eliminado` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_idioma`),
  CONSTRAINT `FK_idioma` FOREIGN KEY (`id_idioma`) REFERENCES `menu` (`id_idioma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `menu` (
  `id_menu` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_padre` int(11) unsigned NOT NULL DEFAULT '0',
  `id_idioma` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '0=espaÃ±ol / 1=inglÃ©s',
  `nombre` varchar(100) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `relacion` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `tipo_link` tinyint(3) unsigned DEFAULT '1',
  `orden` int(11) unsigned NOT NULL,
  `eliminado` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_menu`),
  UNIQUE KEY `INX_alias` (`alias`) USING BTREE,
  KEY `id_idioma` (`id_idioma`),
  CONSTRAINT `FK_alias` FOREIGN KEY (`alias`) REFERENCES `pagina` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pagina` (
  `id_pagina` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `principal` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fecha_creacion` datetime NOT NULL,
  `eliminado` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_pagina`),
  KEY `alias` (`alias`),
  CONSTRAINT `FK_pagina` FOREIGN KEY (`id_pagina`) REFERENCES `modulo` (`id_pagina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `modulo` (
  `id_modulo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_tipo_modulo` int(10) unsigned NOT NULL,
  `id_pagina` int(10) unsigned NOT NULL,
  `orden` int(10) unsigned NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `eliminado` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_modulo`),
  KEY `FK_tipo_modulo` (`id_tipo_modulo`),
  KEY `id_pagina` (`id_pagina`),
  CONSTRAINT `FK_tipo_modulo` FOREIGN KEY (`id_tipo_modulo`) REFERENCES `tipo_modulo` (`id_tipo_modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tipo_modulo` (
  `id_tipo_modulo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `icono` varchar(100) DEFAULT NULL,
  `eliminado` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tipo_modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE `configuracion` (
  `id_configuracion` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_idioma` int(10) unsigned NOT NULL,
  `configuracion` varchar(255) NOT NULL,
  `valor` varchar(255) DEFAULT NULL,
  `eliminado` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`id_configuracion`),
  KEY `FK_configuracion` (`id_idioma`),
  CONSTRAINT `FK_configuracion` FOREIGN KEY (`id_idioma`) REFERENCES `idioma` (`id_idioma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


SET FOREIGN_KEY_CHECKS=1;

