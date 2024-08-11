<?php
//importation des fonctions de la page de config
require_once('config.php');
//creation de la classe inscription
class Inscription
{
    var $username; //nom de l'utilisateur
    var $usermail; //email de 'utiisateur
    var $userpass; //mot de passe de l'utilisateur
    var $userlevel; //niveau academique de l'utiisateur

    //creation du constructeur de la classe inscription
    public function __construct($username,$usermail,$userpass,$userlevel,$account_type) 
    {
        $this->username = $username;        
        $this->usermail = $usermail;        
        $this->userpass = $userpass;        
        $this->userlevel = $userlevel;      
        $this->account_type = $account_type; 
    }
}
//verification de l'évenement de clic sur le boutton inscription 
if (isset($_POST['incription'])) 
  {
    //recuperation des valeurs des inputs
    $name = secure_input($_POST['name']);
    $mail = secure_input($_POST['email']);
    $password = secure_password($_POST['password']);
    $level = secure_input($_POST['level']);
    $account_type = secure_input($_POST['level']);
    //creation d'une inscription
    $pop = new Inscription($name,$mail,$password,$level,$account_type);
    //insertion des marques dans les champs de la table
    $insert = "INSERT INTO `utilisateur`(name_user,password_user,mail_user,level_user,account_type)
    VALUES ( :username, :userpass , :usermail , :userlevel , :account_type )";
    //preparation de la requtte
    $insert_request = $connexion->prepare($insert);
    //liaison des marques aux vrai valeurs
    $insert_request->bindparam(':username', $pop->username);
    $insert_request->bindparam(':userpass', $pop->userpass);
    $insert_request->bindparam(':usermail', $pop->usermail);
    $insert_request->bindparam(':userlevel', $pop->userlevel);
    $insert_request->bindparam(':account_type', $pop->account_type);
    // Exécute la requête sur la base de données
    $execution->execute();
    //verification de l'execution de la requette
    if($execution)
      {
        //redirectionde l'utilisateur vers le formulaire de connexion
        header("Location: connexion.html");
      }else
      {
        echo"<script>";
        echo "alert('Une erreur est survenu veuillez verifier le nom des colonnes de votre bd dans le code')";
        echo"</script>";
      } 
  }
?>