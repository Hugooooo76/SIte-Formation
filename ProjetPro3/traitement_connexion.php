<?php
session_start();

include('connexion_bdd.php'); // Assurez-vous que ce fichier contient la connexion à votre base de données.

$emailClient = trim($_POST['emailClient']);
$mdpClient = $_POST['mdpClient'];

// Vérification que les champs ne sont pas vides
if (empty($emailClient) || empty($mdpClient)) {
    header("Location: connexion.php?erreur=1"); // Erreur si un champ est vide
    exit();
}

// Recherche de l'utilisateur dans la base de données par email
$sql = "SELECT * FROM clients WHERE emailClient = :emailClient";
$stmt = $pdo->prepare($sql);
$stmt->bindParam(':emailClient', $emailClient, PDO::PARAM_STR);
$stmt->execute();

if ($stmt->rowCount() == 0) {
    // Si aucun utilisateur n'est trouvé avec cet email
    header("Location: connexion.php?erreur=3"); // L'email n'existe pas
    exit();
}

// Si l'email existe, on vérifie le mot de passe
$user = $stmt->fetch(PDO::FETCH_ASSOC);

// Vérification du mot de passe en clair
if ($mdpClient !== $user['mdpClient']) {
    // Si le mot de passe est incorrect
    header("Location: connexion.php?erreur=2"); // Mot de passe incorrect
    exit();
}

// Si l'email et le mot de passe sont corrects
$_SESSION['user_id'] = $user['idUtilisateur'];
$_SESSION['email'] = $emailClient;

header("Location: index.php?success=1"); // Redirection vers la page d'accueil en cas de succès
exit();
?>