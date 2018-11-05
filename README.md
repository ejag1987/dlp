SITIO WEB DLP
====================

Sitio y administrador de DLP.

Requerimientos
==============

- Docker

Si no se va a utilizar docke (no recomendado) es necesario tener un servidor con
los siguienres requerimientos:

- PHP 5.6 o superior.
- MySQL 5.5 o superior.
- Apache 2.4 o superior.
- El módulo ```mod_rewrite``` activado en el apache.
- Los módulos ```mbstring```, ```intl```, ```mcrypt``` y ```mysqli``` activados en el
php.

Instalación
-----------

Una vez que se clona el poyecto se debe eliminar el archivo ```eliminar``` 
que se encuentra dentro del directorio ```database```.


Si es la primera vez que se crea el docker es necesario ejecutar:

```docker build -t extend/webserver .```

Despues de que la imagen esta creada en el host, se pueden comenzar 
los contenedores con:

```docker-compose up -d```

Para detener los contenedores:

```docker stop webserver```  
```docker stop mysqlserver```

-------------------------------
Para probar los virtual host con el docker se deberian de agregar estas lineas al
archivo hosts:

```
127.0.0.1		www.dlp-constructora.cl
127.0.0.1		admin.dlp-constructora.cl
```

