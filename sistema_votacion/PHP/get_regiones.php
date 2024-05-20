<?php
include("../database/db.php");

$sql = "SELECT id, nombre FROM regiones";
$result = $conn->query($sql);

$options = '<option value="">Seleccione una región</option>';
while ($row = $result->fetch_assoc()) {
  $options .= '<option value="' . $row['id'] . '">' . $row['nombre'] . '</option>';
}

echo $options;

$conn->close();
?>
