<?php // inscription_succes.php ?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription réussie - Easy Bee</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .success-message {
            text-align: center;
            font-size: 2em;
            margin-top: 50px;
            font-weight: bold;
            color: green;
        }

        .success-description {
            text-align: center;
            font-size: 1.5em;
            margin-top: 20px;
            color: #333;
        }

        .btn-home {
            display: block;
            margin: 30px auto;
            padding: 10px 20px;
            width: 200px;
            font-size: 1.2em;
            text-decoration: none;
            background-color: #28a745;
            color: white;
            border-radius: 5px;
        }

        .btn-home:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <?php include('header.php'); ?>

    <section class="inscription-succes">
        <div class="success-message">
            Inscription réussie !
        </div>
        <div class="success-description">
            Vous pouvez maintenant utiliser votre compte pour vous inscrire à une formation.
        </div>

        <a href="connexion.php" class="btn-home">Se connecter</a>
    </section>

    <?php include('footer.php'); ?>
</body>
</html>