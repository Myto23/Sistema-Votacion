<?php
include("../database/db.php"); 

$sql = "SELECT id, nombre FROM candidatos";
$result = $conn->query($sql);

$options = '<option value="">Seleccione un candidato</option>';
while ($row = $result->fetch_assoc()) {
  $options .= '<option value="' . $row['id'] . '">' . $row['nombre'] . '</option>';
}

echo $options;

$conn->close();
?>
