<?php include("../database/db.php"); ?>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['full_name'], $_POST['alias'], $_POST['rut'], $_POST['email'], $_POST['region'], $_POST['candidate'], $_POST['comuna'], $_POST['heard_about_us'])) {
        $full_name = $_POST['full_name'];
        $alias = $_POST['alias'];
        $rut = $_POST['rut'];
        $email = $_POST['email'];
        $region = $_POST['region'];
        $candidate = $_POST['candidate'];
        $comuna = $_POST['comuna'];
        $heard_about_us = $_POST['heard_about_us'];

        if (!preg_match("/^\d{7,8}[0-9]$/", $rut)) {
            die("El RUT no es válido. Debe contener solo números, en caso de terminar en K reemplazar por 0.");
        }

        $sql = "SELECT * FROM votos WHERE rut = ? OR email = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ss", $rut, $email);

        if (!$stmt->execute()) {
            die("Error al ejecutar la consulta.");
        }

        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            echo "Este RUT o correo electrónico ya ha votado.";
        } else {
            $insertVoterSql = "INSERT INTO votos (full_name, alias, rut, email, region, candidate, comuna, heard_about_us, voted) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 1)";
            $stmt = $conn->prepare($insertVoterSql);
            $stmt->bind_param("ssssssss", $full_name, $alias, $rut, $email, $region, $candidate, $comuna, $heard_about_us);

            if (!$stmt->execute()) {
                die("Error al insertar el voto.");
            }
            echo "Su voto fue exitoso, ¡Gracias por votar!";
        }

        $conn->close();
    } else {
        echo "No se proporcionaron todos los datos requeridos.";
    }
} 
?>