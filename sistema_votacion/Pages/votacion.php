<?php include("../database/db.php"); ?>

<?php
function calcularDigitoVerificador($rutCuerpo) {
    $reversedRut = strrev($rutCuerpo);
    $serie = [2, 3, 4, 5, 6, 7];
    $sum = 0;

    for ($i = 0, $len = strlen($reversedRut); $i < $len; $i++) {
        $sum += $reversedRut[$i] * $serie[$i % count($serie)];
    }

    $remainder = $sum % 11;
    $dv = 11 - $remainder;

    if ($dv == 11) {
        return '0';
    } elseif ($dv == 10) {
        return 'K';
    } else {
        return (string) $dv;
    }
}

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

        // Limpiar el RUT
        $rut = preg_replace('/[.\-]/', '', $rut);

        // Validar el formato del RUT
        if (!preg_match("/^\d{1,8}[0-9Kk]$/", $rut)) {
            die("El RUT no es válido.");
        }

        // Separar el cuerpo del RUT y el dígito verificador
        $rutCuerpo = substr($rut, 0, -1);
        $rutDv = strtoupper(substr($rut, -1));
        $dvCalculado = calcularDigitoVerificador($rutCuerpo);
        

        if ($dvCalculado != $rutDv) {
            die("El dígito verificador del RUT no es válido.");
        }

        // Verificar si el RUT o el email ya han votado
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
