<?php
// Conexion a la base de datos
$conn = mysqli_connect(
    'localhost', // Dirección del servidor
    'root',      // Usuario
    '',          // Contraseña
    'sistemavotacion' // Nombre de la base de datos
);

// Verificar si la conexión es exitosa
if (!$conn) {
    die("Error de conexión: " . mysqli_connect_error());
}else{
    echo"Conexion Exitosa";
}
?>
