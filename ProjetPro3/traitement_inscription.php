<?php
session_start();

include('connexion_bdd.php');

$nomClient = trim($_POST['nomClient']);
$prenomClient = trim($_POST['prenomClient']);
$emailClient = trim($_POST['emailClient']);
$identifiantClient = trim($_POST['identifiantClient']);
$mdpClient = $_POST['mdpClient'];

if (empty($nomClient) || empty($prenomClient) || empty($emailClient) || empty($identifiantClient) || empty($mdpClient)) {
    header("Location: inscription.php?erreur=1");
    exit();
}

$sql = "SELECT * FROM clients WHERE emailClient = :emailClient";
$stmt = $pdo->prepare($sql);
$stmt->bindParam(':emailClient', $emailClient, PDO::PARAM_STR);
$stmt->execute();

if ($stmt->rowCount() > 0) {
    header("Location: inscription.php?erreur=2");
    exit();
}

$sql = "SELECT * FROM clients WHERE identifiantClient = :identifiantClient";
$stmt = $pdo->prepare($sql);
$stmt->bindParam(':identifiantClient', $identifiantClient, PDO::PARAM_STR);
$stmt->execute();

if ($stmt->rowCount() > 0) {
    header("Location: inscription.php?erreur=3");
    exit();
}

$sql = "INSERT INTO clients (nomClient, prenomClient, emailClient, identifiantClient, mdpClient) 
        VALUES (:nomClient, :prenomClient, :emailClient, :identifiantClient, :mdpClient)";
$stmt = $pdo->prepare($sql);
$stmt->bindParam(':nomClient', $nomClient, PDO::PARAM_STR);
$stmt->bindParam(':prenomClient', $prenomClient, PDO::PARAM_STR);
$stmt->bindParam(':emailClient', $emailClient, PDO::PARAM_STR);
$stmt->bindParam(':identifiantClient', $identifiantClient, PDO::PARAM_STR);
$stmt->bindParam(':mdpClient', $mdpClient, PDO::PARAM_STR);

if ($stmt->execute()) {
    $_SESSION['user_id'] = $pdo->lastInsertId();
    $_SESSION['email'] = $emailClient;

    header("Location: inscription_succes.php");
    exit();
} else {
    header("Location: inscription.php?erreur=4");
    exit();
}
?>