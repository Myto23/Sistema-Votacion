Sistema de Votación
Este proyecto es un sistema de votación desarrollado en PHP y MySQL. A continuación, se detallan las instrucciones para configurar y ejecutar el proyecto en su entorno local.

Requisitos
XAMPP: Una distribución de Apache fácil de instalar que contiene MariaDB, PHP y Perl.
Instrucciones de instalación
Paso 1: Instalar XAMPP
Descargue e instale XAMPP desde la página oficial.
Siga las instrucciones del instalador para completar la instalación.
Paso 2: Iniciar los servicios de Apache y MySQL
Abra el Panel de Control de XAMPP.
Inicie el servicio de Apache haciendo clic en el botón "Start" junto a Apache.
Inicie el servicio de MySQL haciendo clic en el botón "Start" junto a MySQL.
Paso 3: Configurar el proyecto
Descargue o clone este repositorio en su máquina local.
bash
Copiar código
git clone
Copie la carpeta sistema_votacion del repositorio y péguela en la carpeta htdocs de su instalación de XAMPP. La ruta por defecto es C:\xampp\htdocs.
Paso 4: Configurar la base de datos
Abra su navegador web y vaya a http://localhost/phpmyadmin.
Cree una nueva base de datos llamada sistema_votacion.
Importe el archivo sistema_votacion.sql que se encuentra en la carpeta sql del proyecto. Esto creará las tablas necesarias y llenará la base de datos con los datos iniciales.
Paso 5: Acceder al sistema de votación
Abra su navegador web y vaya a http://localhost/sistema_votacion.
Debería ver la página de inicio del sistema de votación.
