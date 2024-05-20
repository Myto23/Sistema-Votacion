Proyecto de Votación
Descripción
Este proyecto es un formulario de votación web que permite a los usuarios registrar sus votos seleccionando candidatos y proporcionando información adicional. El formulario valida los datos del usuario y los guarda en una base de datos MySQL.

Requisitos del Sistema
XAMPP: Usado para configurar el servidor local.
PHP: Versión 7.4.3
MySQL: Versión 5.7.31
Apache: Incluido en XAMPP

Instalación
Clonar el repositorio:
https://github.com/Myto23/Sistema-Votacion.git
Mover el proyecto a la carpeta de XAMPP:
Copia el proyecto clonado en la carpeta htdocs de tu instalación de XAMPP.


Configurar la base de datos:

Inicia XAMPP y asegúrate de que Apache y MySQL están corriendo.
Abre phpMyAdmin (normalmente en http://localhost/phpmyadmin).
Crea una nueva base de datos llamada votacion.
Importa el archivo database/db.sql incluido en el proyecto para crear las tablas necesarias.
Configurar la conexión a la base de datos:

Abre el archivo database/db.php.
Asegúrate de que las credenciales de conexión a la base de datos son correctas.
php
Copiar código
$conn = new mysqli('localhost', 'root', '', 'votacion');
Ejecutar el proyecto:

Abre tu navegador web y navega a http://localhost/Sistema_votacion/Pages/votacion.html.


Estructura del Proyecto

database/: Contiene el archivo de configuración de la base de datos db.php y el archivo db.sql para la estructura de la base de datos.

PHP/: Contiene los scripts PHP para manejar las peticiones AJAX y la validación del formulario.
get_regiones.php
get_comunas.php
get_candidatos.php
votacion.php

script/: Contiene el archivo JavaScript principal votacion.js que maneja la lógica del frontend.

Style/: Contiene el archivo CSS votacion.css para el estilo del formulario.

Pages/: Contiene la página principal que incluye el formulario de votación.

Funcionalidades
Validación del formulario: Asegura que todos los campos requeridos están completos y correctos antes de enviar.
Validación de alias: Verifica que el alias tenga más de 5 caracteres y contenga tanto letras como números.
Validación de RUT: Asegura que el RUT ingresado sea válido.
Verificación de duplicados: Verifica si el RUT o el correo electrónico ya han sido utilizados para votar.
Carga dinámica de comunas y candidatos: Utiliza AJAX para cargar comunas y candidatos basados en la región seleccionada.
Uso
Llenar el formulario: Completa todos los campos requeridos y selecciona al menos dos opciones en "Cómo se enteró de nosotros?".
Enviar el formulario: Haz clic en el botón "Votar". Si todos los datos son válidos, el voto se registrará en la base de datos y los campos del formulario se limpiarán.


Problemas Comunes
Error al conectar a la base de datos: Verifica que el servidor MySQL está corriendo y que las credenciales de conexión en database/db.php son correctas.
No se cargan las comunas o candidatos: Asegúrate de que los archivos PHP de la carpeta PHP están configurados correctamente y que la base de datos contiene datos válidos