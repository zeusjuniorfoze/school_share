<?php
//demarrage de la session
session_start();
// generation automatique de l'id de la session
session_regenerate_id();

try {
    // Informations d'identification
    define('DB_SERVER', 'localhost');
    define('DB_USERNAME', 'root');
    define('DB_PASSWORD', '');
    define('DB_NAME', 'school_share');

    // Connexion a la base de donnees MySQL 
    $connexion = new PDO("mysql:host=DB_SERVER; dbname=DB_NAME", DB_USERNAME, DB_PASSWORD);

    // Verifier la connexion
    if (!$connexion) {
        $connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
} catch (PDOexception $e) {
    echo '<div style="text-align: center; color: orange; font-size: 40px;">Erreur de connexion à la base de données. Veuillez démarrer MySQL.</div>';
    die(); // Arrêter l'exécution du script
}

//creation de la fonction de verification des champs de saisi
function secure_input($input)
{
    if (!empty($input)) {
        $input = htmlspecialchars($input);
        $input = addslashes($input);
        $input = trim($input);
        $input = strip_tags($input);
        $input = stripslashes($input);
        $input = stripcslashes($input);
    } else {
        echo '<h3 style="font-weight:bold;color:red;">';
        echo "Il semble qu'un champs soit vide, veuillez le remplir !!!";
        echo '</h3>';
    }
    return $input;
}

// creation de la fonction de chiffrement du mot entre dans le champs
function secure_password($password)
{
    if (isset($password)) {
        $password = sha1($password);
        $password = md5($password);
        return $password;
    } else {
        echo '<h3 style="font-weight:bold;color:red;">';
        echo "Il semble que n'avez pas entre de mot de passe, veuillez le remplir !!!";
        echo '</h3>';
    }
}
