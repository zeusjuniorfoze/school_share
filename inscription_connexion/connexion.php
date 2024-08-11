<?php
//importation des fonctions de la page de config
require_once('config.php');
//creation de la classe inscription
class Connexion
{

    public function __construct($usermail,$userpass) {
        $this->$usermail = $usermail;
        $this->$userpass = $userpass;
    }

}
//verification de l'évenement de clic sur le boutton connexion 
if (isset($_POST['connexion'])) {
    //recuperation des valeurs des inputs
    $mail = secure_input($_POST['email']);
    $password = secure_password($_POST['password']);
    //creation d'un objet connexion
    $connect = new Connexion($mail,$password);
    $select = "SELECT password_user,mail_user FROM `utilisateur` WHERE ( password_user = :userpass AND mail_user = :usermail)";
    //preparation de la requtte
    $select_request = $connexion->prepare($insert);
    //liaison des marques aux vrai valeurs
    $insert_request->bindparam(':userpass', $connect->$userpass);
    $insert_request->bindparam(':usermail', $connect->$usermail);
    // Exécute la requête sur la base de données
    $execution->execute();
    if($execution){
        //creation d'une session qui contient les infos pour l'authentification del'utilisateur
        $_SESSION['infos_users'] = array('email' => $pop->usermail,
                                        'password' => $pop->userpass
                                        );
        //redirectionde l'utilisateur vers le formulaire de connexion
       header("Location: acceuil_client.html");
    }else {
        echo"<script>";
        echo "alert('cet utilisateur n'a pas été trouver, veuillez reéssayer')";
        echo"</script>";
    }
}
?>