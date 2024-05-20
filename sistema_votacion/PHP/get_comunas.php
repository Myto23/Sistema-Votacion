<?php
include("../database/db.php");

if (isset($_POST['region_id'])) {
  $regionId = $_POST['region_id'];

  $sql = "SELECT id, nombre FROM comunas WHERE region_id = ?";
  $stmt = $conn->prepare($sql);
  $stmt->bind_param("i", $regionId);
  $stmt->execute();
  $result = $stmt->get_result();

  $options = '<option value="">Seleccione una comuna</option>';
  while ($row = $result->fetch_assoc()) {
    $options .= '<option value="' . $row['id'] . '">' . $row['nombre'] . '</option>';
  }

  echo $options;
} else {
  echo '<option value="">Seleccione una comuna</option>';
}

$conn->close();
?>
