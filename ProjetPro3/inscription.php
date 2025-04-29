<?php // inscription.php ?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription - Easy Bee</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <!-- Header -->
    <?php include('header.php'); ?>

    <!-- Section inscription -->
    <section class="inscription">
        <h2>Inscription</h2>
        <p class="pinscription">Pour accéder à nos formations et suivre votre progression, veuillez vous inscrire dès maintenant.</p>

        <form action="traitement_inscription.php" method="POST" class="inscription-form">
            <div class="prenometnom">
                <div class="prenom">
                    <label for="prenomClient">Prénom :</label>
                    <input type="text" id="prenomClient" name="prenomClient" required>
                </div>
                <div class="nom">
                    <label for="nomClient">Nom :</label>
                    <input type="text" id="nomClient" name="nomClient" required>
                </div>
            </div>

            <div class="emailetpassword">
                <div class="email">
                    <label for="emailClient">Email :</label>
                    <input type="email" id="emailClient" name="emailClient" required>
                </div>
                <div class="motdepasse">
                    <label for="mdpClient">Mot de passe :</label>
                    <input type="password" id="mdpClient" name="mdpClient" required>
                </div>
            </div>

            <div class="username">
                <div>
                    <label for="identifiantClient">Nom d'utilisateur :</label>
                    <input type="text" id="identifiantClient" name="identifiantClient" required>
                </div>
            </div>

            <button type="submit" class="btn-primary">S'inscrire</button>
        </form>
        <p>Vous possédez déjà un compte ? <a href="connexion.php">Connectez-vous ici</a></p>
    </section>

    <!-- Footer -->
    <?php include('footer.php'); ?>
</body>
</html>