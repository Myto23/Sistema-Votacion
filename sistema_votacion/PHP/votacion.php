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

$response = ["success" => false, "message" => ""];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['full_name'], $_POST['alias'], $_POST['rut'], $_POST['email'], $_POST['region'], $_POST['candidate'], $_POST['comuna'], $_POST['heard_about_us'])) {
        $full_name = $_POST['full_name'];
        $alias = $_POST['alias'];
        $rut = $_POST['rut'];
        $email = $_POST['email'];
        $region_id = $_POST['region']; 
        $candidate_id = $_POST['candidate'];
        $comuna_id = $_POST['comuna']; 
        $heard_about_us = $_POST['heard_about_us'];

        // Obtener el nombre de la region a partir del ID
        $sql_region = "SELECT nombre FROM regiones WHERE id = ?";
        $stmt_region = $conn->prepare($sql_region);
        $stmt_region->bind_param("i", $region_id);
        $stmt_region->execute();
        $result_region = $stmt_region->get_result();

        if ($result_region->num_rows > 0) {
            $row_region = $result_region->fetch_assoc();
            $region = $row_region['nombre'];
        } else {
            $response["message"] = "Error: La región seleccionada no existe.";
            echo json_encode($response);
            exit;
        }

        // Obtener el nombre de la comuna a partir del ID
        $sql_comuna = "SELECT nombre FROM comunas WHERE id = ?";
        $stmt_comuna = $conn->prepare($sql_comuna);
        $stmt_comuna->bind_param("i", $comuna_id);
        $stmt_comuna->execute();
        $result_comuna = $stmt_comuna->get_result();

        if ($result_comuna->num_rows > 0) {
            $row_comuna = $result_comuna->fetch_assoc();
            $comuna = $row_comuna['nombre'];
        } else {
            $response["message"] = "Error: La comuna seleccionada no existe.";
            echo json_encode($response);
            exit;
        }

        // Obtener el nombre del candidato a partir del ID
        $sql_candidate = "SELECT nombre FROM candidatos WHERE id = ?";
        $stmt_candidate = $conn->prepare($sql_candidate);
        $stmt_candidate->bind_param("i", $_POST['candidate']);
        $stmt_candidate->execute();
        $result_candidate = $stmt_candidate->get_result();

        if ($result_candidate->num_rows > 0) {
            $row_candidate = $result_candidate->fetch_assoc();
            $candidate = $row_candidate['nombre'];
        } else {
            $response["message"] = "Error: El candidato seleccionado no existe.";
            echo json_encode($response);
            exit;
        }

        // Validar el alias
        if (strlen($alias) <= 5 || !preg_match('/[A-Za-z]/', $alias) || !preg_match('/[0-9]/', $alias)) {
            $response["message"] = "El alias debe tener más de 5 caracteres y contener tanto letras como números.";
            echo json_encode($response);
            exit;
        }

        // Validar el formato del correo electrónico
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $response["message"] = "El correo electrónico no es válido.";
            echo json_encode($response);
            exit;
        }

        // Limpiar el RUT
        $rut = preg_replace('/[.\-]/', '', $rut);

        // Validar el formato del RUT
        if (!preg_match("/^\d{1,8}[0-9Kk]$/", $rut)) {
            $response["message"] = "El RUT no es válido.";
            echo json_encode($response);
            exit;
        }

        // Separar el cuerpo del RUT y el dígito verificador
        $rutCuerpo = substr($rut, 0, -1);
        $rutDv = strtoupper(substr($rut, -1));
        $dvCalculado = calcularDigitoVerificador($rutCuerpo);

        if ($dvCalculado != $rutDv) {
            $response["message"] = "El RUT no es válido.";
            echo json_encode($response);
            exit;
        }

        // Verificar si el RUT o el email ya han votado
        $sql = "SELECT * FROM votos WHERE rut = ? OR email = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ss", $rut, $email);

        if (!$stmt->execute()) {
            $response["message"] = "Error al ejecutar la consulta.";
            echo json_encode($response);
            exit;
        }

        $result = $stmt->get_result();
        
        if ($result->num_rows > 0) {
            $response["message"] = "Este RUT o correo electrónico ya ha votado.";
            echo json_encode($response);
        } else {
            $insertVoterSql = "INSERT INTO votos (full_name, alias, rut, email, region, candidate, comuna, heard_about_us, voted) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 1)";
            $stmt = $conn->prepare($insertVoterSql);
            $stmt->bind_param("ssssssss", $full_name, $alias, $rut, $email, $region, $candidate, $comuna, $heard_about_us);

            if (!$stmt->execute()) {
                $response["message"] = "Error al insertar el voto.";
                echo json_encode($response);
                exit;
            }
            $response["success"] = true;
            $response["message"] = "Su voto fue exitoso, ¡Gracias por votar!";
            echo json_encode($response);
        }

        $conn->close();
    } else {
        $response["message"] = "No se proporcionaron todos los datos requeridos.";
        echo json_encode($response);
    }
}
?>
